import os
import sys
import json
import time
import logging

import boto3

# Initialise logging
logger = logging.getLogger("S3-PURGE")
logger.setLevel(os.environ.get("LOG_LEVEL", logging.INFO))
stdout_handler = logging.StreamHandler(stream=sys.stdout)
logger.addHandler(stdout_handler)

# Initialise AWS resources
s3 = boto3.resource("s3", region_name=os.environ.get("AWS_REGION"))
sqs = boto3.resource("sqs", region_name=os.environ.get("AWS_REGION"))
queue = sqs.get_queue_by_name(QueueName=os.environ.get("AWS_SQS_QUEUE"))
logger.info(f"SQS Queue: {queue}")
sqs_batch_size = int(os.environ.get("SQS_BATCH_SIZE", 1))
logger.info(f"SQS Batch Size: {sqs_batch_size}")

# Other initialisation
backoff_sleep = int(os.environ.get("BACKOFF_SLEEP", 1))
max_backoff_sleep = int(os.environ.get("MAX_BACKOFF_SLEEP", 32))

# Process messages in infinite loop
while True:

    try:
        # Read messages from SQS queue
        messages = queue.receive_messages(MaxNumberOfMessages=sqs_batch_size)
        message_len = len(messages)
        logger.debug(f"Read {message_len} messages from queue.")
        if message_len == 0:
            logger.debug(f"No messages. Sleep {backoff_sleep}.")
            time.sleep(backoff_sleep)
            backoff_sleep = min(backoff_sleep * 2, max_backoff_sleep)
            continue
        backoff_sleep = int(os.environ.get("BACKOFF_SLEEP", 1))

        # Process all messages
        for message in messages:
            message_json = json.loads(message.body)
            logger.debug(f"Message JSON: {message_json}")
            logger.info(f"Delete object {message_json['aws']['s3']['object']['key']} from bucket {message_json['aws']['s3']['bucket']['name']}")
            # Delete object from S3
            s3_delete = s3.Object(message_json['aws']['s3']['bucket']['name'], message_json['aws']['s3']['object']['key']).delete()
            logger.info(f"S3 delete response: {s3_delete['ResponseMetadata']['HTTPStatusCode']}")
            if s3_delete['ResponseMetadata']['HTTPStatusCode'] != 204:
                logger.error(s3_delete['ResponseMetadata'])
                continue
            # Delete message from SQS
            sqs_delete = message.delete()
            logger.info(f"SQS delete response: {sqs_delete['ResponseMetadata']['HTTPStatusCode']}")
            if sqs_delete['ResponseMetadata']['HTTPStatusCode'] != 200:
                logger.error(sqs_delete['ResponseMetadata'])
                continue

    except Exception as ex:
        logger.error("Exception: {0} {1!r}".format(type(ex).__name__, ex.args))
        time.sleep(max_backoff_sleep)

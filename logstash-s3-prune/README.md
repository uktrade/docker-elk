# logstash-s3-prune
This container image is used to prune an S3 bucket of log file objects, based on messages posted in an SQS queue. The intention is to post messages to the queue from a Logstash output (once the file is processed).  
Note that the SQS queue name must be specified, but the S3 bucket is not. This is read from the SQS message.  
The task or container running the script must have appropriate IAM permissions to read the queue and delete from the bucket and the queue - see below.  
The queue and bucket are assumed to be in the same region.  
An exponential backoff increases exponentially (up to a max limit) if the queue is empty. See env vars.

## Environment Variables
| Variable    | Description | Required | Default |
| ----------- | ----------- | -------- | ------- |
| AWS_REGION | Region of the S3 bucket and SQS queue | Yes | (none) |
| AWS_SQS_QUEUE | The name of the SQS queue to read | Yes | (none) |
| SQS_BATCH_SIZE | Max number of messages to read per batch | No | 1 |
| BACKOFF_SLEEP | Initial value of exponential backoff sleep | No | 1 |
| MAX_BACKOFF_SLEEP | Max value of exponential backoff sleep | No | 32 |
| LOG_LEVEL | Standard log level | No | INFO |

## IAM Permissions
SQS required permissions:
- sqs:GetQueueUrl
- sqs:ReceiveMessage
- sqs:DeleteMessage

S3 required permissions:
- s3:ListBucket
- s3:DeleteObject

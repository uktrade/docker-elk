FROM python:3.10.6

RUN pip install boto3

COPY s3_prune.py .

CMD ["python3","s3_prune.py"]

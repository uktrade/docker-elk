# cloudwatch-kinesis-sentinel
Dockerfile and generic Logstash pipeline config pushing a CloudWatch log group to Sentinel (via Kinesis).  
The image contains one pipeline configuration, which deals with just one CloudWatch log group and one Sentinel table.  
Multiple instances of the container can be run separately for each log group.

## Required Environment Variables

| Service      | Variable                    | 
| ------------ | --------------------------- |
| AWS:         | region                      |
| CloudWatch:  | cloudwatch_log_group        |
| Kinesis:     | kinesis_stream_name         |
|              | application_name            |
|              | checkpoint_interval_seconds |
| Sentinel:    | client_app_Id               |
|              | client_app_secret           |
|              | tenant_id                   |
|              | data_collection_endpoint    |
|              | dcr_immutable_id            |
|              | dcr_stream_name             |

# logstash-sentinel
Dockerfile and Logstash pipeline config for the following pipelines:

| Pipeline         | Config File           | Description                       |
| ---------------- | --------------------- | --------------------------------- |
| sentinel_export  | sentinel.conf         | PaaS Application logs to Sentinel |
| sentinel_aws_vpn | sentinel_aws_vpn.conf | AWS VPN logs to Sentinel          |

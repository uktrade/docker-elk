# logstash-sentinel-vpc
Dockerfile and Logstash pipeline config for AWS VPC Flow Logs.

## VPC flow-log format
The flow-log format must be set with the environment variable `VPC_FLOWLOG_FORMAT`. Note that `pkt-srcaddr` and `pkt-dstaddr` are required since they are used in the filter.

### Examples:
|   | AWS Definition | Logstash Definition (`VPC_FLOWLOG_FORMAT` env var) |
| - | -------------- | -------------------------------------------------- |
| AWS Default | version account-id interface-id srcaddr dstaddr srcport dstport protocol packets bytes start end action log-status | %{INT:version} %{DATA:account-id} %{DATA:interface-id} %{IPV4:srcaddr} %{IPV4:dstaddr} %{INT:srcport} %{INT:dstport} %{INT:protocol} %{INT:packets} %{INT:bytes} %{INT:start} %{INT:end} %{DATA:action} %{DATA:log-status} |
| Custom Example | version account-id interface-id srcaddr dstaddr srcport dstport protocol packets bytes start end action log-status subnet-id instance-id tcp-flags pkt-srcaddr pkt-dstaddr flow-direction | %{INT:version} %{DATA:account-id} %{DATA:interface-id} %{IPV4:srcaddr} %{IPV4:dstaddr} %{INT:srcport} %{INT:dstport} %{INT:protocol} %{INT:packets} %{INT:bytes} %{INT:start} %{INT:end} %{DATA:action} %{DATA:log-status} %{DATA:subnet-id} %{DATA:instance-id} %{INT:tcp-flags} %{IPV4:pkt-srcaddr} %{IPV4:pkt-dstaddr} %{DATA:flow-direction} |

_(Note: some of the `INT` types in these examples should probably, strictly speaking, be `POSINT` or `NONNEGINT`)_

### References:
- AWS VPC Flow-log fields: https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html#flow-logs-fields
- Logstash Grok petterns: https://github.com/hpcugent/logstash-patterns/blob/master/files/grok-patterns

# credstash-vs-parameterstore
AWS Systems Manager Parameter Store was released during re:Invent 2016

The purpose of this repo is to provide two example implementations using each
method to retrieve a password. It is for my own selfish testing and I want to see
which is a) easier, b) faster, c) cheaper

A blurb from the respective sites:
## CredStash
[CredStash](https://github.com/fugue/credstash) is a very simple, easy to use
credential management and distribution system that uses AWS Key Management
Service (KMS) for key wrapping and master-key storage, and DynamoDB for
credential storage and sharing.

## Amazon EC2 Systems Manager Parameter Store
[Amazon EC2 Systems Manager Parameter
Store](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-paramstore.html)
provides secure storage for configuration data such as passwords, database
strings, and license codes. You can store parameters as plain text or as
encrypted objects


## Results
### Easier?
The Parameter Store was extremely easier to implement due to `boto3` support.
Boto3 is already included in the Lambda Environment and I didn't have to package
it in the deployment package. I even went to far as to inline the example code.

Originally I started with python3.6 but I did not figure out a quick way to
package up credstash in a way that worked. There was always missing packages
until I downgraded to python2.7. Since credstash uses native libraries, I had to
do the `docker` dance to get everything working (since my local system is OSX).
This is troublesome in the future.
```
docker build -t lambda-builder .
docker run -it --rm -v /Users/jolexa/sandbox/credstash-vs-parameterstore:/build lambda-builder
```

### Faster?
Using a *sophisticated* test, by clicking the "Test" button a 15 times, I was
able to see that the credstash method billed me for 5100ms and the Parameter
Store method billed me for 4700ms. For all intents and purposes a neutral
result.

### Cheaper?
| Cost | credstash | Parameter Store |
| ---- | -------- | -------|
| KMS Key| $1.00/mo | $1.00/mo for custom key or use default key ($0) |
| KMS Requests | $.03/10,000 | $.03/10,000 |
| Item Storage | $0.59/mo (minimum) | Nothing |
| Backups | Something, self managed | Nothing, AWS Managed |

## Conclusion
Time is money. Ease of usage is key. I fiddled around with credstash for more
time than I think is worthwhile. I will be switching my personal projects to the
Amazon EC2 Systems Manager Parameter Store

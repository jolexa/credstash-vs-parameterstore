# credstash-vs-parameterstore
AWS Systems Manager Parameter Store was released during re:Invent 2016 

The purpose of this repo is to provide two example implementations using each method to store a password. It is for my own selfish desires and I want to see which is a) easier, b) faster, c) cheaper

# CredStash
[CredStash](https://github.com/fugue/credstash) is a very simple, easy to use credential management and distribution system that uses AWS Key Management Service (KMS) for key wrapping and master-key storage, and DynamoDB for credential storage and sharing.

# Amazon EC2 Systems Manager Parameter Store
[Amazon EC2 Systems Manager Parameter Store](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-paramstore.html) provides secure storage for configuration data such as passwords, database strings, and license codes. You can store parameters as plain text or as encrypted objects


docker build -t lambda-builder .
docker run -it --rm -v /Users/jolexa/sandbox/credstash-vs-parameterstore:/build lambda-builder

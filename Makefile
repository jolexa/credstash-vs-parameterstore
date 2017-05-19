ACCOUNT=$(shell aws sts get-caller-identity --query Account --output text)

KeyArn=$(shell aws kms --region us-east-2 describe-key --key-id arn:aws:kms:us-east-2:$(ACCOUNT):alias/credstash --query KeyMetadata.Arn --output text)
SSMKeyArn=$(shell aws kms describe-key --key-id alias/aws/ssm --query KeyMetadata.Arn)
Bucket=credstash-vs-parameterstore
md5=$(shell md5sum deployment.zip | cut -d ' ' -f 1)

deploy:
	aws cloudformation deploy \
		--template-file deployment.yml \
		--stack-name credstash-vs-parameterstore \
		--region us-east-2 \
		--parameter-overrides \
        "KeyArn=$(KeyArn)" \
        "SSMKeyArn=$(SSMKeyArn)" \
        "Bucket=$(Bucket)" \
        "md5=$(md5)" \
		--capabilities CAPABILITY_IAM || exit 0

prep:
	aws s3 cp --acl public-read ./deployment.zip s3://$(Bucket)/$(md5)

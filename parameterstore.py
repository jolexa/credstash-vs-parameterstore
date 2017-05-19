import boto3

def handler(event, context):
    print(boto3.client('ssm').get_parameters(
            Names=['secret-test'],
            WithDecryption=True)
         )

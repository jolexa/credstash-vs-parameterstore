from credstash import getSecret

def handler(event, context):
    print(getSecret('secret-test', region='us-east-2'))

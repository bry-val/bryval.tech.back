import boto3

def lambda_handler(event, context):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('bryval-update')

    response = table.get_item(
        Key={
            'counter': 0
        }
    )

    item = response['Item']
    count_value = item['count']

    return count_value
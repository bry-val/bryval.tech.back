import boto3

def lambda_handler(event, context):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('bryval-update')

    response = table.update_item(
        Key={
            'counter': 0
        },
        UpdateExpression='ADD #count :val1',
        ExpressionAttributeNames={
            '#count': 'count'
        },
        ExpressionAttributeValues={
            ':val1': 1
        },
        ReturnValues='UPDATED_NEW'
    )

    return response['Attributes']
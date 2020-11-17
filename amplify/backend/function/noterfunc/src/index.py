import boto3

def handler(event, context):

  dynamodb = boto3.client("dynamodb")
  note = {"id":{"S":"123"}, "timeStamp":{"N":345}, "title":{"S":"fake title"}, "text":{"S":"fake text"}}
  dynamodb.put_item(TableName:"notes-dev", Item=note)
  print('received event:')
  print(event)
  return {
    'message': 'Hello from your new Amplify Python lambda!'
  }

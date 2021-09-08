import os
import boto3
import argparse
from botocore.exceptions import ClientError

INSTANCE_ID = os.environ.get("S3_INSTANCE_ID", None)
if INSTANCE_ID is not None:
    print(INSTANCE_ID)
else:
    print("S3_INSTANCE_ID variable not found")
    exit()

parser = argparse.ArgumentParser()
group = parser.add_mutually_exclusive_group(required=True)
group.add_argument('--stop',
                   action='store_true',
                   required=False,
                   help="Stop an Instance")
group.add_argument('--start',
                   action='store_true',
                   required=False,
                   help="Start an Instance")

args = parser.parse_args()

ec2 = boto3.client('ec2')

if args.stop:
    try:
        response = ec2.stop_instances(InstanceIds=[INSTANCE_ID],
                                      DryRun=False)
        print('Success', response)
    except ClientError as e:
        print('Error', e)

if args.start:
    try:
        response = ec2.start_instances(InstanceIds=[INSTANCE_ID],
                                       DryRun=False)
        print('Success', response)
    except ClientError as e:
        print('Error', e)

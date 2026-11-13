"""Creates a bucket and lists buckets. No endpoint or keys in the code:
`emu run -- python main.py` supplies them, after the guard passes."""
import time

import boto3

s3 = boto3.client("s3")
bucket = f"maple-orders-py-{int(time.time())}"

s3.create_bucket(Bucket=bucket)
names = [b["Name"] for b in s3.list_buckets()["Buckets"]]
print(f"created {bucket}")
print("buckets:", ", ".join(names))

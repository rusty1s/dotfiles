import re

import boto3

s3_resource = boto3.resource('s3')
bucket_name = 'pytorch-geometric.com'
bucket = s3_resource.Bucket(name=bucket_name)
objects = bucket.objects.all()
wheels = sorted([obj.key for obj in objects if obj.key[-3:] == 'whl'])

for wheel in wheels:
    if 'latest' in wheel:
        continue
    if '+' in wheel.split('/')[1]:
        continue

    print(wheel)

    torch_version = wheel.split('/')[1]
    cuda_version = re.search(r".*\+(\w*)-", wheel.split('/')[2]).group(1)
    version = f'{torch_version}+{cuda_version}'

    filename = wheel.split('/')[2].replace(f'+{cuda_version}', '')
    filename = f'whl/{torch_version}+{cuda_version}/{filename}'

    bucket.copy({'Bucket': bucket_name, 'Key': wheel}, filename)

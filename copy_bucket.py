import boto3
from tqdm import tqdm

src_s3 = boto3.session.Session(profile_name='default').resource('s3')

dst_s3 = boto3.session.Session(profile_name='pyg').resource('s3')

src_bucket = 'pytorch-geometric.com'
dst_bucket = 'data.pyg.org'

keys = [obj.key for obj in src_s3.Bucket(name=src_bucket).objects.all()]

for key in tqdm(keys):
    obj = src_s3.Object(src_bucket, key)
    dst_s3.Object(dst_bucket, key).put(Body=obj.get()['Body'].read())
    dst_s3.ObjectAcl(dst_bucket, key).put(ACL='public-read')

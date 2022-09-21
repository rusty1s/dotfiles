import boto3

s3 = boto3.session.Session(profile_name='pyg').resource('s3')
bucket = s3.Bucket(name='data.pyg.org')

args = {
    'ContentType': 'text/html',
    'CacheControl': 'max-age=300',
    'ACL': 'public-read',
}

bucket.Object('slack.html').upload_file('slack.html', ExtraArgs=args)

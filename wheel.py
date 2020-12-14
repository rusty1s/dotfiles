import boto3

s3_resource = boto3.resource('s3')
bucket_name = 'pytorch-geometric.com'
bucket = s3_resource.Bucket(name=bucket_name)
objects = bucket.objects.all()
wheels = [obj.key for obj in objects if obj.key[-3:] == 'whl']
versions = sorted(list(set([wheel.split('/')[1] for wheel in wheels])))

wheels_dict = {}
for torch_version in versions:
    wheels_dict[torch_version] = []

for wheel in wheels:
    torch_version = wheel.split('/')[1]
    wheels_dict[torch_version].append('/'.join(wheel.split('/')[2:]))

html = '<!DOCTYPE html>\n<html>\n<body>\n{}\n</body>\n</html>'
href = '<a href="{}">{}</a><br/>'

index_html = html.format('\n'.join(
    [href.format(f'{key}.html', key) for key in wheels_dict.keys()]))

with open('index.html', 'w') as f:
    f.write(index_html)

bucket.Object('whl/index.html').upload_file(
    Filename='index.html', ExtraArgs={
        'ContentType': 'text/html',
        'CacheControl': 'max-age=300',
        'ACL': 'public-read'
    })

for key, wheels in wheels_dict.items():
    version_html = html.format('\n'.join(
        [href.format(f'{key}/{wheel}', wheel) for wheel in wheels]))

    with open('{}.html'.format(key), 'w') as f:
        f.write(version_html)

    bucket.Object('whl/{}.html'.format(key)).upload_file(
        Filename='{}.html'.format(key), ExtraArgs={
            'ContentType': 'text/html',
            'CacheControl': 'max-age=300',
            'ACL': 'public-read'
        })

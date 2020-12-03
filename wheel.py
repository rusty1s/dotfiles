import boto3

s3_resource = boto3.resource('s3')
bucket_name = 'pytorch-geometric.com'
bucket = s3_resource.Bucket(name=bucket_name)
objects = bucket.objects.all()
wheels = sorted([obj.key for obj in objects if obj.key[-3:] == 'whl'])

wheels_dict = {}
for torch_version in list(set([wheel.split('/')[1] for wheel in wheels])):
    wheels_dict[torch_version] = []

for wheel in wheels:
    torch_version = wheel.split('/')[1]
    wheels_dict[torch_version].append(wheel)

html = '<!DOCTYPE html>\n<html>\n<body>\n{}\n</body>\n</html>'
href = '<a href="{}">{}</a><br/>'

url = 'https://' + bucket_name + '/{}.html'
index_html = html.format('\n'.join([
    href.format(url.format('whl/' + key), key) for key in wheels_dict.keys()
]))

with open('index.html', 'w') as f:
    f.write(index_html)

bucket.Object('whl/index.html').upload_file(
    Filename='index.html', ExtraArgs={
        'ContentType': 'text/html',
        'CacheControl': 'max-age=300',
        'ACL': 'public-read'
    })

url = 'https://' + bucket_name + '/{}'
for key, item in wheels_dict.items():
    version_html = html.format('\n'.join([
        href.format(url.format(i.replace('+', '%2B')),
                    '/'.join(i.split('/')[2:])) for i in item
    ]))

    with open('{}.html'.format(key), 'w') as f:
        f.write(version_html)

    bucket.Object('whl/{}.html'.format(key)).upload_file(
        Filename='{}.html'.format(key), ExtraArgs={
            'ContentType': 'text/html',
            'CacheControl': 'max-age=300',
            'ACL': 'public-read'
        })

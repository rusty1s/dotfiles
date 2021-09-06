import boto3
from collections import defaultdict

old_s3 = boto3.session.Session(profile_name='default').resource('s3')
old_bucket = old_s3.Bucket(name='pytorch-geometric.com')

new_s3 = boto3.session.Session(profile_name='pyg').resource('s3')
new_bucket = new_s3.Bucket(name='data.pyg.org')

wheels = [obj.key for obj in new_bucket.objects.all() if obj.key[-3:] == 'whl']

# wheels_dict = { torch_version: wheel, ...], ... }
wheels_dict = defaultdict(list)
for wheel in wheels:
    _, torch_version, wheel = wheel.split('/')
    wheels_dict[torch_version].append(wheel)

# Add wheels for PyTorch 1.7.1 and 1.8.1
for key, value in list(wheels_dict.items()):
    if '1.7.0' in key:
        wheels_dict[key.replace('1.7.0', '1.7.1')] = value
    if '1.8.0' in key:
        wheels_dict[key.replace('1.8.0', '1.8.1')] = value

html = '<!DOCTYPE html>\n<html>\n<body>\n{}\n</body>\n</html>'
href = '<a href="{}">{}</a><br/>'

args = {
    'ContentType': 'text/html',
    'CacheControl': 'max-age=300',
    'ACL': 'public-read',
}

index_html = html.format('\n'.join([
    href.format(f'{torch_version}.html'.replace('+', '%2B'), torch_version)
    for torch_version in wheels_dict
]))

with open('index.html', 'w') as f:
    f.write(index_html)

new_bucket.Object('whl/index.html').upload_file('index.html', ExtraArgs=args)
old_bucket.Object('whl/index.html').upload_file('index.html', ExtraArgs=args)

root = 'https://s3.us-west-1.amazonaws.com/data.pyg.org'

for torch_version, wheels in wheels_dict.items():
    torch_version_html = html.format('\n'.join([
        href.format(f'{root}/whl/{torch_version}/{wheel}'.replace('+', '%2B'),
                    wheel) for wheel in wheels
    ]))

    with open(f'{torch_version}.html', 'w') as f:
        f.write(torch_version_html)

    new_bucket.Object(f'whl/{torch_version}.html').upload_file(
        f'{torch_version}.html', ExtraArgs=args)
    old_bucket.Object(f'whl/{torch_version}.html').upload_file(
        f'{torch_version}.html', ExtraArgs=args)

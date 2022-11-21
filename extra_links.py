from collections import defaultdict

import boto3

s3 = boto3.session.Session(profile_name='pyg').resource('s3')
bucket = s3.Bucket(name='data.pyg.org')

wheels = [obj.key for obj in bucket.objects.all() if obj.key[-3:] == 'whl']

# wheels_dict = { torch_version: wheel, ...], ... }
wheels_dict = defaultdict(list)
for wheel in wheels:
    if 'wheels' in wheel:
        continue
    if 'nightly' in wheel:
        continue
    _, torch_version, wheel_name = wheel.split('/')
    if '+' not in torch_version:
        continue
    torch_version, cuda_version = torch_version.split('+')
    package_name = wheel_name.split('-')[0]

    wheels_dict[(torch_version, cuda_version, package_name)].append(wheel)

    if '1.7.0' in torch_version:
        wheels_dict[('torch-1.7.1', cuda_version, package_name)].append(wheel)
    if '1.8.0' in torch_version:
        wheels_dict[('torch-1.8.1', cuda_version, package_name)].append(wheel)
    if '1.9.0' in torch_version:
        wheels_dict[('torch-1.9.1', cuda_version, package_name)].append(wheel)
    if '1.10.0' in torch_version:
        wheels_dict[('torch-1.10.1', cuda_version, package_name)].append(wheel)
        wheels_dict[('torch-1.10.2', cuda_version, package_name)].append(wheel)
    if '1.12.0' in torch_version:
        wheels_dict[('torch-1.12.1', cuda_version, package_name)].append(wheel)

args = {
    'ContentType': 'text/html',
    'CacheControl': 'max-age=300',
    'ACL': 'public-read',
}

# Uncomment to copy:
# for (torch, cuda, package), wheels in wheels_dict.items():
#     print(torch, cuda, package)
#     for wheel in wheels:
#         wheel_name = wheel.split('/')[-1]
#         _, version, suffix = wheel_name.split('-', maxsplit=2)

#         new_wheel = (f'wheels/{torch}/{cuda}/{package}/{package}-{version}+'
#                      f'{torch}-{cuda}-{suffix}')

#         src = {'Bucket': 'data.pyg.org', 'Key': wheel}
#         bucket.copy(src, new_wheel, ExtraArgs=args)

wheels = [
    obj.key for obj in bucket.objects.all()
    if obj.key[:6] == 'wheels' and obj.key[-3:] == 'whl'
]

html = '<!DOCTYPE html>\n<html>\n<body>\n{}\n</body>\n</html>'
href = '<a href="{}">{}</a><br/>'

overview_dict = defaultdict(set)
wheels_dict = defaultdict(list)
for wheel in wheels:
    _, torch_version, cuda_version, package_name, wheel_name = wheel.split('/')
    overview_dict[(torch_version, cuda_version)].add(package_name)
    wheels_dict[(torch_version, cuda_version, package_name)].append(wheel_name)

for (torch_version, cuda_version), packages in overview_dict.items():
    print(torch_version, cuda_version)
    index_html = html.format('\n'.join([href.format(p, p) for p in packages]))

    with open('index.html', 'w') as f:
        f.write(index_html)

    path = f'wheels/{torch_version}/{cuda_version}/index.html'
    bucket.Object(path).upload_file('index.html', ExtraArgs=args)

root = 'https://data.pyg.org'
for (torch_version, cuda_version, package_name), wheels in wheels_dict.items():
    print(torch_version, cuda_version, package_name)

    index_html = html.format('\n'.join([
        href.format(
            (f'{root}/wheels/{torch_version}/{cuda_version}/{package_name}/'
             f'{wheel}').replace('+', '%2B'), wheel) for wheel in wheels
    ]))

    with open('index.html', 'w') as f:
        f.write(index_html)

    path = f'wheels/{torch_version}/{cuda_version}/{package_name}/index.html'
    bucket.Object(path).upload_file('index.html', ExtraArgs=args)

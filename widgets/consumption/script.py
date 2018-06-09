import json
import psutil
import humanfriendly


def to_size(value):
    out = humanfriendly.format_size(value)
    out = ''.join(out.split(' '))
    return out


data = psutil.virtual_memory()
memory = {
    'name': 'Memory',
    'used': to_size(data.used),
    'free': to_size(data.available + data.free),
    'total': to_size(data.total),
    'percentage': data.percent,
    'color': 'rgba(203,116,221,1)',
}

cpu_percent = psutil.cpu_percent()
cpu = {
    'name': 'CPU Usage',
    'used': '{:.2f}%'.format(cpu_percent),
    'free': '{:.2f}%'.format(100 - cpu_percent),
    'total': '100%',
    'percentage': cpu_percent,
    'color': 'rgba(255,204,55,1)',
}

data = psutil.disk_usage('/')
disk = {
    'name': 'Disk Space',
    'used': to_size(data.used),
    'free': to_size(data.free),
    'total': to_size(data.total),
    'percentage': data.percent,
    'color': 'rgba(32,173,244,1)',
}

consumptions = [memory, cpu, disk]

repos = json.dumps(consumptions)
print(repos)

import json
import psutil
import humanfriendly


def to_size(value, binary=True):
    if binary is True:
        count = 0
        while value >= 1024:
            value /= 1024
            count += 1
        for i in range(count):
            value *= 1000

    out = humanfriendly.format_size(value)
    out = ''.join(out.split(' '))
    return out


data = psutil.virtual_memory()
used = data.percent * data.total / 100
memory = {
    'name': 'Memory',
    'used': to_size(used),
    'free': to_size(data.total - used),
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
    'used': to_size(data.used, binary=False),
    'free': to_size(data.total - data.used, binary=False),
    'total': to_size(data.total, binary=False),
    'percentage': data.percent,
    'color': 'rgba(32,173,244,1)',
}

consumptions = [memory, cpu, disk]

repos = json.dumps(consumptions)
print(repos)

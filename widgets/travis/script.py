import sys
import json
import requests as r
from datetime import datetime, timezone
import dateutil.parser
import humanfriendly

user = 'rusty1s'

try:
    g = r.get('https://api.github.com/users/{}/repos'.format(user)).json()
    t = r.get('https://api.travis-ci.org/repos/{}'.format(user)).json()
    c = r.get('https://codecov.io/api/gh/{}'.format(user)).json()
except Exception as err:
    print('An error occurred.')
    sys.exit(1)

repos = {}

for repo in t:
    if repo['active'] is True:
        name = repo['slug'].split('/')[-1]

        state = 'passed' if repo['last_build_status'] == 0 else 'errored'

        duration = repo['last_build_duration']
        if duration is not None:
            duration = humanfriendly.format_timespan(duration)
        else:
            duration = '-'
            state = 'building'

        date = dateutil.parser.parse(repo['last_build_started_at'])
        timestamp = int((datetime.now(timezone.utc) - date).total_seconds())
        finished = humanfriendly.format_timespan(timestamp)
        finished = finished.split(', ')[0]

        repos[name] = {
            'name': name,
            'slug': repo['slug'],
            'build': repo['last_build_number'],
            'state': state,
            'duration': duration,
            'finished': finished,
            'timestamp': timestamp,
            'stars': '-',
            'forks': '-',
            'issues': '-',
        }

if isinstance(g, list):
    for repo in g:
        if repo['name'] in repos:
            repos[repo['name']]['stars'] = repo['stargazers_count']
            repos[repo['name']]['forks'] = repo['forks']
            repos[repo['name']]['issues'] = repo['open_issues']

for repo in c['repos']:
    if repo['name'] in repos:
        repos[repo['name']]['coverage'] = round(repo['coverage'])

repos = sorted(list(repos.values()), key=lambda x: x['timestamp'])[:9]
repos = json.dumps(repos)
print(repos)

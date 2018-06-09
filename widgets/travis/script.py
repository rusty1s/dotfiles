import json
import requests
from datetime import datetime, timezone
import dateutil.parser
import humanfriendly

user = 'rusty1s'

g = requests.get('https://api.github.com/users/{}/repos'.format(user)).json()
t = requests.get('https://api.travis-ci.org/repos/{}'.format(user)).json()
c = requests.get('https://codecov.io/api/gh/{}'.format(user)).json()

repos = {}

for repo in t:
    if repo['active'] is True:
        name = repo['slug'].split('/')[-1]

        duration = humanfriendly.format_timespan(repo['last_build_duration'])

        date = dateutil.parser.parse(repo['last_build_started_at'])
        timestamp = int((datetime.now(timezone.utc) - date).total_seconds())
        finished = humanfriendly.format_timespan(timestamp)
        finished = finished.split(', ')[0]

        repos[name] = {
            'name': name,
            'build': repo['last_build_number'],
            'state': 'passed' if repo['last_build_status'] == 0 else 'errored',
            'duration': duration,
            'finished': finished,
            'timestamp': timestamp,
        }

for repo in g:
    if repo['name'] in repos:
        repos[repo['name']]['stars'] = repo['stargazers_count']
        repos[repo['name']]['forks'] = repo['forks']
        repos[repo['name']]['issues'] = repo['open_issues']

for repo in c['repos']:
    if repo['name'] in repos:
        repos[repo['name']]['coverage'] = round(repo['coverage'])

repos = sorted(list(repos.values()), key=lambda x: x['timestamp'])
repos = json.dumps(repos)
print(repos)

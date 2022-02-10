import json
import requests
import os.path as osp

path = osp.join(osp.dirname(osp.realpath(__file__)))
with open(osp.join(path, '..', '..', 'github', 'token'), 'r') as f:
    token = f.read()[:-1]

full_names = [
    'pyg-team/pytorch_geometric',
    'rusty1s/pytorch_scatter',
    'rusty1s/pytorch_sparse',
    'rusty1s/pytorch_cluster',
    # 'rusty1s/pytorch_spline_conv',
    'rusty1s/deep-graph-matching-consensus',
    'rusty1s/pyg_autoscale',
    'rusty1s/himp-gnn',
]

repos = {}
for user in set([full_name.split('/')[0] for full_name in full_names]):
    info = requests.get(f'https://api.github.com/users/{user}/repos', headers={
        'Authorization': f'token {token}'
    }).json()

    cov = requests.get(f'https://codecov.io/api/gh/{user}').json()
    cov = {f'{user}/{data["name"]}': data['coverage'] for data in cov['repos']}

    for repo in info:
        if repo['full_name'] in full_names:
            full_name = repo['full_name']
            pulls = requests.get(
                f'https://api.github.com/repos/{full_name}/pulls',
                headers={'Authorization': f'token {token}'})

            actions = requests.get(
                f'https://api.github.com/repos/{full_name}/actions/runs',
                headers={'Authorization': f'token {token}'})
            actions = actions.json()['workflow_runs']
            actions = [act for act in actions if act['event'] == 'push']
            if len(actions) > 0:
                sha = actions[0]['head_sha']
                actions = [act for act in actions if act['head_sha'] == sha]
                action = 'failure'
                if all([
                        act['status'] == 'completed'
                        and act['conclusion'] == 'success' for act in actions
                ]):
                    action = 'success'
            else:
                action = 'unknown'

            coverage = f'{cov[full_name]:.2f}%' if full_name in cov else '---'

            repos[repo['full_name']] = {
                'owner': repo['owner']['login'],
                'name': repo['name'],
                'num_stars': repo['stargazers_count'],
                'num_forks': repo['forks_count'],
                'num_issues': repo['open_issues_count'],
                'num_pull_requests': len(pulls.json()),
                'action': action,
                'coverage': coverage,
            }

repos = [repos[full_name] for full_name in full_names]
repos = json.dumps(repos)
print(repos)

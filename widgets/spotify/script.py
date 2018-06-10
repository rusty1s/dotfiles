import os
import sys
import json
import requests as r
from account import key

is_running_cmd = 'osascript -e "application \\"Spotify\\" is running"'
track_cmd = 'osascript -e "tell application \\"Spotify\\" to name of ' \
            'current track"'
artist_cmd = 'osascript -e "tell application \\"Spotify\\" to artist of ' \
             'current track"'

url = 'http://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key={}' \
      '&artist={}&track={}&format=json'

is_running = os.popen(is_running_cmd).read()[:-1]
if is_running == 'false':
    print('An error occurred.')
    sys.exit(1)

artist = os.popen(artist_cmd).read()[:-1]
track = os.popen(track_cmd).read()[:-1]

if len(artist) == 0 or len(track) == 0:
    print('An error occurred.')
    sys.exit(1)

data = r.get(url.format(key, artist, track)).json()
if 'track' in data:
    image = data['track']['album']['image'][2]['#text']
else:
    image = None

info = {
    'track': track,
    'artist': artist,
    'image': image,
}

info = json.dumps(info)
print(info)

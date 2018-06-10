import os
import json
import requests as r
from account import key

track_cmd = 'osascript -e "tell application \\"Spotify\\" to name of ' \
            'current track"'
artist_cmd = 'osascript -e "tell application \\"Spotify\\" to artist of ' \
             'current track"'

url = 'http://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key={}' \
      '&artist={}&track={}&format=json'

artist = os.popen(artist_cmd).read()[:-1]
track = os.popen(track_cmd).read()[:-1]

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

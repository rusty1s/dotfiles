if application "Spotify" is running then
  tell application "Spotify"

    set theTrack to the name of the current track
    set theArtist to the artist of the current track

    return theTrack & " - " & theArtist

  end tell
end if

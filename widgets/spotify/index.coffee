command: "python ./spotify/script.py"
refreshFrequency: "5s"

style: """
  bottom: 400px
  right: 100px
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale
  font-family: SFUIDisplay Nerd Font
  font-size: 40px
  color: white

  .body {
    display: flex
    align-items: center
  }

  .image {
    width: 100px
    height: 100px
    margin-left: 20px
    background-image: url('./spotify/unknown_track@2x.png')
    background-size: 100px 100px
  }

  @media
  (-webkit-min-device-pixel-ratio: 2),
  (min-resolution: 192dpi) {
    .image {
      background-image: url('./spotify/unknown_track@2x.png')
    }
  }

  .track {
    font-size: 36px
    font-weight: 500
    color: rgba(255,255,255,1)
    text-align: right
    margin-bottom: 5px
  }

  .artist {
    font-size: 24px
    font-weight: 300
    color: rgba(255,255,255,0.5)
    text-align: right
  }
"""

render: (output) -> "<div></div>"

getStyle: (image) -> if image? then "background-image: url(#{image})" else ""

renderSong: (data) -> """
  <div class="body">
    <div class="info">
      <div class="track">#{data.track}</div>
      <div class="artist">#{data.artist}</div>
    </div>
    <div class="image" style="#{@getStyle(data.image)}"></div>
  </div>
  """

update: (output, domEl) ->
  body = $(domEl)
  body.html ""

  try
    data = JSON.parse(output)
    body.append @renderSong(data)
  catch e
    return

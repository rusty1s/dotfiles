command: "osascript ./spotify/spotify.scpt"
refreshFrequency: "1s"

style: """
  bottom: 400px
  right: 100px
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale
  font-family: SFUIDisplay Nerd Font

  .body {
    display: flex
    align-items: center
  }

  #image {
    width: 100px
    height: 100px
    margin-left: 20px
    background-size: 100%
  }

  #track {
    font-size: 36px
    font-weight: 500
    color: rgba(255,255,255,1)
    text-align: right
    margin-bottom: 5px
  }

  #artist {
    font-size: 24px
    font-weight: 300
    color: rgba(255,255,255,0.5)
    text-align: right
  }
"""

render: (output) -> """
  <div class="body">
    <div class="info">
      <div id="track"></div>
      <div id="artist"></div>
    </div>
    <div id="image"></div>
  </div>
  """

update: (output, domEl) ->
  if output
    data = output.split "|"
  else
    data = ["", "", ""]

  body = $(domEl)
  body.find("#track").text data[0]
  body.find("#artist").text data[1]
  body.find("#image").css "background-image", "url(#{data[2]})"

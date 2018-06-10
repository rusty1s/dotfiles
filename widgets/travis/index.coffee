command: "python ./travis/script.py"
refreshFrequency: '60s'

style: """
  bottom: 0
  left: 0
  height: 100%
  background: rgba(255,255,255,0.1)
  -webkit-backdrop-filter: blur(100px)
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale
  font-family: SFUIText Nerd Font
  font-size: 13px
  color: rgb(0,0,0)
  border-right: 1px solid rgba(0,0,0,0.1)

  a {
    text-decoration: none
    color: inherit
  }

  h1 {
    height: 27px
    width: 120px
    background: url('./travis/logo.png')
    background-repeat: no-repeat
    opacity: 0.5
    margin: 15px 0 15px 25px
  }

  @media (-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi) {
    h1 {
      background: url('./travis/logo@2x.png')
      background-size: 27px 120px
    }
  }

  .error {
    padding: 15px 25px
    width: 120px
    text-align: center
    color: rgba(0,0,0,0.6)
  }

  ol {
    list-style: none
    margin: 0
    padding: 0
  }

  li {
    border-bottom: 1px solid rgba(0,0,0,0.1)
  }

  li:first-child {
    border-top: 1px solid rgba(0,0,0,0.1)
  }

  li.passed {
    border-left: 10px solid rgba(60,170,92,0.8)
  }

  li.errored {
    border-left: 10px solid rgba(218,71,72,0.8)
  }

  li.building {
    border-left: 10px solid rgba(237,222,84,0.8)
  }

  .wrapper {
    padding: 10px 13px 10px 15px
    border-left: 1px solid rgba(0,0,0,0.1)
  }

  .name-box {
    font-weight: 500
    margin-bottom: 3px
    display: flex
  }

  .name {
    flex-grow: 1
    padding-right: 10px
    font-size: 14px
  }

  .hash {
    color: rgba(0,0,0,0.4)
  }

  .info-box {
    font-weight: 500
    margin-bottom: 3px
    display: flex
  }

  .info-box div {
    text-align: left
    flex-basis: 25%
  }

  .info-box div:last-child {
    text-align: right
  }

  .time-box {
    color: rgba(0,0,0,0.6)
  }
"""

render: (_) -> """
  <div>
    <h1></h1>
    <ol></ol>
  </div>
  """

renderRepo: (repo) -> """
  <li class="#{repo.state}">
    <div class="wrapper">
      <div class="name-box">
        <div class="name">
          <a href="https://github.com/#{repo.slug}">#{repo.name}</a>
        </div>
        <div class="build">
          <span class="hash">#</span>
          <a href="https://travis-ci.org/#{repo.slug}">#{repo.build}</a>
        </div>
      </div>
      <div class="info-box">
        <div> #{repo.stars}</div>
        <div> #{repo.forks}</div>
        <div><a href="https://github.com/#{repo.slug}/issues"> #{repo.issues}</a></div>
        <div><a href="https://codecov.io/github/#{repo.slug}"> #{repo.coverage}%</a></div>
      </div>
      <div class="time-box">
        <div class="duration"> Duration: #{repo.duration}</div>
        <div class="finished"> Finished: #{repo.finished} ago</div>
      </div>
    </div>
  </li>
  """

renderError: () -> """
  <div class="error">
    An error occurred.
  </li>
  """

update: (output, domEl) ->
  list = $(domEl).find('ol')

  try
    repos = JSON.parse(output)
    list.html ""
    for repo in repos
      list.append @renderRepo(repo)
  catch e
      list.append @renderError()

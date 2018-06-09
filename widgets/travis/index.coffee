command: "/Users/rusty1s/.venv/3.6/bin/python ./travis/script.py"
refreshFrequency: '60s'

style: """
  bottom: 0
  left: 0
  height: 100%
  background-color: rgba(#000, 0.1)
  -webkit-backdrop-filter: blur(100px)
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale
  font-family: SFUIText Nerd Font
  font-size: 14px
  color: rgba(0, 0, 0, 0.8)
  border-right: 1px solid rgba(0,0,0,0.1)

  h1 {
    height: 26px
    background: url('./travis/logo.png')
    background-repeat: no-repeat
    opacity: 0.5
    margin: 20px 0 20px 30px
    font-weight: 500
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

  .wrapper {
    padding: 10px 10px 10px 20px
    border-left: 1px solid rgba(0,0,0,0.1)
  }

  .name-box {
    font-weight: 500
    margin-bottom: 5px
    display: flex
  }

  .name {
    flex-grow: 1
    padding-right: 20px
    font-size: 16px
  }

  .hash {
    color: rgba(0,0,0,0.2)
  }

  .info-box {
    font-weight: 500
    margin-bottom: 5px
    display: flex
    justify-content: space-between
  }

  .time-box {
    color: rgba(0,0,0,0.5)
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
        <div class="name">#{repo.name}</div>
        <div class="build"><span class="hash">#</span> #{repo.build}</div>
      </div>
      <div class="info-box">
        <div> #{repo.stars}</div>
        <div> #{repo.forks}</div>
        <div> #{repo.issues}</div>
        <div> #{repo.codecov}%</div>
      </div>
      <div class="time-box">
        <div class="duration"> Duration: #{repo.duration}</div>
        <div class="finished"> Finished: #{repo.finished} ago</div>
      </div>
    </div>
  </li>
  """

update: (output, domEl) ->
  repos = JSON.parse(output)
  list = $(domEl).find('ol')
  list.html ""
  for repo in repos
    list.append @renderRepo(repo)

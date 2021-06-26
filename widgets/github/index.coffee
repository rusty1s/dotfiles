command: "/Users/rusty1s/miniconda3/bin/python ./github/script.py"
refreshFrequency: "240s"
style: """
  bottom: 0
  left: 0
  height: 100%
  width: 300px
  background: rgba(255,255,255,0.1)
  -webkit-backdrop-filter: blur(100px)
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale
  font-family: SFUIText Nerd Font
  font-size: 14px
  color: rgb(0,0,0)
  border-right: 1px solid rgba(0,0,0,0.1)

  a {
    text-decoration: none
    color: inherit
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

  li.success {
    border-left: 10px solid rgba(60,170,92,0.8)
  }

  li.failure {
    border-left: 10px solid rgba(218,71,72,0.8)
  }

  li.unknown {
    border-left: 10px solid rgba(0,0,0,0.4)
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
    font-size: 15px
  }

  .action {
    color: rgba(0,0,0,0.4)
  }

  .info-box {
    font-weight: 500
    margin-bottom: 3px
    display: flex
  }

  .info-box div {
    flex-grow: 1
    text-align: center
  }

  .info-box div:first-child {
    text-align: left
  }

  .info-box div:last-child {
    text-align: right
  }
"""

render: (_) -> """
  <div>
    <ol></ol>
  </div>
  """

renderRepo: (repo) -> """
  <li class="#{repo.owner}_#{repo.name} #{repo.action}">
    <div class="wrapper">
      <div class="name-box">
        <div class="name">
          <a href="https://github.com/#{repo.owner}/#{repo.name}">#{repo.name}</a>
        </div>
        <div class="action">
          <a href="https://github.com/#{repo.owner}/#{repo.name}/actions">Action</a>
        </div>
      </div>
      <div class="info-box">
        <div><a href="https://github.com/#{repo.owner}/#{repo.name}/stargazers"> #{repo.num_stars}</a></div>
        <div><a href="https://github.com/#{repo.owner}/#{repo.name}/network/members"> #{repo.num_forks}</a></div>
      </div>
      <div class="info-box">
        <div><a href="https://github.com/#{repo.owner}/#{repo.name}/issues"> #{repo.num_issues}</a></div>
        <div><a href="https://github.com/#{repo.owner}/#{repo.name}/pulls"> #{repo.num_pull_requests}</a></div>
        <div><a href="https://codecov.io/github/#{repo.owner}/#{repo.name}"> #{repo.coverage}</a></div>
      </div>
    </div>
  </li>
  """

renderError: (error) -> """<div class="error">#{error}</div>"""

update: (output, domEl) ->
  list = $(domEl).find("ol")
  list.html ""

  try
    repos = JSON.parse(output)
    for repo in repos
      list.append @renderRepo(repo)
  catch e
    list.append @renderError(output)

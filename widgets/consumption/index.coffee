command: "/Users/rusty1s/.venv/3.6/bin/python ./consumption/script.py"
refreshFrequency: '5s'

style: """
  bottom: 50px
  right: 50px
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale
  font-family: SFUIDisplay Nerd Font
  color: rgb(255,255,255)
  width: 710px
  text-transform: uppercase

  .stats {
    display: flex
    font-size: 28px
    font-weight: 300
    align-items: flex-end
    padding: 3px 0
  }

  .stats div {
    flex-basis: 200px
    text-align: right
  }

  h1 {
    font-size: 18px
    font-weight: 700
    margin: 0
    padding-bottom: 3px
    flex-grow: 1
  }

  .stats div:after {
    font-size: 15px
    font-weight: 700
    padding-left: 5px
    color: rgba(255,255,255,0.5)
  }

  .used:after {
    content: 'used'
  }

  .free:after {
    content: 'free'
  }

  .total:after {
    content: 'total'
  }

  .bar {
    display: flex
    background: rgba(255,255,255,0.1)
    border-radius: 5px
    height: 15px
    overflow: hidden
  }
"""

render: (output) -> "<div></div>"

renderConsumption: (consumption) -> """
  <div class="stats">
    <h1>#{consumption.name}</h1>
    <div class="used">#{consumption.used}</div>
    <div class="free">#{consumption.free}</div>
    <div class="total">#{consumption.total}</div>
  </div>
  <div class="bar">
    <div style="width: #{consumption.percentage}%; background: #{consumption.color};"></div>
  </div>
  """

update: (output, domEl) ->
  consumptions = JSON.parse(output)
  body = $(domEl)
  body.html ""
  for consumption in consumptions
    body.append @renderConsumption(consumption)

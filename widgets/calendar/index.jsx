import { css } from 'uebersicht'

export const command = 'cat /tmp/ical.txt';
export const refreshFrequency = 1000 * 60 * 60; // 1 hour

export const className = css`
  -webkit-backdrop-filter: blur(100px);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  font-family: SFUIText Nerd Font;
  font-size: 13px;

  background: rgba(255,255,255,0.1);
  border: 1px solid rgba(0,0,0,0.1);
  border-radius: 15px;
  overflow: hidden;
  min-width: 250px;

  position: absolute;
  left: 317px;
  top: 30px;
`

const error = css`
  text-align: center;
  font-weight: 500;
  font-style: italic;
  padding: 10px 20px;
`

const header = css`
  background: rgba(255,255,255,0.3);
  font-size: 16px;
  font-weight: 500;
  padding: 15px 20px 15px 70px;
  position: relative;

  &:before {
    height: 36px;
    width: 36px;
    left: 20px;
    top: 6px;
    background: rgba(255,255,255,0.8);
    padding-top: 10px;
    border-radius: 7px;
    font-weight: 300;
    text-align: center;
    box-sizing: border-box;
    font-size: 22px;
    content: attr(data-day);
    position: absolute;
  }

  &:after {
    width: 36px;
    content: attr(data-month);
    position: absolute;
    left:20px;
    top: 6px;
    text-align: center;
    color: red;
    font-weight: 300;
    font-size: 10px;
  }
`

const entry = css`
  padding: 7px 20px;

  &:nth-child(odd) {
    background: rgba(255,255,255,0.1);
  }
`

const desc = css`
  font-size: 14px;
  font-weight: 500;
  padding-bottom: 2px;
`

const Arbeit = css`
  background: green;
`

const parse = output => {
  return output.split('\n\n').map(dayEvents => {
    const [ week_name, day, month ] = dayEvents.split('\n')[0].slice(0, -1).split(' ');
    const events = dayEvents.split('* ').slice(1).map(e => {
      const [ desc, type, start, end ] = /(.*) \((.*)\)\s+(.*) - (.*)/.exec(e).slice(1, 5);
      return { desc, type, start, end };
    });
    return { week_name, day, month, events };
  });
}

export const render = ({ output }) => {
  if (output.length == 0) {
    return (
      <div className={[main, error].join(' ')}>No calendar entries found.</div>
    );
  }

  const days = parse(output);

  return (
    <div>
      {days.map(day => (
        <div>
          <div className={header} data-day={day['day']} data-month={day['month']}>{day['week_name']}</div>
          {day['events'].map(e => (
            <div className={entry}>
              <div className={desc}>{e['desc']}</div>
              <div>{e['start']} - {e['end']}</div>
            </div>
          ))}
        </div>
      ))}
    </div>
  );
}

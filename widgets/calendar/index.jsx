import { styled, css } from 'uebersicht'

export const command = 'cat ~/ical.txt';
export const refreshFrequency = 1000 * 60 * 10; // 10 minutes.

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
  left: 330px;
  top: 30px;
`

const Text = styled('div')`
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

  &::before {
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

  &::after {
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

const borderColor = {
  'Arbeit': 'rgb(90,214,67)',
  'Sarah Arbeit': 'rgb(190,88,214)',
  'Termine': 'rgb(32,173,244)',
  'Privat': 'rgb(32,173,244)',
};

const Entry = styled('div')(props => ({
  padding: '7px 20px',
  borderLeft: `3px solid ${borderColor[props.type]}`,
  ':nth-child(odd)': {
    background: 'rgba(255,255,255,0.1)',
  },
}))

const Desc = styled('span')`
  font-size: 14px;
  font-weight: 500;
  padding-bottom: 2px;
`

const parse = output => {
  return output.split('\n\n').map(dayEvents => {
    const [ week_name, day, month ] = dayEvents.split('\n')[0].slice(0, -1).split(' ');
    const events = dayEvents.split('* ').slice(1).map(e => {
      const lines = e.split('\n').filter(str => str.length > 0);
      e = [lines.slice(0, 1), lines.slice(-1)].join('\n')
      if (e.includes(" - ")) {
        const [ desc, type, start, end ] = /(.*) \((.*)\)\s+(.*) - (.*)/.exec(e).slice(1);
        return { desc, type, start, end };
      } else {
        const [desc, type ] = /(.*) \((.*)\)/.exec(e).slice(1);
        return { desc, type };
      }
      return e;
    });
    return { week_name, day, month, events };
  });
}

export const render = ({ output, error }) => {
  if (error) return <Text>An error occurred.</Text>;
  if (output.length == 0) return <Text>No calendar entries found.</Text>;

  const days = parse(output);

  return (
    <div>
      {days.map(day => (
        <div key={day['day']}>
          <div className={header} data-day={day['day']} data-month={day['month']}>{day['week_name']}</div>
          {day['events'].map(e => (
            <Entry key={e['desc']} type={e['type']}>
              <Desc>{e['desc']}</Desc>
              {e['start'] && <div>{e['start']} - {e['end']}</div>}
            </Entry>
          ))}
        </div>
      ))}
    </div>
  );
}

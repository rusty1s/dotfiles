import sys

import iterm2

size = sys.argv[1]


async def main(connection):
    app = await iterm2.async_get_app(connection)
    session = app.current_terminal_window.current_tab.current_session
    profile = await session.async_get_profile()
    font = profile.normal_font.rsplit(' ', maxsplit=1)[0]
    change = iterm2.LocalWriteOnlyProfile()
    change.set_normal_font(f'{font} {size}')
    await session.async_set_profile_properties(change)


iterm2.run_until_complete(main)

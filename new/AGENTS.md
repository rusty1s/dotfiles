# Code Style

When function signatures don't fit on a single line, use trailing commas to control `yapf` formatting:
- Add trailing comma after last argument so `yapf` formats each argument on its own line
- Use `#` comment after trailing comma for single argument functions to prevent `yapf` from collapsing (e.g., `arg,  #`)
- Add trailing comma inside type annotations (e.g., `Tuple[...,]`) to split them across lines if needed

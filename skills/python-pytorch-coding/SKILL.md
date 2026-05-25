---
name: python-pytorch-coding
description: Python and PyTorch coding style guidance for ML-oriented code. Use when implementing, editing, or reviewing Python/PyTorch code to follow house style preferences beyond automatic formatting.
---

# Python PyTorch Coding

Use this skill when writing or reviewing Python/PyTorch code.
It captures house style preferences that automatic formatters do not fully express.

Read the surrounding code before editing, preserve local patterns, and apply these rules as preferences rather than reasons to rewrite clear existing code.

## Python Concepts

- Prefer single quotes for short symbolic string literals, keys, enum-like values, and identifiers.
- Use double quotes for human-readable text, log messages, error messages, and prose.
- Keep lines within 80 columns.
- Use type hints for function and method signatures for newly written code.
- Avoid dense compound expressions that become hard to read across multiple lines.
- Use trailing commas in multi-line function signatures or calls whenever it does not fit on a single line.
- Use `#` comment after trailing comma for single argument functions to prevent formatters from collapsing (e.g., `arg,  #`).
- Use a trailing comma inside type annotations, e.g., `tuple[...,]`, to split them across lines when needed.
- Use keyword arguments in multi-line function calls.
- Prefer keyword arguments over positional arguments whenever variable names deviate from argument names and their meaning is not self-explanatory.
- Follow the order of arguments in the function signature when using keyword arguments.
- Do not pass optional keyword arguments when using their default values.
- Prefix non-public methods and properties with `_`.
- Avoid `else` after a branch that already returns, raises, breaks, or
  continues.
- Prefer ternary operator over if/else whenever the statement fits on a single line.
- Avoid throwaway temporaries. Keep intermediate names when they match in type and semantics.
- Do not use backslashes for multi-line continuation; use parentheses.

## PyTorch Concepts

- Prefer `x.fn()` over `torch.fn(x)` whenever such a method exists.
- Do not import `from torch import nn` directly. Prefer to either import specific modules from `torch.nn` or call via `torch.nn.X`.
- Always try to write vectorized tensor operations rather than Python loops. Call it out whenever it is not possible.
- Keep tensors on the intended device; avoid accidental CPU/GPU transfers through `.cpu()`, `.numpy()`, `.item()`, Python scalars, or newly-created CPU tensors.
- Avoid accidental graph breaks to simplify `torch.compile` integration if there is an alternative way to write it instead.
- Preserve dtype and device expectations.
- Use `torch.inference_mode()` or `torch.no_grad()` for inference/evaluation paths that do not require gradients.
- Be cautious with in-place operations on tensors needed for gradient computation or reused views.
- Prefer PyTorch-native ops over NumPy.
- Do not add edge-case branches when PyTorch already handles the case clearly. Often, PyTorch behaves just as expected for empty tensors, empty masks, etc.
- Make randomness controllable via a `torch.Generator` argument.
- Use comments to signal tensor shapes for complex operations to improve readability.

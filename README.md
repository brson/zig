# Zig, with additional developer-friendly features

This is a patchset for the [Zig] compiler,
version 0.14.0,
that adds minor features useful for debugging and development.

It is not suitable for production:
your CI should use mainline Zig.

It is unsupported,
and may be completely broken.


### Features

- Unused locals produce warnings, not errors
- Unreachable code produces warnings, not errors
- The lexer supports block comments (`/* ... */`)


## Building

It includes a [Justfile] that downloads and builds LLVM,
then builds Zig.

```
just build
```

The compiler will be located at `./build/stage3/bin/zig`.

Use by e.g. adding an alias to your shell:

```
alias bzig="$HOME/zig/build/stage3/bin/zig"
```

The LLVM build is tested on Linux and may not work elsewhere.

[Zig]: https://github.com/ziglang/zig
[Justfile]: https://github.com/casey/just

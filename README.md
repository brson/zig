This is a patch for the [Zig] compiler,
version 0.13,
that emits warnings instead of errors for

- unused locals
- unreachable code

It is unsupported,
may be suitable for development,
and may be completely broken.

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

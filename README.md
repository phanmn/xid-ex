# Xid

An Elixir library for using Xid rust implementation with Rustler.

In order to use it, you either set the `XID_BUILD` env var
to force compilation, or you first run the following mix task:

    mix rustler_precompiled.download Xid --only-local

This is going to save the checksum file locally, which is required for the project to
load the NIF from the internet.

After that, enter the console with `iex -S mix` and test the `add/2` function:

```elixir
Xid.generate()
```

The GitHub Action responsible for building the NIFs can be found at [.github/workflows/release.yml](https://github.com/zoonect/xid/blob/main/.github/workflows/release.yml).

For further details check the [RustlerPrecompiled project](https://github.com/philss/rustler_precompiled).

---

## Commands

Useful commands

    XID_BUILD=1 mix compile
    mix git_ops.release
    mix git_ops.release --force-patch

    mix rustler_precompiled.download Xid --all --print

    mix docs

    mix hex.build
    mix hex.publish

---

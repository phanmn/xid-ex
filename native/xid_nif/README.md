# NIF for Elixir.Xid

## To build the NIF module:

- Your NIF will now build along with your project.

## To load the NIF:

```elixir
defmodule Xid do
  use Rustler, otp_app: :xid, crate: "xid_nif"

  # When your NIF is loaded, it will override this function.
  def generate, do: :erlang.nif_error(:nif_not_loaded)
end
```

## Examples

[This](https://github.com/rusterlium/NifIo) is a complete example of a NIF written in Rust.

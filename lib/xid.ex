defmodule Xid do
  @moduledoc """
  Documentation for `Xid`.
  """

  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :xid,
    crate: "xid",
    base_url:
      "https://github.com/phanmn/xid-ex/releases/download/v#{version}",
    force_build: System.get_env("XID_BUILD") in ["1", "true"],
    targets: [
      "aarch64-apple-darwin",
      "aarch64-unknown-linux-gnu",
      "aarch64-unknown-linux-musl",
      "arm-unknown-linux-gnueabihf",
      "riscv64gc-unknown-linux-gnu",
      "x86_64-apple-darwin",
      "x86_64-pc-windows-gnu",
      "x86_64-pc-windows-msvc",
      "x86_64-unknown-linux-gnu",
      "x86_64-unknown-linux-musl",
    ],
    version: version

  # When your NIF is loaded, it will override this function.
  def generate, do: :erlang.nif_error(:nif_not_loaded)
  def generate_with_timestamp(_arg1), do: :erlang.nif_error(:nif_not_loaded)
end

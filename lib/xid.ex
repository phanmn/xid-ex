defmodule Xid do
  @moduledoc """
  Documentation for `Xid`.
  """

  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :xid,
    crate: "xid",
    base_url:
      "https://github.com/zoonect/xid_ex/releases/download/v#{version}",
    force_build: System.get_env("XID_BUILD") in ["1", "true"],
    targets:
      Enum.uniq(["aarch64-unknown-linux-musl" | RustlerPrecompiled.Config.default_targets()]),
    version: version

  # When your NIF is loaded, it will override this function.
  def generate, do: :erlang.nif_error(:nif_not_loaded)
end

defmodule Xid.MixProject do
  use Mix.Project

  @version "0.1.5"
  @source_url "https://github.com/zoonect/xid_ex"

  def project do
    [
      app: :xid,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      description: "An Elixir library for using Xid rust implementation with Rustler",
      package: package(),
      deps: deps()
    ]
  end

  # When publishing a library to with precompiled NIFs to Hex,
  # is is mandatory to include a checksum file (along with other
  # necessary files in the library).
  #
  # Refer to the "The release flow"
  # in the "Precompilation guide" for more details:
  # https://hexdocs.pm/rustler_precompiled/precompilation_guide.html#the-release-flow
  defp package do
    [
      files: [
        "lib",
        "native",
        "checksum-*.exs",
        "mix.exs"
      ],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler_precompiled, ">= 0.0.0"},
      {:rustler, ">= 0.0.0", optional: true},
      {:git_ops, ">= 0.0.0", only: [:dev]},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end

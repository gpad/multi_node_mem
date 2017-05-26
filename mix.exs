defmodule MultiNodeMem.Mixfile do
  use Mix.Project

  def project do
    [app: :multi_node_mem,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :mem],
     mod: {MultiNodeMem.Application, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      #{:mem, path: "../mem"}
      #{:mem, "~> 0.3.1"}
      {:mem, git: "https://github.com/gpad/mem.git", branch: "multinode"}
    ]
  end
end

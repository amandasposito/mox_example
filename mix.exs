defmodule MoxExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :mox_example,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:httpoison, "~> 1.4"},
      {:jason, "~> 1.1"},
      {:bypass, "~> 1.0", only: :test},
      {:mox, "~> 0.5", only: :test}
    ]
  end
end

defmodule SilverLegion.MixProject do
  use Mix.Project

  def project do
    [
      app: :silver_legion,
      version: "0.1.0",
      elixir: "~> 1.14",
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
      {:csv, "~> 3.2.1"},
      {:yaml_elixir, "~> 2.9"}
    ]
  end
end

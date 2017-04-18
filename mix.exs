defmodule ElixirServiceBootstrap.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_service_bootstrap,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     aliases: aliases()]
  end

  def application do
    [extra_applications: [:logger],
     mod: {ElixirServiceBootstrap.Application, []}]
  end

  defp aliases do
    ["ecto.reset": ["ecto.drop --quiet", "ecto.create --quiet", "ecto.migrate"],
     "test.once": ["ecto.reset", "test"]]
  end

  defp deps do
    [{:mix_test_watch, github: "aforward/mix-test.watch", only: :dev, runtime: false},
     {:postgrex, "~> 0.13.2"},
     {:ecto, "~> 2.1"},
     {:poison, "~> 3.1.0"},
     {:ex_doc, ">= 0.0.0", only: :dev}]
  end
end

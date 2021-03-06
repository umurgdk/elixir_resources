defmodule ElixirResources.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_resources,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {ElixirResources, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger, :phoenix_ecto, :postgrex,
       :eredis, :exq, :quantum,
       :feeder_ex, :httpoison]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support", "test/youtube_api"]
  defp elixirc_paths(_),     do: ["lib", "web", "workers"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 1.0.0"},
     {:phoenix_ecto, "~> 1.1"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.1"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:cowboy, "~> 1.0"},
     {:exq, "~> 0.2.1"},
     {:feeder_ex, "~> 0.0.2"},
     {:httpoison, "~> 0.7.2"},
     {:quantum, ">= 1.4.0"},
     {:eh, only: :dev},
     {:mix_test_watch, "~> 0.2", only: :dev},
     {:mock, "~> 0.1.1", only: :test}]
  end
end

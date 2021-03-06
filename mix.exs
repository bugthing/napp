defmodule Napp.Mixfile do
  use Mix.Project

  def project do
    [app: :napp,
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
    [extra_applications: [:logger],
     mod: {Napp.Application, []}]
  end

  defp deps do
    [
      { :sqlitex, "~> 1.3" },
      { :cowboy, "~> 1.1" },
      { :plug, "~> 1.3" },
      { :remix, "~> 0.0.2" },
      { :poison, "~> 3.1" },
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false}
    ]
  end
end

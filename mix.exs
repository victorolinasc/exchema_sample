defmodule SimpleApiAuth.MixProject do
  use Mix.Project

  def project do
    [
      app: :simple_api_auth,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {SimpleApiAuth.Application, []}
    ]
  end

  defp deps do
    [
      {:plug, "~> 1.5"},
      {:cowboy, "~> 2.3"},
      {:jason, "~> 1.0"},
      {:cachex, "~> 3.0"},
      {:burnex, "~> 1.0"},
      {:uuid, "~> 1.1"},
      {:exchema, git: "https://github.com/bamorim/exchema.git", branch: "feat/new-dsl"}
    ]
  end
end

defmodule SimpleApiAuth.Application do
  use Application
  alias SimpleApiAuth.{Router, InMemoryDB}

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      {Plug.Adapters.Cowboy2, scheme: :http, plug: Router, options: [port: 4000]},
      worker(Cachex, [InMemoryDB.__cache_name__(), [limit: 500]])
    ]

    opts = [strategy: :one_for_one, name: SimpleApiAuth.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

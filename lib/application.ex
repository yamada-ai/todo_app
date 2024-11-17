defmodule TodoApp.Application do
  use Application

  def start(_type, _args) do
    children = [
      {TodoApp.Infrastructure.TodoRepositoryImpl, []},
      {Plug.Cowboy, scheme: :http, plug: TodoApp.Router, options: [port: 4000]}
    ]

    opts = [strategy: :one_for_one, name: TodoApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

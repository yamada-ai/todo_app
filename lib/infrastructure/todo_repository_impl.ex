defmodule TodoApp.Infrastructure.TodoRepositoryImpl do
  @behaviour TodoApp.Domain.TodoRepository

  use Agent

  def start_link(_args) do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  @impl true
  def create(todo) do
    Agent.update(__MODULE__, fn todos -> [todo | todos] end)
    {:ok, todo}
  end

  @impl true
  def all do
    Agent.get(__MODULE__, & &1)
  end
end

defmodule TodoApp.Usecase.CreateTodo do
  alias TodoApp.Domain.Todo
  alias TodoApp.Infrastructure.TodoRepositoryImpl

  @spec execute(String.t(), String.t()) :: {:ok, Todo.t()} | {:error, term()}
  def execute(title, description) do

    params = %{title: title, description: description}

    case Todo.validate(params) do
      :ok ->
        id = UUID.uuid4()
        todo = %Todo{id: id, title: title, description: description, status: :pending}
        TodoRepositoryImpl.create(todo)

      {:error, message} ->
        {:error, message}
    end
  end
end

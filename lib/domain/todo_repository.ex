defmodule TodoApp.Domain.TodoRepository do
  @callback create(TodoApp.Domain.Todo.t()) :: {:ok, TodoApp.Domain.Todo.t()} | {:error, term()}
  @callback all() :: [TodoApp.Domain.Todo.t()]
end

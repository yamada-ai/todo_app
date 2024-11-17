defmodule TodoApp.Usecase.GetTodos do
  alias TodoApp.Infrastructure.TodoRepositoryImpl

  @spec execute() :: [TodoApp.Domain.Todo.t()]
  def execute do
    TodoRepositoryImpl.all()
  end
end

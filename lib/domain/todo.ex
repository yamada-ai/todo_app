defmodule TodoApp.Domain.Todo do
  @derive {Jason.Encoder, only: [:id, :title, :description, :status]}
  defstruct [:id, :title, :description, :status]

  @type t :: %__MODULE__{
          id: String.t(),
          title: String.t(),
          description: String.t(),
          status: :pending | :completed
        }

  @spec validate(map()) :: :ok | {:error, String.t()}
  def validate(%{title: title, description: description}) do
    cond do
      is_nil(title) or title == "" -> {:error, "Title is required"}
      String.length(title) < 3 -> {:error, "Title must be at least 3 characters long"}
      description && String.length(description) > 500 -> {:error, "Description must be at most 500 characters long"}
      true -> :ok
    end
  end
end

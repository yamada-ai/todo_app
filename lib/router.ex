defmodule TodoApp.Router do
  use Plug.Router
  alias TodoApp.Usecase.CreateTodo
  alias TodoApp.Usecase.GetTodos
  alias TodoApp.JSONParser

  plug :match
  plug :dispatch

  post "/todos" do
    {:ok, body, _conn} = Plug.Conn.read_body(conn)
    {:ok, params} = JSONParser.parse(body)

    case CreateTodo.execute(params["title"], params["description"]) do
      {:ok, todo} ->
        {:ok, json} = JSONParser.encode(%{id: todo.id, title: todo.title, status: todo.status})
        send_resp(conn, 201, json)

      {:error, message} ->
        send_resp(conn, 400, Jason.encode!(%{error: message}))
    end
  end

  get "/todos" do
    todos = GetTodos.execute()
    {:ok, json} = JSONParser.encode(todos)
    send_resp(conn, 200, json)
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end

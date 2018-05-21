defmodule SimpleApiAuth.UserController do
  import Plug.Conn
  import Exchema.Coercion, only: [coerce: 2]
  alias SimpleApiAuth.{Model.User, InMemoryDB}

  def get_user(conn, user_id: user_id) do
    with true <- Exchema.is?(user_id, Id),
         {:ok, user} <- InMemoryDB.get("user:#{user_id}") do
      send_json(conn, 200, user)
    else
      _ -> send_resp(conn, 404, "Not found")
    end
  end

  def create_user(conn, _opts) do
    user = coerce(conn.body_params, User)

    case Exchema.is?(user, User) do
      true ->
        user_id = UUID.uuid4()
        user = %{user | id: user_id}

        InMemoryDB.insert("user:#{user_id}", user)
        send_json(conn, 201, user)

      false ->
        send_resp(conn, 400, "Bad request")
    end
  end

  defp send_json(conn, status, body) do
    conn
    |> put_resp_header("content-type", "application/json")
    |> send_resp(status, Jason.encode!(body))
  end
end

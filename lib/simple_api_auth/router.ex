defmodule SimpleApiAuth.Router do
  use Plug.Router
  alias SimpleApiAuth.UserController

  plug(Plug.RequestId)
  plug(Plug.Logger)
  plug(Plug.Parsers, parsers: [:json], json_decoder: Jason)
  plug(:match)
  plug(:dispatch)

  get("/users/:user_id", do: UserController.get_user(conn, user_id: user_id))
  put("/users", do: UserController.create_user(conn, []))

  match _ do
    send_resp(conn, 404, "oops")
  end
end

defmodule SimpleApiAuth.Model.User do
  import Exchema.Notation
  alias Exchema.Types, as: T

  @derive Jason.Encoder
  structure(
    id: {T.Optional, Id},
    first_name: Name,
    last_name: Name,
    email: Email
  )
end

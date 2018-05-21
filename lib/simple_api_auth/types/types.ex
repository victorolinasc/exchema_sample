import Exchema.Notation
alias Exchema.Types, as: T

newtype(Name, T.String)

subtype(
  Id,
  T.String,
  fun: fn val ->
    with {:ok, opts} <- UUID.info(val),
         4 <- opts[:version],
         :default <- opts[:type] do
      {:ok, val}
    else
      _ ->
        {:error, :not_valid_uuid}
    end
  end
)

subtype(
  Email,
  T.String,
  fun: fn val ->
    if not Burnex.is_burner?(val) do
      true
    else
      {:error, :expendable_email}
    end
  end
)

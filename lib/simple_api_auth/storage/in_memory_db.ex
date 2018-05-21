defmodule SimpleApiAuth.InMemoryDB do
  @cache :in_memory_db

  def __cache_name__(), do: @cache

  def insert(id, data) when is_binary(id) and is_map(data) do
    Cachex.put(@cache, id, data)
  end

  def get(key) do
    case Cachex.get(@cache, key) do
      {:ok, nil} ->
        {:error, :not_found}

      {:ok, data} ->
        {:ok, data}

      {:error, error} ->
        {:error, error}
    end
  end
end

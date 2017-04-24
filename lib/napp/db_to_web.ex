defmodule Napp.DbToWeb do

  def list_tables do
    resp = %{status: 500, data: [], struct: %{}, json: ""}

    Napp.SqliteDb.table_names
    |> handle_db_response(resp)
    |> fn (resp) -> %{resp | data: %{tables: Enum.map(resp.data, fn(x) -> x[:name] end) } } end.() 
    |> handle_structure
    |> handle_json
  end

  def table_content(table_name) do
    resp = %{status: 500, data: "{}", struct: [], json: ""}

    Napp.SqliteDb.table_content(table_name)
    |> handle_db_response(resp)
    |> handle_structure
    |> handle_json
  end

  defp handle_db_response({:ok, body}, resp) do
    %{resp | status: 200, data: body }
  end

  defp handle_db_response({:error, _}, resp) do
    %{resp | status: 404 }
  end

  defp handle_structure(resp = %{status: 404}) do
    %{resp | struct: %{"error": "fail whale"} }
  end

  defp handle_structure(resp = %{status: 200, data: d}) when is_list(d) do
    %{resp | struct: Enum.map(resp.data, fn(x) -> Enum.into(x, %{}) end) }
  end

  defp handle_structure(resp = %{status: 200, data: _}) do
    %{resp | struct: Enum.into(resp.data, %{}) }
  end

  defp handle_json(resp) do
    %{resp | json: Poison.encode!(resp.struct) }
  end
end

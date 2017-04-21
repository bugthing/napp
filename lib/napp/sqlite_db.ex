defmodule Napp.SqliteDb do
  def table_names do
    {:ok, tables_info} = Sqlitex.Server.query(Sqlitex.Server, "SELECT name FROM sqlite_master WHERE type='table'")
    Enum.map(tables_info, fn(x) -> x[:name] end)
  end

  def table_content(table_name) do
    {:ok, table_rows} = Sqlitex.Server.query(Sqlitex.Server, "SELECT * FROM #{table_name}")
    Enum.map(table_rows, fn(x) -> Enum.into(x, %{}) end)
  end
end

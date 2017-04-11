defmodule Napp.SqliteDb do
  def table_names do
    {:ok, tables_info} = Sqlitex.Server.query(Sqlitex.Server, "SELECT name FROM sqlite_master WHERE type='table'")
    Enum.map(tables_info, fn(x) -> x[:name] end)
  end
end

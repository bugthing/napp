defmodule Napp.SqliteDb do
  def table_names do
    Sqlitex.Server.query(Sqlitex.Server, "SELECT name FROM sqlite_master WHERE type='table'")
  end

  def table_content(table_name) do
    Sqlitex.Server.query(Sqlitex.Server, "SELECT * FROM #{table_name}")
  end
end

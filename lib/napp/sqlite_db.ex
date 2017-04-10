defmodule Napp.SqliteDb do
  def list_tables do
    Sqlitex.Server.query(Sqlitex.Server, "SELECT name FROM sqlite_master WHERE type='table'")
  end
end

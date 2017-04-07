defmodule Napp.SqliteDb do
  def list_tables do
    Sqlitex.with_db('db/example001.db', fn(db) ->
      Sqlitex.query(db, "SELECT name FROM sqlite_master WHERE type='table'")
    end)
  end
end

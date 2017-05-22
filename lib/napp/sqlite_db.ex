defmodule Napp.SqliteDb do
  def table_names do
    Sqlitex.Server.query(Sqlitex.Server, "SELECT name FROM sqlite_master WHERE type='table'")
  end

  def table_content(table_name) do
    Sqlitex.Server.query(Sqlitex.Server, "SELECT * FROM #{table_name}")
  end

  def table_content_row(table_name, row_id) do
    # TODO: discover primary key then use that (not just "_id")
    Sqlitex.Server.query(Sqlitex.Server, "SELECT * FROM #{table_name} WHERE _id=#{row_id}")
  end
end

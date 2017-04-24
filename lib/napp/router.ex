defmodule Napp.Router do
  use Plug.Router

  require Logger

  plug Plug.Logger
  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http Napp.Router, []
  end

  get "/" do
    Napp.DbToWeb.list_tables
    |> send_db_to_web(conn)
  end

  get "/:table_name" do
    Napp.DbToWeb.table_content(table_name)
    |> send_db_to_web(conn)
  end

  get "/:table_name/:row_id" do
    Napp.DbToWeb.table_content_row(table_name, row_id)
    |> send_db_to_web(conn)
  end

  match _ do
    send_resp(conn, 404, "Fail Whale")
  end

  defp send_db_to_web(dbtoweb, conn) do
    conn 
    |> put_resp_content_type("application/json")
    |> send_resp(dbtoweb.status, dbtoweb.json)
  end
end

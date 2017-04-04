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
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{tables: ["table1","table2"]}))
  end

  match _ do
    send_resp(conn, 404, "Fail Whale")
  end

end

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
    send_resp(conn, 200, "Hello Fish")
  end

  match _ do
    send_resp(conn, 404, "Fail Whale")
  end

end

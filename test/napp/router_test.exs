defmodule NappRouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Napp.Router.init([])

  test "get / returns list of table names" do
    # Create a test connection
    conn = conn(:get, "/")

    # Invoke the plug
    conn = Napp.Router.call(conn, @opts)

    # Assert the response, status, headers and body
    assert conn.state == :sent
    assert conn.status == 200
    assert Enum.member?(conn.resp_headers, {"content-type", "application/json; charset=utf-8"})
    assert String.contains?(conn.resp_body, ~s("tables":[))
  end

  test "get /not_a_table returns error" do
    conn = conn(:get, "/not_a_table")
    conn = Napp.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 404
  end

  test "get /table_players returns content of table" do
    conn = conn(:get, "/table_players")
    conn = Napp.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert Enum.member?(conn.resp_headers, {"content-type", "application/json; charset=utf-8"})
    assert String.contains?(conn.resp_body, ~s([{"))
  end

  test "get /table_players/1 returns content of a table row" do
    conn = conn(:get, "/table_players/1")
    conn = Napp.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert Enum.member?(conn.resp_headers, {"content-type", "application/json; charset=utf-8"})
    assert String.contains?(conn.resp_body, ~s({"))
  end
end

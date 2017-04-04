defmodule NappRouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Napp.Router.init([])

  test "returns hello world" do
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
end

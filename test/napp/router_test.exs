defmodule NappRouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Napp.Router.init([])

  test "returns hello world" do
    # Create a test connection
    conn = conn(:get, "/")

    # Invoke the plug
    conn = Napp.Router.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hello Fish"
  end
end

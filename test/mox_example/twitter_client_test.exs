defmodule MoxExample.TwitterClientTest do
  use ExUnit.Case

  alias MoxExample.TwitterClient

  setup do
    bypass = Bypass.open
    {:ok, bypass: bypass}
  end

  test "fetch/1 returns and formats tweets", %{bypass: bypass} do
    response = Jason.encode!([%{"text" => "Elixir Brasil 2019"}])

    Bypass.expect(bypass, fn conn ->
      assert "/1.1/search/tweets.json" == conn.request_path
      assert "GET" == conn.method
      Plug.Conn.resp(conn, 200, response)
    end)

    tweets = TwitterClient.fetch("http://localhost:#{bypass.port}")

    assert tweets == [%{"text" => "Elixir Brasil 2019"}]
  end
end

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

    Application.put_env(:mox_example, :twitter_api, "http://localhost:#{bypass.port}")

    tweets = TwitterClient.fetch()

    assert tweets == [%{"text" => "Elixir Brasil 2019"}]
  end
end

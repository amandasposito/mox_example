defmodule MoxExample.TimelineTest do
  use ExUnit.Case

  import Mox

  # Make sure mocks are verified when the test exits
  setup :verify_on_exit!

  alias MoxExample.Timeline
  alias MoxExample.TwitterMock

  test "messages/0 lists all messages from the timeline" do
    TwitterMock
    |> expect(:fetch, fn _url -> [%{"text" => "Olá mundo"}] end)

    assert Timeline.messages() == [%{"text" => "Olá mundo"}]
  end
end

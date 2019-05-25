defmodule MoxExample.TimelineTest do
  use ExUnit.Case

  import Mox

  # Make sure mocks are verified when the test exits
  setup :verify_on_exit!

  alias MoxExample.{Timeline, TwitterMock}

  test "messages/0 lists all messages from the timeline" do
    TwitterMock
    |> expect(:fetch, fn -> [%{"text" => "Olá mundo"}] end)

    assert Timeline.messages() == {:ok, 1}
  end
end

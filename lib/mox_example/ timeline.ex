defmodule MoxExample.Timeline do
  @twitter Application.get_env(:mox_example, :twitter)

  def messages do
    {:ok, Enum.count(@twitter.fetch())}
  end
end

defmodule MoxExample.Timeline do
  alias MoxExample.TwitterClient

  def messages do
    TwitterClient.fetch()
  end
end

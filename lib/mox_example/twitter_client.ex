defmodule MoxExample.TwitterClient do
  @behaviour MoxExample.Twitter

  def fetch do
    {:ok, response} = HTTPoison.get("#{twitter_api()}/1.1/search/tweets.json")

    Jason.decode!(response.body)
  end

  defp twitter_api do
    Application.get_env(:mox_example, :twitter_api)
  end
end

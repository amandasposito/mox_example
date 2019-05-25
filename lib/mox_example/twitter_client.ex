defmodule MoxExample.TwitterClient do
  @behaviour MoxExample.Twitter

  def fetch(url \\ "https://api.twitter.com") do
    {:ok, response} = HTTPoison.get("#{url}/1.1/search/tweets.json")
    Jason.decode!(response.body)
  end
end

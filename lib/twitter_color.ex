defmodule TwitterColor do

  import ExTwitter

  @moduledoc """
  Documentation for TwitterColor.
  """

  @doc """
  Hello world.

  ## Examples

      iex> TwitterColor.hello
      :world

  """
  def hello do
    :world
  end

  def setup do
    twitter_keys = Application.get_all_env(:extwitter)
    |>IO.inspect()

    ExTwitter.configure(
    consumer_key: System.get_env("CONSUMER_KEY"),
    consumer_secret: System.get_env("CONSUMER_SECRET"),
    access_token: System.get_env("ACCESS_TOKEN"),
    access_token_secret: System.get_env("ACCESS_TOKEN_SECRET")
    )

    ExTwitter.search("cats", [count: 5]) |>
     Enum.map(fn(tweet) -> tweet.text end) |>
     Enum.join("\n-----\n") |>
     IO.puts
  end



end

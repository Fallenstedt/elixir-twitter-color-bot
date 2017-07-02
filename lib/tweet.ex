defmodule TwitterColor.Tweet do
  import ExTwitter

  def main do
    setup()
    tweet_image_with_message("I made an image just for you")
  end

  def tweet_image_with_message(message) do
    image = File.read!("hey.png")
    ExTwitter.update_with_media(message, image)
  end

  def search_for_cats do
    ExTwitter.search("cats", [count: 50]) |>
    Enum.map(fn(tweet) -> tweet.text end) |>
    Enum.join("\n-----\n") |>
    IO.puts
  end

  def setup do
    ExTwitter.configure(
    consumer_key: System.get_env("CONSUMER_KEY"),
    consumer_secret: System.get_env("CONSUMER_SECRET"),
    access_token: System.get_env("ACCESS_TOKEN"),
    access_token_secret: System.get_env("ACCESS_TOKEN_SECRET")
    )
  end
end

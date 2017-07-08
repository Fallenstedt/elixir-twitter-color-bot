defmodule TwitterColor.Tweet do
  import ExTwitter

  @moduledoc """
    Responsible for posting to twitter
  """

  @doc """
    Configures keys and posts to twitter
  """
  def main do
    setup()
    tweet_image_with_message("Do these #colors work well together? I can't tell.")
  end

  @doc """
    Tweets a message and image
  """
  def tweet_image_with_message(message) do
    image = File.read!("hey.png")
    ExTwitter.update_with_media(message, image)
    IO.puts "Tweeting the message..."
  end

  @doc """
    Sets up twitter with api keys
  """
  def setup do
    ExTwitter.configure(
    consumer_key: System.get_env("CONSUMER_KEY"),
    consumer_secret: System.get_env("CONSUMER_SECRET"),
    access_token: System.get_env("ACCESS_TOKEN"),
    access_token_secret: System.get_env("ACCESS_TOKEN_SECRET")
    )
  end
end

defmodule TwitterColor do
  @moduledoc """
    Main function that generates an image and posts it to twitter.
  """
  alias TwitterColor.CreateImage
  alias TwitterColor.Tweet

  @doc """
    Called by cron in config to create and post an image once per hour.
  """
  def main do
    IO.puts("Generating a post...")
    CreateImage.main()
    Tweet.main()
    IO.puts("Done!")
  end
end

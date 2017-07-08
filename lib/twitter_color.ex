defmodule TwitterColor do

  @moduledoc """
    Main function that generates an image and posts it to twitter.
  """

  @doc """
    Called by cron in config to create and post an image once per hour.
  """
  def main do
    IO.puts("Generating a post...")
    TwitterColor.CreateImage.main()
    TwitterColor.Tweet.main()
    IO.puts("Done!")
  end
end

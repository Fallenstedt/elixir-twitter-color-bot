defmodule TwitterColor do
  def main do
    IO.puts("Generating a post...")
    TwitterColor.CreateImage.main()
    TwitterColor.Tweet.main()
    IO.puts("Done!")
  end
end

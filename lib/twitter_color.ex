defmodule TwitterColor do

  import ExTwitter

  @doc """
  Configures ExTwitter, creates an image, and posts it to twitter.
  """

  def main() do
    # setup()

    create_random_string(24)
    |> hash_input
    |> pick_color
    |> IO.inspect()
  end

  @doc """
  Takes an `Identicon.Image` struct and pattern matches first three values from `hex` list. Returns a new struct twith `hex:` and `color:` defined.
  """
  def pick_color(%TwitterColor.Image{hex: [r, g, b | _tail ]} = image) do
    %TwitterColor.Image{image | color: %{:color1 => {r, g, b}, :color2 => {g, b, r}, :color3 => {b, r, g} }}
  end

  @doc """
  Creates a random string from a specified length. Returns struct.
  """
  def create_random_string(length) do
    string = :crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length)
    %TwitterColor.Image{string: string}
  end

  @doc """
  Takes a string input and returns a `Identicon.Image` struct. Hashes an input string and binds it to `:hex` property.
  """
  def hash_input(%TwitterColor.Image{string: string} = image) do
    hex = :crypto.hash(:md5, string)
    |> :binary.bin_to_list

    %TwitterColor.Image{ image | hex: hex}
  end

  def setup do
    ExTwitter.configure(
    consumer_key: System.get_env("CONSUMER_KEY"),
    consumer_secret: System.get_env("CONSUMER_SECRET"),
    access_token: System.get_env("ACCESS_TOKEN"),
    access_token_secret: System.get_env("ACCESS_TOKEN_SECRET")
    )

    # ExTwitter.search("cats", [count: 5]) |>
    #  Enum.map(fn(tweet) -> tweet.text end) |>
    #  Enum.join("\n-----\n") |>
    #  IO.puts
  end



end

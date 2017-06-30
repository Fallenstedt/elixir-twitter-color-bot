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
    |> create_grid
    |> build_pixel_map
    |> draw_image
    |> save_image
  end

  @doc """
  Writes image to drive in images directory.
  """

  def save_image(image) do
    File.write("hey.png", image)
  end

  @doc """
    renders the image
  """
  def draw_image(%TwitterColor.Image{color: color, pixel_map: pixel_map} = image) do
    IO.inspect image

    %{ color1: color1, color2: color2, color3: color3} = color
    image = :egd.create(300, 300)
    fill1 = :egd.color(color1)
    fill2 = :egd.color(color2)
    fill3 = :egd.color(color3)

    Enum.each pixel_map, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop, fill1) #modifying existing image variable. It's weird.
    end

    :egd.render(image)
  end


  @doc """
  Builds a 300x300 pixel map for three seperate colors from a grid.
  """

  def build_pixel_map(%TwitterColor.Image{ grid: grid } = image) do
    pixel_map = Enum.map grid, fn({_code, index}) ->
      horizontal = rem(index, 3) * 100
      vertical = div(index, 3) * 100
      top_left = {horizontal, vertical}
      bottom_right = {horizontal + 100, vertical + 300}

      {top_left, bottom_right}
    end
    %TwitterColor.Image{ image | pixel_map: pixel_map}
  end

  @doc """
  Accepts an Image Struct as an arguement and returns a grid
  """
  def create_grid(image) do
    grid = [100, 100, 100]
    |> Enum.with_index

    %TwitterColor.Image{ image | grid: grid}
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

    ExTwitter.search("cats", [count: 50]) |>
     Enum.map(fn(tweet) -> tweet.text end) |>
     Enum.join("\n-----\n") |>
     IO.puts
  end

end

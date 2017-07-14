defmodule TwitterColor.CreateImage do

  @moduledoc """
    Creates a 300x300 image with three random colored rectangles
  """

  @doc """
    Generates an image
  """
  def main() do
    pick_color()
    |> create_grid
    |> build_pixel_map
    |> draw_image
    |> save_image
  end

  @doc """
    Writes image to drive.
  """
  def save_image(image) do
    IO.puts "Saving the image..."
    File.write("hey.png", image)
  end

  @doc """
    renders the image with a pixel_map and color.
  """
  def draw_image(%TwitterColor.Image{color: color, pixel_map: pixel_map}) do
    image = :egd.create(300, 300)

    Enum.zip(pixel_map, color)
    |> Enum.each(fn({{start, stop}, fill}) ->
      egd_fill = :egd.color(fill)
      :egd.filledRectangle(image, start, stop, egd_fill)
    end)

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

  @doc ~S"""
  Create three random r,g,b colors as a list of three tuples

  ## Examples
      iex> struct = TwitterColor.CreateImage.pick_color()
      iex> struct.color
      [{207, 127, 117}, {219, 121, 237}, {109, 101, 206}]

  """
  def pick_color() do
    color = Enum.map((0..2), fn(x)->
      r = Enum.random(0..255)
      g = Enum.random(0..255)
      b = Enum.random(0..255)
      {r, g, b}
    end)

    %TwitterColor.Image{color: color}
  end
end

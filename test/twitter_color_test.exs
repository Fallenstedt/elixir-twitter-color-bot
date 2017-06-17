defmodule TwitterColorTest do
  use ExUnit.Case
  doctest TwitterColor

  test "create_random_string creates a string of specified length" do
    struct = TwitterColor.create_random_string(12)
    string_length = String.length(struct.string)
    assert string_length == 12
  end

  test "pick_color three rgb colors are made from a crypto.hash value, and each color is a tuple of 3 numbers" do
    image = TwitterColor.create_random_string(12)
    |> TwitterColor.hash_input
    |> TwitterColor.pick_color

    colors = Map.values(image.color)
    [ color1, color2, color3 ] = colors

    assert length(colors) == 3
    assert tuple_size(color1) == 3
    assert tuple_size(color2) == 3
    assert tuple_size(color3) == 3
  end

end

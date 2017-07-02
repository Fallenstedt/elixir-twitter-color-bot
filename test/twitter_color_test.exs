defmodule TwitterColorTest do
  use ExUnit.Case
  doctest TwitterColor

  test "create_random_string creates a string of specified length" do
    struct = TwitterColor.create_random_string(12)
    string_length = String.length(struct.string)
    assert string_length == 12
  end

  test "pick_color produces a list with three tuples, with each tuple having a length of 3" do
    struct = TwitterColor.CreateImage.pick_color
    [ color1, color2, color3 ] = struct.color

    assert length(struct.color) == 3
    assert tuple_size(color1) == 3
    assert tuple_size(color2) == 3
    assert tuple_size(color3) == 3
  end

end

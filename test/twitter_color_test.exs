defmodule TwitterColorTest do
  use ExUnit.Case
  import TwitterColor.CreateImage
  doctest TwitterColor

  test "pick_color produces a list with three tuples, with each tuple having a length of 3" do
    struct = pick_color()
    [ color1, color2, color3 ] = struct.color

    assert length(struct.color) == 3
    assert tuple_size(color1) == 3
    assert tuple_size(color2) == 3
    assert tuple_size(color3) == 3
  end

  test "create_grid creates a list of three tuples, each have a vlue of 100," do
    img = %TwitterColor.Image{}
    |> create_grid

    Enum.each(img.grid, fn({size, _index}) ->
      assert size == 100
    end)
  end
end

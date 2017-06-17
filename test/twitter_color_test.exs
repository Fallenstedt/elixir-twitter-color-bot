defmodule TwitterColorTest do
  use ExUnit.Case
  doctest TwitterColor

  test "createRandomString creates a string of specified length" do
    struct = TwitterColor.createRandomString(12)
    string_length = String.length(struct.string)
    assert string_length == 12
  end

end

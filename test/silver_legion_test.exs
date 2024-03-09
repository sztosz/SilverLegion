defmodule SilverLegionTest do
  use ExUnit.Case
  doctest SilverLegion

  test "greets the world" do
    assert SilverLegion.hello() == :world
  end
end

defmodule SaverTest do
  use ExUnit.Case
  doctest Saver

  test "greets the world" do
    assert Saver.hello() == :world
  end
end

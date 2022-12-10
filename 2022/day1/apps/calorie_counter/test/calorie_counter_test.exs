defmodule CalorieCounterTest do
  use ExUnit.Case
  doctest CalorieCounter

  test "greets the world" do
    assert CalorieCounter.hello() == :world
  end
end

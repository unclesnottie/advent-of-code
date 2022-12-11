defmodule SignalTest do
  use ExUnit.Case
  doctest Signal

  test "greets the world" do
    assert Signal.hello() == :world
  end
end

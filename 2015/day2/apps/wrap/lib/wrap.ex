defmodule Wrap do
  @moduledoc """
  Documentation for Wrap.
  """

  def calc_total_ribbon(str) do
    str
    |> split_string()
    |> Enum.map(&calc_single_ribbon/1)
    |> Enum.reduce(&+/2)
  end

  def calc_single_ribbon(arr = [l, w, h]) do
    [x, y] = arr
    |> Enum.sort()
    |> Enum.take(2)

    x + x + y + y + l * w * h
  end

  def calc_total_sqft(str) do
    str
    |> split_string()
    |> Enum.map(&calc_single_sqft/1)
    |> Enum.reduce(&+/2)
  end

  def split_string(str) do
    str
    |> String.split(["x", "\n"], trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(3)
  end

  def calc_single_sqft([l, w, h]) do
    side1 = l * w
    side2 = w * h
    side3 = h * l
    smallest = Enum.min([side1, side2, side3])
    2 * side1 + 2 * side2 + 2 * side3 + smallest
  end
end

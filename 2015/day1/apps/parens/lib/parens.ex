defmodule Parens do
  @moduledoc """
  Documentation for Parens.
  """

  def get_floor(""), do: 0
  def get_floor(str) do
    str
    |> String.graphemes()
    |> Enum.map(fn x -> x == "(" && 1 || -1 end)
    |> Enum.reduce(&+/2)
  end

  def get_basement(str) do
    {arr, _} = str
    |> String.graphemes()
    |> Enum.map(fn x -> x == "(" && 1 || -1 end)
    |> Enum.map_reduce(0, fn x, acc -> {x + acc, x + acc} end)

    ind = arr
    |> Enum.find_index(fn x -> x < 0 end)

    is_integer(ind) && ind + 1 || ind
  end
end

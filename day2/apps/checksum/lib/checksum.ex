defmodule Checksum do
  @moduledoc """
  Documentation for Checksum.
  """

  @doc false
  def calc(lst) when is_list(lst) do
    Enum.reduce(lst, 0, fn l, acc ->
      Enum.max(l) - Enum.min(l) + acc
    end)
  end

  @doc false
  def calc2(lst) when is_list(lst) do
    Enum.reduce(lst, 0, fn l, acc ->
      row_score(l) + acc
    end)
  end

  @doc false
  def row_score(lst = [h | t]) when is_list(lst) do
    Enum.find_value(t, fn x -> get_divisible(x, h) end) || row_score(t)
  end

  @doc false
  def get_divisible(x, y) do
    cond do
      x / y == div(x, y) -> div(x, y)
      y / x == div(y, x) -> div(y, x)
      true -> false
    end
  end
end

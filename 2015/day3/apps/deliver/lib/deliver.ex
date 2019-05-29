defmodule Deliver do
  @moduledoc """
  Documentation for Deliver.
  """

  def count_houses_robo(str) do
    robo_moves = str
                 |> build_moves()
                 |> Enum.take_every(2)

    santa_moves = "0" <> str
                  |> build_moves()
                  |> Enum.take_every(2)

    robo_houses = robo_moves
                  |> build_houses()

    santa_houses = santa_moves
                   |> build_houses()

    robo_houses ++ santa_houses
    |> Enum.uniq()
    |> length()
  end

  def count_houses(str) do
    str
    |> build_moves()
    |> build_houses()
    |> Enum.uniq()
    |> length()
  end

  def build_moves(str) do
    "0" <> str
    |> String.graphemes()
    |> Enum.map(&Point.from_char/1)
  end

  def build_houses(arr) do
    {new_arr, _} = arr
    |> Enum.map_reduce(%Point{x: 0, y: 0}, fn p, acc -> {Point.move(p, acc), Point.move(p, acc)} end)
    new_arr
  end

end

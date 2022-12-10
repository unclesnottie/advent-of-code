defmodule Rucksack do
  @moduledoc """
  Documentation for `Rucksack`.
  """

  @converter %{
    "a" => 1,
    "b" => 2,
    "c" => 3,
    "d" => 4,
    "e" => 5,
    "f" => 6,
    "g" => 7,
    "h" => 8,
    "i" => 9,
    "j" => 10,
    "k" => 11,
    "l" => 12,
    "m" => 13,
    "n" => 14,
    "o" => 15,
    "p" => 16,
    "q" => 17,
    "r" => 18,
    "s" => 19,
    "t" => 20,
    "u" => 21,
    "v" => 22,
    "w" => 23,
    "x" => 24,
    "y" => 25,
    "z" => 26,
    "A" => 27,
    "B" => 28,
    "C" => 29,
    "D" => 30,
    "E" => 31,
    "F" => 32,
    "G" => 33,
    "H" => 34,
    "I" => 35,
    "J" => 36,
    "K" => 37,
    "L" => 38,
    "M" => 39,
    "N" => 40,
    "O" => 41,
    "P" => 42,
    "Q" => 43,
    "R" => 44,
    "S" => 45,
    "T" => 46,
    "U" => 47,
    "V" => 48,
    "W" => 49,
    "X" => 50,
    "Y" => 51,
    "Z" => 52
  }

  @doc """
  The main entry point into Rucksack
  """
  def process(filename) when is_binary(filename) do
    part_one_impl(filename)
  end

  # Implmentation of part one
  defp part_one_impl(filename) when is_binary(filename) do
    total =
      File.stream!(filename)
      |> Stream.map(&String.trim/1)
      |> split_into_compartments()
      |> get_intersection()
      |> get_score()
      |> Enum.sum()

    {:ok, total}
  end

  # Splits rucksack into compartments
  defp split_into_compartments(stream = %Stream{}) do
    stream
    |> Stream.map(fn rucksack ->
      length = String.length(rucksack)

      rucksack
      |> String.split_at(div(length, 2))
    end)
  end

  # Find item in both compartments
  defp get_intersection(stream = %Stream{}) do
    stream
    |> Stream.map(fn {comp1, comp2} ->
      set1 = comp1 |> string_to_mapset()
      set2 = comp2 |> string_to_mapset()

      MapSet.intersection(set1, set2)
      |> MapSet.to_list()
      |> hd()
    end)
  end

  # String to MapSet
  defp string_to_mapset(str) when is_binary(str) do
    str
    |> String.graphemes()
    |> MapSet.new()
  end

  # Convert character to score
  defp get_score(stream = %Stream{}) do
    stream
    |> Stream.map(fn char ->
      @converter[char]
    end)
  end
end

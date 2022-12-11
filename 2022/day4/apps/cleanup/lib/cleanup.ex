defmodule Cleanup do
  @moduledoc """
  Documentation for `Cleanup`.
  """

  @doc """
  The main entry point into Cleanup
  """
  def process(filename) when is_binary(filename) do
    part_one_impl(filename)
  end

  # Implementation of part one
  defp part_one_impl(filename) when is_binary(filename) do
    count =
      File.stream!(filename)
      |> line_to_text_range()
      |> check_overlap()
      |> Enum.count()

    {:ok, count}
  end

  # Splits stream of lines into lists of text ranges
  defp line_to_text_range(stream = %File.Stream{}) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split(&1, ","))
  end

  # Check if a pair of ranges overlap
  defp check_overlap(stream = %Stream{}) do
    stream
    |> Stream.filter(fn [str1, str2 | _] ->
      tup1 = str1 |> text_range_to_tuple()
      tup2 = str2 |> text_range_to_tuple()

      tuples_overlap?(tup1, tup2)
    end)
  end

  # Convert a text range to a tuple of integers
  defp text_range_to_tuple(str) when is_binary(str) do
    [first, last] =
      str
      |> String.split("-")

    {f_int, _} = first |> Integer.parse()
    {l_int, _} = last |> Integer.parse()

    {f_int, l_int}
  end

  # Determines if two intger tuples fully overlap
  defp tuples_overlap?({f1, l1}, {f2, l2}) do
    (f1 <= f2 && l1 >= l2) || (f2 <= f1 && l2 >= l1)
  end
end

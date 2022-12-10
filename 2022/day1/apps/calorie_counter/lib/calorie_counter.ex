defmodule CalorieCounter do
  @moduledoc """
  Documentation for `CalorieCounter`.
  """

  @doc """
  The main entry point into CalorieCounter.
  """
  def process(filename) when is_binary(filename) do
    star_two_impl(filename)
  end

  # The implementation of the first puzzle.
  defp star_one_impl(filename) when is_binary(filename) do
    total =
      filename
      |> File.stream!()
      |> chunk_by_blank_lines()
      |> filter_blank_lines()
      |> map_to_totals()
      |> Enum.max()

    {:ok, total}
  end

  # The implementation of the second  puzzle.
  defp star_two_impl(filename) when is_binary(filename) do
    total =
      filename
      |> File.stream!()
      |> chunk_by_blank_lines()
      |> filter_blank_lines()
      |> map_to_totals()
      |> Enum.sort(&(&1 >= &2))
      |> Enum.take(3)
      |> Enum.sum()

    {:ok, total}
  end

  # Chunks stream by blank lines
  defp chunk_by_blank_lines(stream = %File.Stream{}) do
    stream
    |> Stream.chunk_by(fn text ->
      String.trim(text) == ""
    end)
  end

  # Filters out blank lines from stream
  defp filter_blank_lines(stream = %Stream{}) do
    stream
    |> Stream.filter(fn list ->
      list != ["\n"]
    end)
  end

  # Maps stream values to totals
  defp map_to_totals(stream = %Stream{}) do
    stream
    |> Stream.map(&list_to_total/1)
  end

  # Converts list of strings to total
  defp list_to_total(list = [_ | _]) do
    list
    |> Stream.map(&String.trim/1)
    |> Stream.map(&Integer.parse/1)
    |> Stream.map(fn {int, _} -> int end)
    |> Enum.sum()
  end
end

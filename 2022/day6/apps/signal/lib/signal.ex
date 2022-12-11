defmodule Signal do
  @moduledoc """
  Documentation for `Signal`.
  """

  @doc """
  Entry funtion into Singal
  """
  def process(filename) when is_binary(filename) do
    part_two_impl(filename)
  end

  # Implements solution to part one
  defp part_one_impl(filename) when is_binary(filename) do
    calculate(filename, 4)
  end

  # Implements solution to part two
  defp part_two_impl(filename) when is_binary(filename) do
    calculate(filename, 14)
  end

  # Performs the calculation with the number of marker digits passed in
  defp calculate(filename, digits) when is_binary(filename) and is_integer(digits) do
    input =
      filename
      |> File.stream!()
      |> Enum.to_list()
      |> hd()

    input_list =
      input
      |> String.graphemes()

    {output, _} =
      digits..String.length(input)
      |> Enum.map(fn x ->
        count =
          input_list
          |> Enum.take(x)
          |> Enum.take(-1 * digits)
          |> Enum.uniq()
          |> Enum.count()

        {x, count == digits}
      end)
      |> Enum.find(fn {i, bool} ->
        if bool, do: i
      end)

    {:ok, output}
  end
end

defmodule Signal do
  @moduledoc """
  Documentation for `Signal`.
  """

  @doc """
  Entry funtion into Singal
  """
  def process(filename) when is_binary(filename) do
    part_one_impl(filename)
  end

  # Implements solution to part one
  defp part_one_impl(filename) when is_binary(filename) do
    input =
      filename
      |> File.stream!()
      |> Enum.to_list()
      |> hd()

    input_list =
      input
      |> String.graphemes()

    {output, _} =
      4..String.length(input)
      |> Enum.map(fn x ->
        count =
          input_list
          |> Enum.take(x)
          |> Enum.take(-4)
          |> Enum.uniq()
          |> Enum.count()

        {x, count == 4}
      end)
      |> Enum.find(fn {i, bool} ->
        if bool, do: i
      end)

    {:ok, output}
  end
end

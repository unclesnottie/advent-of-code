defmodule Crane do
  @moduledoc """
  Documentation for `Crane`.
  """

  @doc """
  This is the initial entry point to Crane
  """
  def process(filename) when is_binary(filename) do
    part_one_impl(filename)
  end

  # Implements the solution to part one
  defp part_one_impl(filename) when is_binary(filename) do
    [state, _, moves | _] =
      filename
      |> File.stream!()
      |> split_state_moves()

    initial_state = state |> build_initial_state()

    IO.inspect(initial_state, label: "state")
    IO.inspect(moves, label: "moves")
    {:ok, filename}
  end

  # Splits the initial state from the moves
  defp split_state_moves(stream = %File.Stream{}) do
    stream
    |> Stream.chunk_by(fn line -> line != "\n" end)
    |> Enum.to_list()
  end

  # Build initial state
  defp build_initial_state(state = [_ | _]) do
    [labels | stacks] =
      state
      |> Enum.reverse()

    state_map =
      labels
      |> label_string_to_map()

    stacks
    |> Enum.map(&stack_string_to_list/1)
    |> List.flatten()
    |> Enum.reduce(state_map, fn {key, val}, acc ->
      tail = acc |> Map.get(key)
      acc |> Map.put(key, [val | tail])
    end)
  end

  # Label string to map
  defp label_string_to_map(str) when is_binary(str) do
    str
    |> String.split()
    |> Enum.reduce(%{}, fn x, acc ->
      acc
      |> Map.put(x, [])
    end)
  end

  # Split stack data string into list
  defp stack_string_to_list(str) when is_binary(str) do
    str
    |> String.graphemes()
    |> Stream.chunk_every(4)
    |> Stream.map(&Enum.join/1)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.trim_leading(&1, "["))
    |> Stream.map(&String.trim_trailing(&1, "]"))
    |> Enum.with_index(fn e, i -> {"#{i + 1}", e} end)
    |> Enum.filter(fn {_, value} -> value != "" end)
  end
end

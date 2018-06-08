defmodule Maze do
  @moduledoc """
  Documentation for Maze.
  """

  @doc false
  def get_steps(maze) when is_binary(maze) do
    maze
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> do_get_steps()
  end

  @doc false
  defp do_get_steps(maze) when is_list(maze) do
    maze
    |> calc_steps()
  end

  @doc false
  defp calc_steps(moves) when is_list(moves) do
    move(moves, 0, 0)
  end

  @doc false
  defp move(moves, index, steps) when index < 0 or index >= length(moves) do
    steps
  end
  defp move(moves, index, steps) do
    current = Enum.at(moves, index)
    move(List.replace_at(moves, index, current + 1), index + current, steps + 1)
  end
end

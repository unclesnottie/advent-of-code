defmodule Cli do
  @moduledoc """
  Documentation for Cli.
  """

  @doc false
  def main(args) do
    args
    |> hd()
    |> File.read!()
    |> Maze.get_steps()
    |> IO.puts()
  end
end

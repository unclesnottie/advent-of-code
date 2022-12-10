defmodule Cli do
  @moduledoc """
  Documentation for `Cli`.
  """

  @doc false
  def main(args) do
    case args do
      [] ->
        IO.puts("Please provide a file name")
        System.halt(1)

      [filename | _] ->
        case CalorieCounter.process(filename) do
          {:ok, output} ->
            IO.puts(output)

          {:error, msg} ->
            IO.puts(msg)
            System.stop(1)
        end
    end
  end
end

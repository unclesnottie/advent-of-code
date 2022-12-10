defmodule Cli do
  @moduledoc """
  Documentation for `Cli`.
  """

  @doc false
  def main(args) do
    filename =
      args
      |> hd()

    case CalorieCounter.process(filename) do
      {:ok, output} ->
        IO.puts(output)

      {:error, msg} ->
        IO.puts(msg)
        System.stop(1)
    end
  end
end

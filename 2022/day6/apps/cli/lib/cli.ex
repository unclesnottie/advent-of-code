defmodule CLI do
  @moduledoc """
  Documentation for `CLI`.
  """

  @doc """
  The main function for the command line interface
  """
  def main(args) do
    with {:ok, input} <- parse_args(args),
         {:ok, output} <- Signal.process(input) do
      IO.puts(output)
    else
      {:error, msg} ->
        IO.puts(msg)
        System.stop(1)
    end
  end

  # Parses the command line arugments
  defp parse_args([]), do: {:error, "Please provide an input string"}
  defp parse_args([input | _]), do: {:ok, input}
end

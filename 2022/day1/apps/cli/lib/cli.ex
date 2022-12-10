defmodule Cli do
  @moduledoc """
  Documentation for `Cli`.
  """

  @doc """
  The main function for the command line interface.
  """
  def main(args) do
    with {:ok, filename} <- parse_args(args),
         :ok <- file_exists?(filename),
         {:ok, output} <-
           CalorieCounter.process(filename) do
      IO.puts(output)
    else
      {:error, msg} ->
        IO.puts(msg)
        System.stop(1)
    end
  end

  # Parses command line arguments to get the input file name.
  defp parse_args(args) do
    case args do
      [] ->
        {:error, "Please provide a file name"}

      [filename | _] ->
        {:ok, filename}
    end
  end

  # Verifies the input file exists.
  defp file_exists?(filename) do
    case File.exists?(filename) do
      true -> :ok
      false -> {:error, "File #{filename} does not exist"}
    end
  end
end

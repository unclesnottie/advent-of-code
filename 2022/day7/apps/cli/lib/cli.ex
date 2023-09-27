defmodule CLI do
  @moduledoc """
  Documentation for `CLI`.
  """

  @doc """
  The main function for the command line interface
  """
  def main(args) do
    with {:ok, filename} <- parse_args(args),
         :ok <- file_exists?(filename),
         {:ok, output} <- Saver.process(filename) do
      IO.puts(output)
    else
      {:error, msg} ->
        IO.puts(msg)
        System.stop(1)
    end
  end

  # Parses the command line arguments
  defp parse_args([]), do: {:error, "Please provide a filename"}
  defp parse_args([filename | _]), do: {:ok, filename}

  # Check if file exists
  defp file_exists?(filename) when is_binary(filename) do
    case File.exists?(filename) do
      true -> :ok
      false -> {:error, ["File ", filename, " does not exist"]}
    end
  end
end

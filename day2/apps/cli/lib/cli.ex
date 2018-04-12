defmodule Cli do
  @moduledoc """
  Documentation for Cli.
  """

  import Checksum

  @doc false
  def main(args) do
    args
    |> hd()
    |> Checksum.calc()
    |> IO.puts()
  end
end

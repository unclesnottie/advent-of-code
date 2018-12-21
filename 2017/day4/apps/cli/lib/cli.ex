defmodule Cli do
  @moduledoc """
  Documentation for Cli.
  """

  @doc false
  def main(args) do
    args
    |> hd()
    |> File.read!()
    |> Auth.count_valid2()
    |> IO.puts()
  end
end

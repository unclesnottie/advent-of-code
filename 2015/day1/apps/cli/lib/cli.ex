defmodule Cli do
  @moduledoc """
  Documentation for Cli.
  """

  @doc false
  def main(args) do
    args
    |> hd()
    |> File.read!()
    |> Parens.get_basement()
    |> IO.puts()
  end
end

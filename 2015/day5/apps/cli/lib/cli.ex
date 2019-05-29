defmodule Cli do
  @moduledoc """
  Documentation for Cli.
  """

  def main(args) do
    args
    |> hd()
    |> File.read!()
    |> Nice.count_nice()
    |> IO.puts()
  end

end

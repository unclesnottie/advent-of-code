defmodule Cli do
  @moduledoc """
  Documentation for Cli.
  """

  def main(args) do
    args
    |> hd()
    |> File.read!()
    |> Nice.count_nice2()
    |> IO.puts()
  end

end

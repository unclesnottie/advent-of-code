defmodule Cli do
  @moduledoc """
  Documentation for Cli.
  """

  def main(args) do
    args
    |> hd()
    |> File.read!()
    |> Wrap.calc_total_ribbon()
    |> IO.puts()
  end
end

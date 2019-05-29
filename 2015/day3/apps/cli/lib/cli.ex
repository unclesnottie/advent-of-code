defmodule Cli do
  @moduledoc """
  Documentation for Cli.
  """

  def main(args) do
    args
    |> hd()
    |> File.read!()
    |> Deliver.count_houses_robo()
    |> IO.puts
  end
end

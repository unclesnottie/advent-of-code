defmodule Cli do
  @moduledoc """
  Documentation for Cli.
  """

  def main(args) do
    args
    |> hd()
    |> Stuffer.find_key2()
    |> IO.puts()
  end

end

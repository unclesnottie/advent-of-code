defmodule Cli do
  @moduledoc """
  Documentation for Cli.
  """

  import Checksum

  @doc false
  def main(args) do
    args
    |> hd()
    |> File.stream!()
    |> Stream.map(fn x ->
      String.split(x)
      |> Enum.map(fn x ->
        {int, _} = Integer.parse(x)
        int
      end)
    end)
    |> Enum.reduce([], fn x, acc -> acc ++ [x] end)
    |> Checksum.calc2()
    |> IO.puts()
  end
end

defmodule Cli do
  @moduledoc """
  Documentation for Cli.
  """

  import Captcha

  @doc false
  def main(args) do
    args
    |> hd()
    |> Captcha.calc2()
    |> IO.puts()
  end
end

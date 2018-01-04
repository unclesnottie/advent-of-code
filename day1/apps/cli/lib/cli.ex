defmodule Cli do
  @moduledoc """
  Documentation for Cli.
  """

  import Captcha

  @doc false
  def main(args) do
    args
    |> hd()
    |> Captcha.calc()
    |> IO.puts()
  end

end

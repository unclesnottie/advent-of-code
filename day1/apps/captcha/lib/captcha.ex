defmodule Captcha do
  @moduledoc """
  Documentation for Captcha.
  """

  @doc false
  def calc(str) when is_binary(str) do
    numbers = str |> String.graphemes()
    [head | tail] = numbers
    shifted_numbers = tail ++ [head]

    Stream.zip(numbers, shifted_numbers)
    |> Stream.filter(fn ({x, y}) -> x == y end)
    |> Stream.map(fn ({x, _}) -> {y, _} = Integer.parse(x); y end)
    |> Enum.reduce(0, fn (x, acc) -> x + acc end)
  end

end

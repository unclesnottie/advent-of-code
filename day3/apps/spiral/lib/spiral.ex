defmodule Spiral do
  @moduledoc """
  Documentation for Spiral.
  """

  @doc false
  def calc(num) when is_integer(num) do
    do_work(num)
  end

  defp do_work(num) when num < 0, do: {:error, "Cannot be a negative number"}
  defp do_work(num) when num == 1, do: 0
  defp do_work(num) when num > 0 do
    5
  end
end

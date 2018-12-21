defmodule Spiral do
  @moduledoc """
  Documentation for Spiral.
  """

  @doc false
  def calc(num) when is_integer(num) do
    do_work(num)
  end

  def calc(num) when is_binary(num) do
    {i, _} = Integer.parse(num)
    do_work(i)
  end

  defp do_work(num) when num < 0, do: {:error, "Cannot be a negative number"}
  defp do_work(num) when num == 1, do: 0

  defp do_work(num) when num > 0 do
    move_count =
      Stream.unfold({:r, 0, 1}, fn
        {:r, max, max} -> {:u, {:u, 1, max}}
        {:u, max, max} -> {:l, {:l, 1, max + 1}}
        {:l, max, max} -> {:d, {:d, 1, max}}
        {:d, max, max} -> {:r, {:r, 1, max + 1}}
        {dir, cur, max} -> {dir, {dir, cur + 1, max}}
      end)
      |> Stream.take(num - 1)
      |> Enum.reduce(%{r: 0, u: 0, l: 0, d: 0}, fn x, acc -> %{acc | x => acc[x] + 1} end)

    abs(move_count[:r] - move_count[:l]) + abs(move_count[:u] - move_count[:d])
  end
end

defmodule Signal do
  @moduledoc """
  Documentation for `Signal`.
  """

  @doc """
  Entry funtion into Singal
  """
  def process(input) when is_binary(input) do
    part_one_impl(input)
  end

  # Implements solution to part one
  defp part_one_impl(input) when is_binary(input) do
    {:ok, input}
  end
end

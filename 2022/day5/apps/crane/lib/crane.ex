defmodule Crane do
  @moduledoc """
  Documentation for `Crane`.
  """

  @doc """
  This is the initial entry point to Crane
  """
  def process(filename) when is_binary(filename) do
    part_one_impl(filename)
  end

  # Implements the solution to part one
  defp part_one_impl(filename) when is_binary(filename) do
    {:ok, filename}
  end
end

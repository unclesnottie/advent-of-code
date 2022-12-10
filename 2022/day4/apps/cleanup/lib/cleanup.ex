defmodule Cleanup do
  @moduledoc """
  Documentation for `Cleanup`.
  """

  @doc """
  The main entry point into Cleanup
  """
  def process(filename) when is_binary(filename) do
    part_one_impl(filename)
  end

  # Implementation of part one
  defp part_one_impl(filename) when is_binary(filename) do
    {:ok, filename}
  end
end

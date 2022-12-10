defmodule CalorieCounter do
  @moduledoc """
  Documentation for `CalorieCounter`.
  """

  @doc """
  The main entry point into CalorieCounter.
  """
  def process(filename) when is_binary(filename) do
    {:ok, filename}
  end
end

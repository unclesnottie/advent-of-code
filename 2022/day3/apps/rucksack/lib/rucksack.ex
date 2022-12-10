defmodule Rucksack do
  @moduledoc """
  Documentation for `Rucksack`.
  """

  @doc """
  The main entry point into Rucksack
  """
  def process(filename) when is_binary(filename) do
    {:ok, filename}
  end
end

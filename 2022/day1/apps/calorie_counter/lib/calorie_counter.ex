defmodule CalorieCounter do
  @moduledoc """
  Documentation for `CalorieCounter`.
  """

  @doc false
  def process(filename) when is_binary(filename) do
    {:ok, filename}
  end
end

defmodule Checksum do
  @moduledoc """
  Documentation for Checksum.
  """

  @doc false
  def calc(lst) when is_list(lst) do
    Enum.reduce(lst, 0, fn l, acc ->
      Enum.max(l) - Enum.min(l) + acc
    end)
  end
end

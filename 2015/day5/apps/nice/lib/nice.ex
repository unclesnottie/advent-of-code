defmodule Nice do
  @moduledoc """
  Documentation for Nice.
  """

  def count_nice(str) do
    str
    |> String.split()
    |> Enum.count(&is_nice?/1)
  end

  def is_nice? (str) do
    vowel_count = str
                  |> String.replace(~r/[bcdfghjklmnpqrstvwxyz]/, "")
                  |> String.length()
    has_vowels? = vowel_count >= 3

    no_dups = str
              |> String.graphemes()
              |> Enum.dedup()

    has_dup? = length(no_dups) < String.length(str)
    has_no_ab? = !String.contains?(str, "ab")
    has_no_cd? = !String.contains?(str, "cd")
    has_no_pq? = !String.contains?(str, "pq")
    has_no_xy? = !String.contains?(str, "xy")

    has_vowels? && has_dup? && has_no_ab? && has_no_cd? && has_no_pq? && has_no_xy?
  end

end

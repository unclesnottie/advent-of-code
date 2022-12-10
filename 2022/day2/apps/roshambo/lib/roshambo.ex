defmodule Roshambo do
  @moduledoc """
  Documentation for `Roshambo`.
  """

  # Maps input characters to :rock, :paper and :scissors
  @input_converter %{
    "A" => :rock,
    "B" => :paper,
    "C" => :scissors,
    "X" => :rock,
    "Y" => :paper,
    "Z" => :scissors
  }

  # Maps input characters to :rock, :paper and :scissors or :win, :lose, :draw
  @input_converter2 %{
    "A" => :rock,
    "B" => :paper,
    "C" => :scissors,
    "X" => :lose,
    "Y" => :draw,
    "Z" => :win
  }

  # Maps :rock, :paper and :scissors to point value
  @shape_points %{
    rock: 1,
    paper: 2,
    scissors: 3
  }

  # Maps :win, :lose and :draw to point value
  @outcome_points %{
    win: 6,
    lose: 0,
    draw: 3
  }

  @doc """
  The main entry point into Roshambo
  """
  def process(filename) when is_binary(filename) do
    part_two_impl(filename)
  end

  # Solution for part one
  def part_one_impl(filename) when is_binary(filename) do
    total =
      File.stream!(filename)
      |> Stream.map(&input_to_round_score/1)
      |> Enum.sum()

    {:ok, total}
  end

  # Solution for part two
  def part_two_impl(filename) when is_binary(filename) do
    total =
      File.stream!(filename)
      |> Stream.map(&input_to_round_score2/1)
      |> Enum.sum()

    {:ok, total}
  end

  # Converts round input to score
  defp input_to_round_score(input) when is_binary(input) do
    list =
      input
      |> String.graphemes()

    them = list |> Enum.at(0)
    you = list |> Enum.at(2)

    calc_score(them, you)
  end

  # Converts round input to score part 2
  defp input_to_round_score2(input) when is_binary(input) do
    list =
      input
      |> String.graphemes()

    them = list |> Enum.at(0)
    outcome = list |> Enum.at(2)

    calc_score2(them, outcome)
  end

  # Calculates the score from a round of roshambo
  defp calc_score(them, you) do
    their_shape = @input_converter[them]
    your_shape = @input_converter[you]
    @shape_points[your_shape] + @outcome_points[roshambo(their_shape, your_shape)]
  end

  # Calculates the score from a round of roshambo
  defp calc_score2(them, outcome) do
    their_shape = @input_converter2[them]
    the_outcome = @input_converter2[outcome]
    @shape_points[get_shape(their_shape, the_outcome)] + @outcome_points[the_outcome]
  end

  # Gets needed shape to achieve outcome
  defp get_shape(shape, :draw), do: shape
  defp get_shape(:rock, :win), do: :paper
  defp get_shape(:rock, :lose), do: :scissors
  defp get_shape(:paper, :win), do: :scissors
  defp get_shape(:paper, :lose), do: :rock
  defp get_shape(:scissors, :win), do: :rock
  defp get_shape(:scissors, :lose), do: :paper

  # Calcluates outcome of a roshambo round
  defp roshambo(shape, shape), do: :draw
  defp roshambo(:rock, :paper), do: :win
  defp roshambo(:rock, :scissors), do: :lose
  defp roshambo(:paper, :scissors), do: :win
  defp roshambo(:paper, :rock), do: :lose
  defp roshambo(:scissors, :rock), do: :win
  defp roshambo(:scissors, :paper), do: :lose
end

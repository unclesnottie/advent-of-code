defmodule Point do
  defstruct x: 0, y: 0

  def move(%__MODULE__{x: x1, y: y1}, %__MODULE__{x: x2, y: y2}) do
    %__MODULE__{x: x1 + x2, y: y1 + y2}
  end

  def from_char("^"), do: %__MODULE__{x: 0, y: 1}
  def from_char("v"), do: %__MODULE__{x: 0, y: -1}
  def from_char(">"), do: %__MODULE__{x: 1, y: 0}
  def from_char("<"), do: %__MODULE__{x: -1, y: 0}
  def from_char("0"), do: %__MODULE__{x: 0, y: 0}
end

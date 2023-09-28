defmodule Saver.Dir do
  @moduledoc ~S"""
  Dir struct
  """

  defstruct ~w[name dirs files]a

  @type t :: %__MODULE__{
          name: binary,
          dirs: Saver.DirMap.t(),
          files: Saver.FileMap.t()
        }

  @doc """
  Create new directory
  """
  @spec new() :: t()
  def new(), do: new("")

  @spec new(binary) :: t()
  def new(name) when is_binary(name) do
    %__MODULE__{
      name: name,
      dirs: Saver.DirMap.new(),
      files: Saver.FileMap.new()
    }
  end

  @doc """
  Puts a new directory in the `dirs`.
  """
  @spec put_dir(t(), t()) :: :ok
  def put_dir(dir = %__MODULE__{}, new_dir = %__MODULE__{}) do
    dir.dirs
    |> Saver.DirMap.put(new_dir)
  end

  @doc """
  Calculates the size of this directory and all it contains.
  """
  @spec get_file_size(t()) :: non_neg_integer()
  def get_file_size(dir) do
    file_size = dir.files |> Saver.FileMap.get_file_size()

    dir_size =
      case dir.dirs |> Saver.DirMap.has_dirs?() do
        true ->
          dir.dirs |> Saver.DirMap.get_file_size()

        false ->
          0
      end

    file_size + dir_size
  end
end

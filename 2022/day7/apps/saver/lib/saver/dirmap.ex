defmodule Saver.DirMap do
  use Agent

  @type t :: pid()

  # ===== Public API ==========================================================

  @doc """
  Starts a new DirMap.
  """
  @spec new() :: pid()
  def new() do
    {:ok, pid} = start_link([])
    pid
  end

  @doc """
  Puts the `dir` in the `dir_map`.
  """
  @spec put(t(), Saver.Dir.t()) :: :ok
  def put(dir_map, dir) do
    dir_map |> Agent.update(&Map.put(&1, dir.name, dir))
  end

  @doc """
  Returns `true` if the map contains the `name` directory, otherwise `false`.
  """
  @spec has_dir?(t(), binary) :: boolean
  def has_dir?(dir_map, name) do
    dir_map |> Agent.get(&Map.get(&1, name)) != nil
  end

  @doc """
  Returns `true` if the map contains directories, otherwise `false`.
  """
  @spec has_dirs?(t()) :: boolean
  def has_dirs?(dir_map) do
    dir_map |> Agent.get(&map_size(&1)) > 0
  end

  @doc """
  Gets the file size of all directories in the `DirMap`.
  """
  @spec get_file_size(t()) :: non_neg_integer()
  def get_file_size(dir_map) do
    dir_map
    |> Agent.get(&Map.values(&1))
    |> Enum.map(&Saver.Dir.get_file_size/1)
    |> Enum.sum()
  end

  # ===== Agent Callbacks =====================================================

  @doc """
  Starts a new DirMap.
  """
  @spec start_link(GenServer.options()) :: Agent.on_start()
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end
end

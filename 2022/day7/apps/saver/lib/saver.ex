defmodule Saver do
  @moduledoc """
  Documentation for `Saver`.
  """

  @doc """
  Entry function into Saver
  """
  def process(filename) when is_binary(filename) do
    part_two_impl(filename)
  end

  # Implements solution to part one
  defp part_one_impl(filename) when is_binary(filename) do
    {dir_map, _curr_dir} =
      filename
      |> read_commands()
      |> IO.inspect(label: "Processed commands")
      |> Enum.reduce({%{}, []}, &process_command/2)
      |> IO.inspect(label: "Dir tree")

    total_size =
      dir_map
      |> Map.values()
      |> Enum.map(fn dir -> dir |> Saver.Dir.get_file_size() end)
      |> Enum.filter(fn s -> s <= 100_000 end)
      |> Enum.sum()

    # Temp success return value
    {:ok, "Total Size = #{total_size}"}
  end

  # Implements solution to part two
  defp part_two_impl(filename) when is_binary(filename) do
    {dir_map, _curr_dir} =
      filename
      |> read_commands()
      |> IO.inspect(label: "Processed commands")
      |> Enum.reduce({%{}, []}, &process_command/2)
      |> IO.inspect(label: "Dir tree")

    filesystem_size = 70_000_000

    top_dir_size =
      dir_map
      |> Map.get(["/"])
      |> Saver.Dir.get_file_size()
      |> IO.inspect(label: "Top Dir Size")

    unused_size =
      (filesystem_size - top_dir_size)
      |> IO.inspect(label: "Unused Space")

    size_to_delete =
      (30_000_000 - unused_size)
      |> IO.inspect(label: "Size to delete")

    {dir_to_delete, dir_size} =
      dir_map
      |> Map.values()
      |> Enum.map(fn dir -> {dir.name, dir |> Saver.Dir.get_file_size()} end)
      |> IO.inspect(label: "Dir Sizes")
      |> Enum.filter(fn {_, s} -> s >= size_to_delete end)
      |> Enum.min_by(fn {_, s} -> s end)

    # Temp success return value
    {:ok, "Dir To Delete = #{dir_to_delete} #{dir_size}"}
  end

  # Reads list of commands
  defp read_commands(filename) when is_binary(filename) do
    filename
    |> File.stream!()
    |> Stream.map(&String.split/1)
    |> Stream.map(&string_list_to_command/1)
    |> Stream.reject(&is_nil/1)
    |> Enum.to_list()
  end

  # Converts string list commands
  defp string_list_to_command(["$", "cd", ".."]), do: {:cd, :up}
  defp string_list_to_command(["$", "cd", dir]), do: {:cd, dir}
  defp string_list_to_command(["$", "ls"]), do: nil
  defp string_list_to_command(["dir", dir]), do: {:dir, dir}

  defp string_list_to_command([size, name]) do
    {int, _} = Integer.parse(size, 10)
    {:file, name, int}
  end

  # Processes moving up when at top directory
  defp process_command({:cd, :up}, {dir_map = %{}, path = [_]}) do
    {dir_map, path}
  end

  # Processes moving up when not at top directory
  defp process_command({:cd, :up}, {dir_map = %{}, [_parent | path]}) do
    {dir_map, path}
  end

  # Processes moving into top directory
  defp process_command({:cd, dir}, {dir_map = %{}, []}) do
    new_path = [dir]
    new_dir_map = dir_map |> Map.put(new_path, Saver.Dir.new(dir))
    {new_dir_map, new_path}
  end

  # Processes moving into a directory
  defp process_command({:cd, dir}, {dir_map = %{}, path = [_ | _]}) do
    new_path = [dir | path]

    case Map.get(dir_map, new_path) do
      nil ->
        new_dir = Saver.Dir.new(dir)

        dir_map
        |> Map.get(path)
        |> Saver.Dir.put_dir(new_dir)

        new_dir_map = dir_map |> Map.put(new_path, new_dir)
        {new_dir_map, new_path}

      _found_dir ->
        {dir_map, new_path}
    end
  end

  defp process_command({:dir, dir}, {dir_map = %{}, path = [_ | _]}) do
    dir_path = [dir | path]

    case Map.get(dir_map, dir_path) do
      nil ->
        new_dir = Saver.Dir.new(dir)

        dir_map
        |> Map.get(path)
        |> Saver.Dir.put_dir(new_dir)

        new_dir_map = dir_map |> Map.put(dir_path, new_dir)
        {new_dir_map, path}

      _found_dir ->
        {dir_map, path}
    end
  end

  defp process_command({:file, name, size}, {dir_map = %{}, path = [_ | _]}) do
    curr_dir = dir_map |> Map.get(path)
    curr_dir.files |> Saver.FileMap.put(name, size)
    {dir_map, path}
  end
end

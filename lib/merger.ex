defmodule Merger do


  #base case method
  #when n.length == 1, return last element
  def merge_sort([head | []]) do
    [head]
  end

  #main worker method
  #when n.length > 1
  def merge_sort(n_list) do
    count = length(n_list)
    |> div(2)

    {left_half, right_half} = Enum.split(n_list, count)

    left_half = merge_sort(left_half)
    right_half = merge_sort(right_half)

    merge(left_half, right_half)
  end


  #2 arrays come in
  #one comes out

  #user-entry merge, arity of 2
  def merge(left_half, right_half) do
    merge(left_half, right_half, [])
  end

  #iteration finished, both input arrays are empty
  defp merge([], [], merged_list) do
    merged_list
  end

  #right list is empty
  defp merge([head | tail], [], merged_list) do
    merged_list = merged_list ++ [head]
    merge(tail, [], merged_list)
  end

  #left list is empty
  defp merge([], [head | tail], merged_list) do
    merged_list = merged_list ++ [head]
    merge([], tail, merged_list)
  end

  #if leftie is bigger or equal, place rightie first
  defp merge(l_half = [l_head | l_tail], [r_head | r_tail], merged_list) when l_head >= r_head do
    merged_list = merged_list ++ [r_head]
    merge(l_half, r_tail, merged_list)
  end

  #if righte is bigger, place leftie first
  defp merge([l_head | l_tail], r_half = [r_head | r_tail], merged_list) do
    merged_list = merged_list ++ [l_head]
    merge(l_tail, r_half, merged_list)
  end

end

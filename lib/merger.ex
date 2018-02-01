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

  #comparable scenario
  defp merge(left_half, right_half, merged_list) do
    [left_head | left_tail] = left_half
    [right_head | right_tail] = right_half

    #if leftie is bigger or equal, place rightie first
    if left_head >= right_head do
      merged_list = merged_list ++ [right_head]
      merge(left_half, right_tail, merged_list)
    #if rightie is bigger, place leftie first
    else
      merged_list = merged_list ++ [left_head]
      merge(left_tail, right_half, merged_list)
    end

  end

end

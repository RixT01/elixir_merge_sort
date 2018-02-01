USAGE:
  -You need elixir installed.
  -Install dependencies with:
  $ mix deps.get
  
  -Compile and run the project with:
  $ iex -S mix

  -Run the algorithm by typing:
  Merger.merge_sort([4, 6, 1, 8, 2])

  PRODUCES:
  [1, 2, 4, 6, 8]

DESIGN:
  base case: if n.length == 1
  return n

  set left half
  set right half

  1. new_left_half = recurse left half
  2. new_right_half = recurse right half
  3. return merge of both halves



  merge requires 2 arrays
  produces a new array

  how it sorts:
  it first iterates over all a AND b
  then only on a
  then only on b
  returns new array
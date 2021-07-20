class Islands
  def number_of_islands(grid)
    num_of_isl = 0;
    grid.each_with_index do |row, r_index|
      row.each_with_index { |_col, c_index| num_of_isl += search_grid(grid, r_index, c_index) if grid[r_index][c_index] == 1 }
    end
    num_of_isl
  end

  def search_grid(grid, row, col)
    return 0 if row.negative? || col.negative? || row >= grid.length || col >= grid[0].length || (grid[row][col]).zero?

    grid[row][col] = 0 # to avoid dupes
    search_grid(grid, row + 1, col)
    search_grid(grid, row - 1, col)
    search_grid(grid, row, col - 1)
    search_grid(grid, row, col + 1)
    1
  end

end

grid = [[0, 0, 0, 0, 0, 0, 0], [0, 1, 1, 0, 0, 0, 0], [0, 1, 1, 0, 0, 0, 0], [0, 0, 0, 0, 1, 1, 0],
        [0, 0, 0, 0, 1, 1, 0], [0, 0, 0, 0, 0, 0, 0]]

island = Islands.new
p "The number of islands #{island.number_of_islands(grid)}"

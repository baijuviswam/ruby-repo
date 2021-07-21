# frozen_string_literal: true

# 200. Number of Islands // medium
# Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.
#
# An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
#
# Example 1:
#
# Input: grid = [
#   ["1","1","1","1","0"],
#   ["1","1","0","1","0"],
#   ["1","1","0","0","0"],
#   ["0","0","0","0","0"]
# ]
# Output: 1
#
# Example 2:
#
# Input: grid = [
#   ["1","1","0","0","0"],
#   ["1","1","0","0","0"],
#   ["0","0","1","0","0"],
#   ["0","0","0","1","1"]
# ]
# Output: 3
#
# Constraints:
#
# m == grid.length
# n == grid[i].length
# 1 <= m, n <= 300
# grid[i][j] is '0' or '1'.
#

class Islands
  def number_of_islands(grid)
    num_of_isl = 0
    grid.each_with_index do |row, r_index|
      row.each_with_index do |_col, c_index|
        num_of_isl += search_grid(grid, r_index, c_index) if grid[r_index][c_index] == 1
      end
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

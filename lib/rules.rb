def evaluate (grid,row,col)
  live_neighbors = 0
  result = "remain"
  if (grid[row][col].alive)
    # row above
    if (grid[row-1] != nil)
      if (grid[row-1][col-1].alive)
        live_neighbors +=1
      end
    end
    if (grid[row-1] != nil)
      if (grid[row-1][col].alive)
        live_neighbors +=1
      end
    end
    if (grid[row-1] != nil)
      if (grid[row-1][col+1].alive)
        live_neighbors +=1
      end
    end
    # current row
    if (grid[row] != nil)
      if (grid[row][col-1].alive)
        live_neighbors +=1
      end
    end
    if (grid[row] != nil)
      if (grid[row][col+1].alive)
        live_neighbors +=1
      end
    end
    # row below
    if (grid[row+1] != nil)
      if (grid[row+1][col-1].alive)
        live_neighbors +=1
      end
    end
    if (grid[row+1] != nil)
      if (grid[row+1][col].alive)
        live_neighbors +=1
      end
    end
    if (grid[row+1] != nil)
      if (grid[row+1][col+1].alive)
        live_neighbors +=1
      end
    end

    # kill, birth, or do nothing
    if (grid[row] != nil)
      if grid[row][col].alive
        if ( (live_neighbors < 2) || (live_neighbors > 3) )
          result = "kill"
        end
      end
    end
    if (grid[row] != nil)
      if ( (!(grid[row][col].alive)) && (live_neighbors == 3) )
        result = "birth"
      end
    end
  end
  result
end

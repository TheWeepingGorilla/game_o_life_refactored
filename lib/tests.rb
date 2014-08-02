def any_alive(grid)
  alive_count = false
  grid.each do |row|
    row.each do |cell|
      if cell.cell.alive
        alive_count = true
      end
    end
  end
  alive_count
end

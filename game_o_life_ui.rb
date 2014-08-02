require './lib/cell'
require './lib/rules'
require './lib/world'

def header
  system 'clear'
  puts "
▒█▀▀█ █▀▀█ █▀▄▀█ █▀▀ 　 █▀▀█ █▀▀ 　 ▒█░░░ ░▀░ █▀▀ █▀▀
▒█░▄▄ █▄▄█ █░▀░█ █▀▀ 　 █░░█ █▀▀ 　 ▒█░░░ ▀█▀ █▀▀ █▀▀
▒█▄▄█ ▀░░▀ ▀░░░▀ ▀▀▀ 　 ▀▀▀▀ ▀░░ 　 ▒█▄▄█ ▀▀▀ ▀░░ ▀▀▀
"
end

def main_menu
  header
  puts "\n"
  puts "N > New Game"
  puts "X > Exit"
  puts "\n"
  main_choice = gets.chomp.upcase
  if main_choice == "N"
    start_game
  elsif main_choice == "X"
    exit
  else
    system 'clear'
    puts "Invalid! Try again"
  end
end

def start_game
  @new_world = World.new
  @new_world.seed(@new_world.present_grid)
  @new_world.copy(@new_world.present_grid,@new_world.future_grid)
  play
end

def play
  i = 0
  10.times do
    i += 1
    # system 'clear'
    puts "----Frame------"
    puts i
    # display(@new_world.present_grid)
    sleep(0.1)
    @new_world.create_the_future
    # debug
    puts "-------------"
    display(@new_world.present_grid)
    puts "-------------"
    display(@new_world.future_grid)
    puts "-------------"
    @new_world.copy(@new_world.future_grid, @new_world.present_grid)
    # debug
    puts "-------------"
    display(@new_world.present_grid)
    puts "-------------"
    display(@new_world.future_grid)
  end
end

def display(grid)
  grid.each do |row|
    puts ""
    row.each do |cell|
      if cell.alive
        print "█"
      else
        print " "
      end
    end
  end
end

main_menu



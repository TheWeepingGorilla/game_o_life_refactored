require 'cell'
require 'world'
require 'rules'
require 'rspec'
require 'tests'
require 'pry'

describe 'Cell' do
  it 'Creates a cell' do
    test_cell = Cell.new
    expect(test_cell).to be_an_instance_of (Cell)
  end
  it 'Initializes the cell with life and marked attributes' do
    test_cell = Cell.new
    expect(test_cell.alive).to eq false
    expect(test_cell.marked).to eq false
  end
  it 'can make a cell live' do
    test_cell = Cell.new
    test_cell.birth
    expect(test_cell.alive).to eq true
   end
   it 'can make a living cell die' do
    test_cell = Cell.new
    test_cell.birth
    test_cell.kill
    expect(test_cell.alive).to eq false
   end
   it 'can mark a cell' do
    test_cell = Cell.new
    test_cell.mark
    expect(test_cell.marked).to eq true
   end
end

describe 'World' do
  it 'Creates a world' do
    test_world = World.new
    expect(test_world).to be_an_instance_of (World)
  end
  it 'Populates present and future world with cells' do
    test_world = World.new
    expect(test_world.present_grid[0][0].class).to eq (Cell)
    expect(test_world.future_grid[0][0].class).to eq (Cell)
  end
  it 'Seeds the chosen world with births' do
    test_world = World.new
    test_world.seed(test_world.present_grid)
    any_alive = test_world.present_grid.any? do |row|
      row.any? { |cell| cell.alive }
    end
    expect(any_alive).to eq true
  end
  it 'Creates future world by applying game rules' do
    test_world = World.new
    test_world.seed(test_world.present_grid)
    test_world.copy(test_world.present_grid,test_world.future_grid)
    test_world.create_the_future
    any_alive = test_world.future_grid.any? do |row|
      row.any? { |cell| cell.alive }
      end
    expect(any_alive).to eq true
  end
end

describe 'Rules' do
  it 'births and kills the appropriate cells' do
    test_world = World.new
    test_world.present_grid[0][0].alive = true
    test_world.present_grid[1][2].alive = true
    test_world.present_grid[2][2].alive = true
    expect(evaluate(test_world.present_grid,1,1)).to eq "birth"
    expect(evaluate(test_world.present_grid,0,1)).to eq "remain"
    expect(evaluate(test_world.present_grid,4,4)).to eq "remain"
    expect(evaluate(test_world.present_grid,2,2)).to eq "kill"
  end


end

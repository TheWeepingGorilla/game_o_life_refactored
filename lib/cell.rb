class Cell
  attr_accessor :alive, :marked

  def initialize
    @alive = false
    @marked = false
  end

  def kill
    @alive = false
  end

  def birth
    @alive = true
  end

  def mark
    @marked = true
  end

end


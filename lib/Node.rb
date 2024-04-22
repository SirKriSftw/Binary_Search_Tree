class Node
  attr_accessor :value, :left_child, :right_child

  def initialize(value)
    @value = value
    @left_child = nil
    @right_child = nil

    puts "Node init"
  end


end

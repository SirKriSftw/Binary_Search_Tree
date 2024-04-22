class Tree
  attr_accessor :root, :nodes

  def initialize(nodes)
    @nodes = nodes
    puts "Tree init"
  end

  def build_tree()
    sort_nodes = nodes.sort()
    sort_nodes
  end
end

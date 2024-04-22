class Tree
  attr_accessor :root, :nodes

  def initialize(nodes)
    @nodes = nodes
  end

  def build_tree()
    sort_nodes = nodes.uniq.sort
    recursive_build_tree(sort_nodes, 0, sort_nodes.length - 1)
  end

  def recursive_build_tree(nodes, start, finish)
    if(start > finish)
      return
    end
    mid = (start + finish)/ 2
    root = Node.new(nodes[mid])

    root.left = recursive_build_tree(nodes, start, mid-1)
    root.right = recursive_build_tree(nodes, mid+1, finish)

    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end


end

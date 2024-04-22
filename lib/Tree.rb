class Tree
  attr_accessor :root, :nodes

  def initialize(nodes)
    @nodes = nodes.uniq.sort
  end

  def build_tree(nodes = @nodes, start = 0, finish = @nodes.length - 1)
    if(start > finish)
      return
    end
    mid = (start + finish)/ 2
    root = Node.new(nodes[mid])

    root.left = build_tree(nodes, start, mid-1)
    root.right = build_tree(nodes, mid+1, finish)

    root
  end

  def insert(value, node = @root)
    if(value > node.value)
      if(node.right == nil)
        node.right = Node.new(value)
        return "#{value} inserted"
      end
      insert(value, node.right)
    elsif (value < node.value)
      if(node.left == nil)
        node.left = Node.new(value)
        return "#{value} inserted"
      end
      insert(value, node.left)
    else
    return "#{value} is already in tree"
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end


end

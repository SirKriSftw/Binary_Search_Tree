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

  def delete(value, node = @root)

    # Base case
    if(node == nil)
      return node
    end

    # First find which way to go
    if(value < node.value)
      node.left = delete(value, node.left)
      return node
    elsif(value > node.value)
      node.right = delete(value, node.right)
      return node
    end
    # Once Node is found
    # Check for case of 1 or No children
    if(node.left == nil)
      temp = node.right
      node.value = nil
      return temp
    elsif(node.right == nil)
      temp = node.left
      node.value = nil
      return temp
    end

    # Case of 2 children, find successor (left-most right subtree child)
    successorParent = node
    successor = node.right
    while(successor.left != nil) do
      successorParent = successor
      successor = successor.left
    end

    # SWAP node to be deleted with successor
    node.value = successor.value

    # Append children of the deleted parent to sucessor parent
    if(successorParent.left == successor)
        successorParent.left = successor.right
    else
      successorParent.right = successor.right
    end

    successor = nil
    return node
  end

  def find(value, node = @root)
    if (node == nil)
      print "#{value} not found. "
      return false
    end
    if(value > node.value)
      find(value, node.right)
    elsif (value < node.value)
      find(value, node.left)
    else
      return node
    end
  end

  def level_order(node = @root)
    if(node == nil)
      return nil
    end
    level_order_arr = []
    nodes_arr = [node]
    while(!nodes_arr.empty?) do
      current = nodes_arr[0]
      if(current.left != nil)
        nodes_arr.push(current.left)
      end
      if(current.right != nil)
        nodes_arr.push(current.right)
      end
      level_order_arr.push(nodes_arr.shift.value)
    end
    return level_order_arr
  end

  def height(node, count = 0)
    node = find(node.value)
    unless(node)
      return "Node is not in tree"
    end
    if(node.right != nil)
      count = count + 1 + height(node.right, count)
    elsif(node.left != nil)
      count = count + 1  + height(node.left, count)
    end
    return count
  end

  def depth(node, root = @root, count = 0)
    node = find(node.value)
    unless(node)
      return "Node is not in tree"
    end
    if(root == nil)
      return count
    end
    if(node.value > root.value)
      count = count + 1 + depth(node, root.right, count)
    elsif(node.value < root.value)
      count = count + 1 + depth(node, root.left, count)
    end
    return count
  end

  def balanced?(node = @root)
    if(node.right != nil && node.left != nil)
      height_diff = (height(node.right) - height(node.left)).abs
    elsif (node.right != nil)
      height_diff = height(node.right) + 1
    else
      height_diff = height(node.left) + 1
    end
    p height_diff
    if(height_diff == 1 || height_diff == 0)
      return true
    end
      return false
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end


end

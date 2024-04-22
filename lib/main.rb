require_relative "Tree"
require_relative "Node"


test_node = Node.new(1)
test_tree = Tree.new([4,3,2,1])
p test_tree.build_tree()

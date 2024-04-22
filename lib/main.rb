require_relative "Tree"
require_relative "Node"

nodes = Array.new(5) { rand(1..100) }
test_tree = Tree.new(nodes)
test_tree.root = test_tree.build_tree
test_tree.pretty_print
p test_tree.insert(rand(1..100))
test_tree.pretty_print

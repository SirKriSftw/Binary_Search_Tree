require_relative "Tree"
require_relative "Node"

nodes = Array.new(50) { rand(1..20) }
#nodes = [ 1, 2, 3, 4, 5]
test_tree = Tree.new(nodes)
test_tree.root = test_tree.build_tree
test_tree.pretty_print
#p test_tree.insert(rand(1..20))
#test_tree.delete(nodes[rand(0..nodes.length-1)])
#test_tree.delete(nodes.uniq.sort[(nodes.length - 1)/2])
#test_tree.delete(3)
#test_tree.pretty_print
#node_to_find = rand(0..20)
#puts "\nFinding node #{node_to_find}\n"
#test_tree.pretty_print(test_tree.find(node_to_find))
#p test_tree.level_order
#new_node = Node.new(rand(1..20))
#print "Height for #{new_node.value}: "
#puts test_tree.height(new_node)
#print "Depth for #{new_node.value}: "
#puts test_tree.depth(new_node)
test_tree.insert(rand(21..30))
test_tree.insert(rand(21..30))
test_tree.pretty_print
p test_tree.balanced?
test_tree.rebalance
test_tree.pretty_print
p test_tree.balanced?

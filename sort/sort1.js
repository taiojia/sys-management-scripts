data = [
                {"id": 4, "pid": "b", "name": "004", "info": "描述004"},
                {"id": "a", "pid": null, "name": "001", "info": "描述001"},
                {"id": 2, "pid": "a", "name": "002", "info": "描述002"},
                {"id": 6, "pid": "b", "name": "006", "info": "描述006"},
                {"id": "b", "pid": "a", "name": "003", "info": "描述003"},
                {"id": 5, "pid": 4, "name": "005", "info": "描述005"},
                {"id": 7, "pid": "a", "name": "007", "info": "描述007"}
            ]

dict = new ->
  for node in data
     @[node.id] = node
     node.children = []
  @

root = node for node in data when node.pid == null

console.log(dict)

for node in data when node.pid
  console.log "parent:", dict[node.pid]
  console.log "child:", node
  dict[node.pid].children.push node

console.log(dict, root)

traverse = (node, action = console.log, level = 0) ->
  action node, level
  for child in node.children
    traverse child, action, level+1

tab = (n) -> ('\t' for _ in [0..n]).join('')

traverse root, (node, level) -> console.log tab(level), node.id
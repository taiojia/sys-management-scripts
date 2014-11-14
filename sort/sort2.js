var data, dict, node, root, tab, traverse, _i, _j, _len, _len1;

data = [
  {
    "id": 4,
    "pid": "b",
    "name": "004",
    "info": "描述004"
  }, {
    "id": "a",
    "pid": null,
    "name": "001",
    "info": "描述001"
  }, {
    "id": 2,
    "pid": "a",
    "name": "002",
    "info": "描述002"
  }, {
    "id": 6,
    "pid": "b",
    "name": "006",
    "info": "描述006"
  }, {
    "id": "b",
    "pid": "a",
    "name": "003",
    "info": "描述003"
  }, {
    "id": 5,
    "pid": 4,
    "name": "005",
    "info": "描述005"
  }, {
    "id": 7,
    "pid": "a",
    "name": "007",
    "info": "描述007"
  }
];

dict = new function() {
  var node, _i, _len;
  for (_i = 0, _len = data.length; _i < _len; _i++) {
    node = data[_i];
    this[node.id] = node;
    node.children = [];
  }
  return this;
};

for (_i = 0, _len = data.length; _i < _len; _i++) {
  node = data[_i];
  if (node.pid === null) {
    root = node;
  }
}

console.log(dict);

for (_j = 0, _len1 = data.length; _j < _len1; _j++) {
  node = data[_j];
  if (!node.pid) {
    continue;
  }
  console.log("parent:", dict[node.pid]);
  console.log("child:", node);
  dict[node.pid].children.push(node);
}

console.log(dict, root);

traverse = function(node, action, level) {
  var child, _k, _len2, _ref, _results;
  if (action == null) {
    action = console.log;
  }
  if (level == null) {
    level = 0;
  }
  action(node, level);
  _ref = node.children;
  _results = [];
  for (_k = 0, _len2 = _ref.length; _k < _len2; _k++) {
    child = _ref[_k];
    _results.push(traverse(child, action, level + 1));
  }
  return _results;
};

tab = function(n) {
  var _;
  return ((function() {
    var _k, _results;
    _results = [];
    for (_ = _k = 0; 0 <= n ? _k <= n : _k >= n; _ = 0 <= n ? ++_k : --_k) {
      _results.push('\t');
    }
    return _results;
  })()).join('');
};

traverse(root, function(node, level) {
  return console.log(tab(level), node.id);
});
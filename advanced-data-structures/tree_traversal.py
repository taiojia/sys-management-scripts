__author__ = 'Taio'


tree = [[[['motherfucking', 'fuckit'], 'fuckedagain'], 'jiasir'], 'taio']


def tree_traversal(tree):
    if isinstance(tree, list):
        for child in tree:
            tree_traversal(child)
    else:
        print tree


tree_traversal(tree)


def splits(tree):
    if isinstance(tree, list):
        all_leaves = []
        for child in tree:
            child_leaves = splits(child)
            print child_leaves,
            all_leaves += child_leaves
        print
        return all_leaves
    else:
        return [tree]

splits(tree)


def binary_splits(tree):
    if isinstance(tree, list):
        left = binary_splits(tree[0])
        right = binary_splits(tree[1])
        print left, right
        return left + right
    else:
        return [tree]

binary_splits(tree)
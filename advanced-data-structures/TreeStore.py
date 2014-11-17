__author__ = 'Taio'


class TreeStore():
    def __init__(self, value, children=[]):
        self.value = value
        self.children = children

# A Python Class to Store Trees
tree = TreeStore('grandmother', [
    TreeStore('daughter',[
        TreeStore('granddaughter'),
        TreeStore('grandson')
    ]),
    TreeStore('son', [
        TreeStore('granddaughter'),
        TreeStore('grandson')
    ])
])


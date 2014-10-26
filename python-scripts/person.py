__author__ = 'Taio'


class Person:
    """
    Class to represent a person
    """
    # def __init__(self):
    #     self.name = ''
    #     self.age = 0
    def __init__(self, name='', age=0):
        self._name = name
        self._age = age

    def __str__(self):
        return "Person('%s', age '%s')" % (self._name, self.age)

    def __repr__(self):
        return "Person('%s', age '%s')" % (self._name, self.age)

    def display(self):
        print("Person('%s', age '%s')" % (self._name, self.age))

    def display2(self):
        """
        simple
        :return:
        """
        print(str(self))

    def display3(self):
        print self

    @property
    def age(self):
        """
        returns this person's age.
        :return:
        """
        return self._age

    @age.setter
    def age(self, age):
        if 0 < age <= 150:
            self._age = age

    @age.getter
    def _age(self):
        return self._age




# p = Person()
# p.name = 'moe'
# p.age = 26
# print p.__doc__
# p.display()
# print str(p)
# p.display2()
# print p
# p.display3()

# p = Person()
# p.name = 'Moe'
# p.age = 55
# print p

# p = Person('Moe', 55)
# print p

p = Person('Moe', 55)
p.age = 66
print p.age
p.age = 0
print p.age
print p._age
print p.age
















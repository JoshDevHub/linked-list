# Linked List

An implementation of linked lists in Ruby

## Description

A simple implementation of a [linked list](https://en.wikipedia.org/wiki/Linked_list) data structure in the Ruby language. A linked list is linear collection of data where each element points to the next element in the list. My `LinkedList` class has the following methods:
1. `#append(value)` - adds a new node containing `value` to a list
2. `#prepend(value)` - adds a new node containing `value` to the end of a list
3. `#each` - iterates through each node in a list
4. `#size` - returns of the number of elements in a list
5. `#head` - returns the node at the start of a list
6. `#tail` - returns the node at the end of a list
7. `#at(index)` - returns the node in a list at a given integer index
8. `#pop` - removes the last element from a list
9. `#contains?(value)` - returns `true` if the `value` is contained by one of the nodes in the list -- otherwise returns `false`
10. `#find(value)` - returns the integer index of the node in the list that contains `value` -- or `nil` if not found
11. `#to_s` - returns a string representation of the node objects in a list
12. `#insert_at(value, index)` - inserts a new node that contains `value` into the given index
13. `#remove_at(index)` - removes the node at the given index
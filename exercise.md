# Tree builder

## Goal

The goal is to create a nested tree out of a unordered flat list.

## Todo

Create a NestedTreeBuilder class.
The constructor takes one parameter `flat_list` (an example of a flat list is given below).
The class must implement a method named `build_tree` which will build the tree and return it (see expected output example below).
This method should not take any parameter.
This algorithm should work for any number of sub levels.

## Example

### Input - flat unordered list

```ruby
[
  "1. Shoes",
  "2.2. Jewels",
  "1.2. Boots",
  "2.2.2. Watches. Bracelets",
  "2. Accessories",
  "2.3. Gloves",
  "2.2.1. Rings",
  "2.1. Hats",
  "1.1. Heels",
]
```

Possible input level is not limited: e.g. `["1.2.3.4.5.6. Groceries", ...]` is a valid input.

### Expected Output - Ordered nested list

```ruby
[
  {
    "title": "1. Shoes", "children": [
      {"title": "1.1. Heels", "children": []},
      {"title": "1.2. Boots", "children": []}
    ]
  },
  {
    "title": "2. Accessories", "children": [
      {"title": "2.1. Hats", "children": []},
      {"title": "2.2. Jewels", "children": [
          {"title": "2.2.1. Rings", "children": []},
          {"title": "2.2.2. Watches. Bracelets", "children": []}
        ]
      },
      {"title": "2.3. Gloves", "children": []}
    ]
  }
]
```

Note:

- Numbers in input data are always properly formatted as `X.X.X.` (X being a number, i.e. : `1.2.3.` ) and followed by a space character.
- The text after number may contain dot characters as in `"2.2.2. Watches. Bracelets"`.

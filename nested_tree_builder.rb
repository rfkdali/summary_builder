class NestedTreeBuilder
  attr_reader :flat_list

  def initialize(flat_list)
    @flat_list = flat_list
  end

  def build_tree
    flat_list.map {|item| { title: item } }
  end
end

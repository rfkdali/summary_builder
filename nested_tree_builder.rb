class NestedTreeBuilder
  attr_reader :all_categories, :category_tree

  def initialize(all_categories)
    @all_categories = all_categories
    @category_tree  = []
  end

  def build_tree
    all_categories.sort.each do |item|
      current_category(item) << new_category(item)
    end
    category_tree
  end

  private

  def new_category(item)
    { title: item, children: []}
  end

  def category_level(item)
    item.scan(/\d+./).size
  end

  def parent_category(item)
    # return 1. if item is 1.1
    item.scan(/\d+./).first(category_level(item)- 1).join.concat(' ')
  end

  def root?(item)
    category_level(item) < 2
  end

  def current_category(item)
    return category_tree if root?(item)

    title = parent_category(item)[0..1].concat(' ')
    parent = category_tree.find {|t| t[:title].scan(title)[0] }
    parent = parent[:children].find {|c| c[:title].scan(/^#{parent_category(item)}/)[0]} || parent
    parent[:children]
  end
end

list = [
        "1. Shoes",
        "2.2. Jewels",
        "1.2. Boots",
        "2.2.2. Watches. Bracelets",
        "2. Accessories",
        "2.3. Gloves",
        "2.2.1. Rings",
        "2.1. Hats",
        "1.1. Heels",
        "1.2.3 Groceries"
      ]

p 'Input:'
p '------'
p list

nested_tree = NestedTreeBuilder.new(list)

p '------'
p 'Output:'
p '------'
pp nested_tree.build_tree

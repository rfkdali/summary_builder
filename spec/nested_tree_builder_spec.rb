require_relative '../nested_tree_builder'

require 'rspec'
require 'pry'

describe NestedTreeBuilder do
  context 'From ordered list without children' do
    let(:ordered_list) { ["1. Shoes","2. Accessories"] }

    let(:expected) do
      [{"title": "1. Shoes"}, {"title": "2. Accessories"}]
    end

    it 'builds tree with titles' do
      expect(described_class.new(ordered_list).build_tree).to eq(expected)
    end
  end
end

require_relative '../nested_tree_builder'

require 'rspec'
require 'pry'

describe NestedTreeBuilder do
  context 'Without sub levels' do
    let(:ordered_list) { ["1. Shoes","2. Accessories"] }
    let(:unordered_list) { ["2. Accessories", "1. Shoes"] }
    let(:expected) do
      [{"title": "1. Shoes"}, {"title": "2. Accessories"}]
    end
    context 'From ordered list' do
      it 'builds tree with titles' do
        expect(described_class.new(ordered_list).build_tree).to eq(expected)
      end
    end

    context 'From unordered list' do
      it 'builds tree with titles' do
        expect(described_class.new(unordered_list).build_tree).to eq(expected)
      end
    end
  end

  context 'With sub levels' do
  end
end

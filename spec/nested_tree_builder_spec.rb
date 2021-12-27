require_relative '../nested_tree_builder'
require 'rspec'

describe NestedTreeBuilder do
  context 'Without sub levels' do
    let(:ordered_list) { ["1. Shoes","2. Accessories"] }
    let(:unordered_list) { ["2. Accessories", "1. Shoes"] }
    let(:expected) do
      [{"title": "1. Shoes", "children": []}, {"title": "2. Accessories", "children": []}]
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
    let(:list) do
      [ "1. Shoes", "1.1. Heels", "2. Accessories", "2.1. Hats" ]
    end
    let(:expected) do
      [
        { "title": "1. Shoes",
          "children": [{"title": "1.1. Heels", "children": []}]
        },
        { "title": "2. Accessories",
          "children": [{"title": "2.1. Hats", "children": []}]
        }
      ]
    end

    it 'builds tree with titles and children' do
      expect(described_class.new(list).build_tree).to eq(expected)
    end
  end

  context 'With deep sub levels' do
    let(:list) do
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
        "1.2.3 Groceries"
      ]
    end
    let(:expected) do
      [
        {
          "title": "1. Shoes", "children": [
            {"title": "1.1. Heels", "children": []},
            {"title": "1.2. Boots", "children": [
              {"title": "1.2.3 Groceries", "children": []}
            ]}
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
    end

    it 'builds tree with titles and children' do
      expect(described_class.new(list).build_tree).to eq(expected)
    end
  end
end

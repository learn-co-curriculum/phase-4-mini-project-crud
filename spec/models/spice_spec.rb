require 'rails_helper'

RSpec.describe Spice, type: :model do
  let!(:spice) do 
    Spice.create(
      title: "Allspice Berries, Whole (Jamaican)",
      image: "https://www.spicejungle.com/pub/media/catalog/product/cache/3db4d5004662ba3673dd7a19a8603593/w/h/whole-allspice-berries.jpg",
      description: "Allspice has a curious name, doesn't it? Allspice. It's because it smells like so many other spices all smashed into one. Cinnamon, clove, cardamom.... all the best in one little berry!",
      notes: "Pungent, Sweet, Warm & Earthy",
      rating: 3.5
    )
  end

  describe '#id' do
    it 'has an id' do
      expect(spice.id).not_to eq(nil)
    end
  end

  describe '#title' do
    it 'returns the spice\'s title' do
      expect(spice.title).to eq('Allspice Berries, Whole (Jamaican)')
    end
  end
  
  describe '#image' do
    it 'returns the spice\'s image' do
      expect(spice.image).to eq('https://www.spicejungle.com/pub/media/catalog/product/cache/3db4d5004662ba3673dd7a19a8603593/w/h/whole-allspice-berries.jpg')
    end
  end

  describe '#description' do
    it 'returns the spice\'s description' do
      expect(spice.description).to eq('Allspice has a curious name, doesn\'t it? Allspice. It\'s because it smells like so many other spices all smashed into one. Cinnamon, clove, cardamom.... all the best in one little berry!')
    end
  end

  describe '#notes' do
    it 'returns the spice\'s notes' do
      expect(spice.notes).to eq('Pungent, Sweet, Warm & Earthy')
    end
  end

  describe '#rating' do
    it 'returns the spice\'s rating' do
      expect(spice.rating).to eq(3.5)
    end
  end
end

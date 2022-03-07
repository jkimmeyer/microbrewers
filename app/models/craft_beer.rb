class CraftBeer < ApplicationRecord
  has_one_attached :craft_beer_image
  belongs_to :craft_beer_type

  validates_presence_of :name, :price, :description, :craft_beer_type
  validates_uniqueness_of :name

  def hops
    return nil unless hops_data

    hops_data.map do |hop|
      Hop.new(name: hop["name"])
    end
  end

  def hops=(hops)
    self.hops_data = hops.map do |hop|
      if hop.is_a?(Hop)
        hop
      else
        Hop.new(name: hop)
      end
    end
  end

  def flavors
    return nil unless flavors_data

    flavors_data.map do |flavor|
      Flavor.new(name: flavor["name"])
    end
  end

  def flavors=(flavors)
    self.flavors_data = flavors.map do |flavor|
      if flavor.is_a?(Flavor)
        flavor
      else
        Flavor.new(name: flavor)
      end
    end
  end
end

class Hop
  attr_reader :name

  def initialize(name:)
    if Hop.all.include?(name)
      @name = name
    else
      raise StandardError, "Hop #{name} does not exist."
    end
  end

  def self.all
    ["Admiral", "Amarillo", "Apollo", "Athanum", "Bamling Cross", "Bitter Gold", "Bravo", "Brewers Gold", "Cascade", "Canadian RedVine", "Centennial", "Challenger", "Chinook", "Citra", "Cluster", "Columbus", "Comet", "Crystal", "Diamant", "Dr. Rudi", "East Kent Golding", "El Dorado", "Ella", "Equinox", "Experimental", "Falconers Flight", "Fuggle", "Galaxy", "Golding", "Hallertauer Blanc", "Hallertauer Comet", "Hallertauer Gold", "Hallertauer Herkules", "Hallertauer Hersbrucker", "Hallertauer Huell Melon", "Hallertauer Magnum", "Hallertauer Merkur", "Hallertauer Mittelfrüh", "Hallertauer Nordbrauer", "Hallertauer Perle", "Hallertauer Polaris", "Hallertauer Taurus", "Hallertauer Tradition", "Hersbrucker Spät", "Kazbek", "Mandarina Bavaria", "Monroe", "Mosaic", "Motueka", "Mt Hood", "Nelson Sauvin", "Northern Brewer", "Nugget", "Opal", "Pacific Gem", "Pacific Jade", "Palisade", "Perle", "Phoenix", "Pilgrim", "Premiant", "Progress", "Saazer", "Saphir", "Simcoe", "Sladek", "Smaragd", "Sorachi Ace", "Spalt", "Spalter", "Spalter", "Spalter Select", "Summer", "Summit", "Target", "Tettnanger", "Topaz", "Willamette", "Vic Secret", "Zeus"]
  end
end

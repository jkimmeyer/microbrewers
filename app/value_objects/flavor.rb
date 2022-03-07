class Flavor
  attr_reader :name

  def initialize(name:)
    raise StandardError, "Flavor #{name} does not exist." unless Flavor.all.include?(name)
    @name = name
  end

  def self.all
    %w[
      Ananas
      Aprikose
      Blaubeere
      Brombeere
      Cassis
      Eisbonbon
      Erdbeere
      Grapefruit
      grüne_Paprika
      grüner_Tee
      Himbeere
      Holz
      Honig
      Honigmelone
      Ingwer
      Johannisbeere
      Kiefer
      Kokos
      Koriander
      Lakritz
      Litschi
      Magnolia
      Mandarine
      Maracuja
      Minze
      Orange
      Passionsfrucht
      Pinie
      Pflaume
      schwarze_Johannisbeere
      Stachelbeere
      Tropische_Früchte
      Wassermelone
      Zeder
      Zitrone
      Zitrus
    ].concat(
      %w[
        blumig
        fruchtig
        fruchtig-blumig
        erdig
        grasig
        harzig
        kräuterig
        würzig
        würzig-fruchtig
      ],
    )
  end
end

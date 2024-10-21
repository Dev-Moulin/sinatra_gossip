require 'pry'

class Gossip
  attr_accessor :author, :content

  # def initialize(author, content, gossip_id)
  def initialize(author, content)
    @author = author
    @content = content
    # @gossip_id = gossip_id
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    # @@all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
      # @@all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
    # return @@all_gossips
  end
  # def self.find(gossip_id)
  #  lien = @@all_gossips[@gossip_id]
  #  return lien
  # end
  
  def self.find(gossip_id)
    all_gossips = self.all  # Récupère tous les gossips
    return all_gossips[gossip_id.to_i]  # Retourne le gossip correspondant à l'ID
  end
  
end


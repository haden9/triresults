class Entrant
  include Mongoid::Document
  include Mongoid::Timestamps
  store_in collection: 'results'
  field :bib, type: Integer
  field :secs, type: Float
  field :o, type: Placing, as: :overall
  field :gender, type: Placing
  field :group, type: Placing

  attr_accessor :the_race

  embeds_many :results, class_name: 'LegResult', after_add: :update_total
  embeds_one :race, class_name: 'RaceRef'
  embeds_one :racer, as: :parent, class_name: 'RacerInfo'

  def update_total(result)
    self.secs = results.sum(:secs) if result
  end

  def the_race
    self.race.race
  end
end

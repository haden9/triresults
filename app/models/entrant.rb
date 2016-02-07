class Entrant
  include Mongoid::Document
  include Mongoid::Timestamps
  store_in collection: 'results'
  field :bib, type: Integer
  field :secs, type: Float
  field :o, type: Placing, as: :overall
  field :gender, type: Placing
  field :group, type: Placing

  delegate :first_name, :first_name=, to: :racer
  delegate :last_name, :last_name=, to: :racer
  delegate :gender, :gender=, to: :racer, prefix: 'racer'
  delegate :birth_year, :birth_year=, to: :racer
  delegate :city, :city=, to: :racer
  delegate :state, :state=, to: :racer
  delegate :name, :name=, to: :race, prefix: 'race'
  delegate :date, :date=, to: :race, prefix: 'race'

  attr_accessor :the_race

  embeds_many :results, class_name: 'LegResult', after_add: :update_total
  embeds_one :race, class_name: 'RaceRef', autobuild: true
  embeds_one :racer, as: :parent, class_name: 'RacerInfo', autobuild: true

  def overall_place
    overall.place if overall
  end

  def gender_place
    gender.place if gender
  end

  def group_name
    group.name if group
  end

  def group_place
    group.place if group
  end

  def update_total(result)
    self.secs = results.sum(:secs) if result
  end

  def the_race
    self.race.race
  end
end

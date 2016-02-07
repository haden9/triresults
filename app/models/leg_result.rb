class LegResult
  include Mongoid::Document
  field :secs, type: Float
  field :event, type: Event

  embeds_one 'event', as: :parent
  embedded_in 'entrant'

  validates :event, presence: true

  def calc_ave
  end

  after_initialize do |doc|
  end

  def secs=(value)
    self[:secs] = value
  end
end

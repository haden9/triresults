class LegResult
  include Mongoid::Document
  field :secs, type: Float

  embedded_in 'entrant'

  def calc_ave
  end

  after_initialize do |doc|
  end

  def secs=(value)
    self[:secs] = value
  end
end

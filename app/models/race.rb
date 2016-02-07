class Race
  include Mongoid::Document
  include Mongoid::Timestamps

  field :n, type: String, as: :name
  field :date, type: Date
  field :loc, type: Address, as: :location
  field :events, type: Event

  embeds_many :events, as: :parent, order: [:order.asc]
end

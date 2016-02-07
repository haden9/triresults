class Event
  include Mongoid::Document
  field :order, type: Integer
  field :name, type: String
  field :distance, type: Float
  field :units, type: String
end

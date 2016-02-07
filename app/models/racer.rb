class Racer
  include Mongoid::Document

  embeds_one :racer_info, as: :info, class_name: 'RacerInfo'
end

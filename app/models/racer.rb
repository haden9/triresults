class Racer
  include Mongoid::Document
  field :info, type: RacerInfo

  embeds_one :info, class_name: 'RacerInfo', autobuild: true

  before_create do |racer|
    racer.info.id = racer.id
  end
end

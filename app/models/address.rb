class Address
  attr_accessor :city, :state, :location

  def initialize(city=nil,state=nil,location=nil)
    @city = city
    @state = state
    if location && location.present?
      @location =  Point.new(location[:latitude], location[:longitude])
    else
      @location = location
    end
  end

  def mongoize
    {city: @city, state: @state, loc: @location}
  end

  def self.mongoize(object)
   case object
   when self.class then
     object.mongoize
   when nil then
     nil
   else
     object
   end
  end

  def self.demongoize(object)
    case object
    when Hash then
      Address.new(city, state, location)
    when nil then
      nil
    else
      object
    end
  end

  def self.evolve(object)
    mongoize(object)
  end
end

class BikeResult < LegResult
  field :mph, type: Float

  def calc_ave
    if event && secs
      meters = event.meters
      my_ave = meters.nil? ? nil : 12.1
    end
  end
end

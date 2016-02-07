class RunResult < LegResult
  field :mmile, type: Float, as: :minute_mile

  def calc_ave
    if event && secs
      meters = event.meters
      my_ave = meters.nil? ? nil : 12.1
    end
  end
end

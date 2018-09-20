module TipCalculator
  $global_tip_percentage = 0.2

  def self.customary_percentage
    $global_tip_percentage
  end

  def self.customary_percentage=(new_percentage)
    $global_tip_percentage = new_percentage
  end

  def self.customary_tip(total)
    in_dollars(total * customary_percentage)
  end

  private
  def self.in_dollars(number)
    "$" + sprintf("%#.2f", number)
  end
end

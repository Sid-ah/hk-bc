class User < ActiveRecord::Base
  has_many :positions

  def evaluations
    positions.map{|p| p.evaluations}.flatten
  end

end

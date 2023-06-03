class BakedGood < ActiveRecord::Base
  # add association macro here
  belongs_to :bakeries
  def bakery
    Bakery.find(self[:bakery_id])
  end
end

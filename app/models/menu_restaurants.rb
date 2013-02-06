class MenuRestaurant < ActiveRecord::Base
  attr_accessible :date
  belongs_to :menu
  belongs_to :restaurant
end

class Restaurant_menu < ActiveRecord::Base
  attr_accessible :datum
  belongs_to :menu
  belongs_to :restaurant
end

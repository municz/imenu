class Menu < ActiveRecord::Base
  attr_accessible :cenaStudent, :name, :restaurant_id
  has_many :restaurants, :through => :restaurant_id
end

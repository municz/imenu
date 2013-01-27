class Restaurant < ActiveRecord::Base
  attr_accessible :menu_id, :name
  has_many :menus, :through => :menu_id
end

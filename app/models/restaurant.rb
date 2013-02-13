# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  menu_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ActiveRecord::Base
  attr_accessible :name
  has_many :menu_restaurants
  has_many :menus, :through => :menu_restaurants, dependent: :destroy

  validates :name, presence: true 
  validates_uniqueness_of :name
end

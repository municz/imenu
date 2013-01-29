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
  has_and_belongs_to_many :menus
end

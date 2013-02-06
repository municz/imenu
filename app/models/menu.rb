# == Schema Information
#
# Table name: menus
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  cenaStudent :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Menu < ActiveRecord::Base
  attr_accessible :cenaStudent, :name
  has_many :menu_restaurants
  has_many :restaurants, :through => :menu_restaurans, dependent: :destroy
  
  validates :cenaStudent, presence: true
  validates_numericality_of :cenaStudent, :message => "Error: Price is not a number"
  validates :name, presence:true

end

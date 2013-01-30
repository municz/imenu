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
  has_many :restaurants, dependent: :destroy
  
  validates :cenaStudent, presence: true
  validates :name, presence:true

  def getAcademicMenus
    restaurant = Restaurant.create("Academic Restaurant")
  end


end

class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
      t.string :name

      t.timestamps
    end
    
    #populate db
    Restaurant.create :name => "ACADEMIC restaurant"
  end
  
  def self.down
    drop_table :restaurants
  end
end

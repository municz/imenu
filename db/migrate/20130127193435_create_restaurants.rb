class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
      t.string :name

      t.timestamps
    end
    
    add_index :restaurants, :name, :unique => true
    
    #populate db
    Restaurant.create :name => "ACADEMIC restaurant"
  end
  
  def self.down
    remove_index :restaurants, :column => :name
    drop_table :restaurants
  end
end

class CreateMenusRestaurants < ActiveRecord::Migration
  def up
    #create the association table
    create_table :menu_restaurants, :id => false do |t|
      t.integer :menu_id, :null => false
      t.integer :restaurant_id, :null => false
      t.date :date
    end

    #add index
    add_index :menu_restaurants, [ :menu_id, :restaurant_id]
    add_index :menu_restaurants, [ :menu_id, :restaurant_id, :date], :unique => true

  end

  def down
    remove_index :menu_restaurants, [ :menu_id, :restaurant_id, :date]
    remove_index :menu_restaurants, :column => [ :menu_id, :restaurant_id]
    drop_table :menu_restaurants 
  end
end

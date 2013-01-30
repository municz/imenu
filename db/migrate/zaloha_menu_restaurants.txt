class CreateMenusRestaurants < ActiveRecord::Migration
  def up
    #create the association table
    create_table :menus_restaurants, :id => false do |t|
      t.integer :menu_id, :null => false
      t.integer :restaurant_id, :null => false
      t.date :date
    end

    #add index
    add_index :menus_restaurants, [ :menu_id, :restaurant_id]

  end

  def down
    remove_index :menus_restaurants, :column => [ :menu_id, :restaurant_id]
    drop_table :menus_restaurants 
  end
end

class RestaurantMenu < ActiveRecord::Migration
  def self.up
    create_table :restaurants_menus, :id => false do |t|
      t.references :menu, :null => false
      t.references :restaurant, :null => false
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :restaurants_menus
  end
end

#add index to speed up
add_index( :restaurants_menus, [ :restaurant_id, :menu_id])

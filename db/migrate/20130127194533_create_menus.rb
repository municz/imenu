class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.string :name
      t.integer :cenaStudent

      t.timestamps
    end

    add_index :menus, :name, :unique => true
  end

  def self.down
    remove_index :menus, :column => :name
    drop_table :menus
  end
end

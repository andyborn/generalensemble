class AddCustomColourToUsers < ActiveRecord::Migration
  def change
    add_column :users, :main_body_colour, :string
    add_column :users, :background_colour, :string
  end
end

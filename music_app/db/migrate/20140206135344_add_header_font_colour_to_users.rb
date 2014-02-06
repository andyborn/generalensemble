class AddHeaderFontColourToUsers < ActiveRecord::Migration
  def change
    add_column :users, :header_font_colour, :string
  end
end

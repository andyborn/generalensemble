class AddBannerImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :banner_image, :string
  end
end

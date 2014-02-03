class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :artist_name
      t.string :artist_image
      t.string :bio
      t.string :website
      t.string :role

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :image_path
      t.string :token
      t.string :uid
      t.string :refresh_token
      t.string :token_expiration

      t.timestamps
    end
  end
end

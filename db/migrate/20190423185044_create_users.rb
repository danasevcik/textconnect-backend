class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :bio
      t.string :phone_number
      t.string :language
      t.string :photo
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.string :phone
      t.integer :source_id
      t.string :google_token

      t.timestamps
    end
  end
end

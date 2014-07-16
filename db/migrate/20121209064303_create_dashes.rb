class CreateDashes < ActiveRecord::Migration
  def change
    create_table :dashes do |t|
      t.string :name
      t.integer :dash_type_id
      t.string :widgets

      t.timestamps
    end
  end
end

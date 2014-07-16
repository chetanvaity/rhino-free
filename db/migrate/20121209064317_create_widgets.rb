class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :name
      t.integer :widget_type_id
      t.string :sources

      t.timestamps
    end
  end
end

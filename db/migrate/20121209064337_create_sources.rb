class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.integer :source_type_id
      t.string :properties

      t.timestamps
    end
  end
end

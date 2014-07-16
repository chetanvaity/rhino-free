class CreateDashTypes < ActiveRecord::Migration
  def change
    create_table :dash_types do |t|
      t.string :name
      t.string :properties

      t.timestamps
    end
  end
end

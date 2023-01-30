class CreateNations < ActiveRecord::Migration[5.2]
  def change
    create_table :nations do |t|
      t.boolean :landlocked
      t.integer :population
      t.string :name
      t.string :national_language
      
      t.timestamps
    end
  end
end

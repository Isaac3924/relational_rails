class CreateAncestries < ActiveRecord::Migration[5.2]
  def change
    create_table :ancestries do |t|
      t.references :nation, foreign_key: true
      t.boolean :darkvision
      t.integer :population
      t.string :name
      t.string :patron_deity
      t.timestamps
    end
  end
end

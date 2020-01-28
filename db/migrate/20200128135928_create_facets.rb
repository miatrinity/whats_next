class CreateFacets < ActiveRecord::Migration[6.0]
  def change
    create_table :facets do |t|
      t.string :name
      t.references :identity, null: false, foreign_key: true

      t.timestamps
    end
  end
end

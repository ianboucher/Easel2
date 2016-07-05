class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string     :title
      t.text       :category, array: true, default: []
      t.text       :description
      t.integer    :price
      t.integer    :discount
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

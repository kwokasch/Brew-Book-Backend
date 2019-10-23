class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :api_id
      t.string :name
      t.string :variety
      t.integer :rating
      t.text :comments

      t.timestamps
    end
  end
end

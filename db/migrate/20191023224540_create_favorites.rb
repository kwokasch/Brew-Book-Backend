class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.belongs_to :user
      t.belongs_to :beer

      t.timestamps
    end
  end
end

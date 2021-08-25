class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|

      t.string :movie_title, null: false
      t.text :thought,       null: false
      t.integer :genre_id,   null: false
      t.integer :evaluation, null: false
      t.references :user,    null: false, foreign_key: true

      t.timestamps
    end
  end
end

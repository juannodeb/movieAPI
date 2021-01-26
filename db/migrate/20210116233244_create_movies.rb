class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :year
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end

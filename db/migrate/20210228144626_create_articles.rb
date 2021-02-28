class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :gender
      t.string :size
      t.integer :price_per_month
      t.text :details

      t.timestamps
    end
  end
end

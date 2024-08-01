class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :introduction
      t.string :category
      

      t.timestamps
    end
  end
end

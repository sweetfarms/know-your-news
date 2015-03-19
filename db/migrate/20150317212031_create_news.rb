class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.integer :user_id
      t.string :title
      t.text :abstract
      t.string :article_url


      t.timestamps null: false
    end
  end
end

class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :index
      t.string :show
      t.string :update
      t.string :destroy

      t.timestamps null: false
    end
  end
end

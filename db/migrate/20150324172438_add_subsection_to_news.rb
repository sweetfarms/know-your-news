class AddSubsectionToNews < ActiveRecord::Migration
  def change
    add_column :news, :subsection, :string
  end
end

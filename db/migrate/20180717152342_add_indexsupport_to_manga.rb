class AddIndexsupportToManga < ActiveRecord::Migration[5.2]
  def change
          add_column :mangas, :support_id, :integer
          add_index :mangas, :support_id
  end
end

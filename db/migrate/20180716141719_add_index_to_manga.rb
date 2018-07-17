class AddIndexToManga < ActiveRecord::Migration[5.2]
  def change
          add_column :mangas, :genre_id, :integer
          add_index :mangas, :genre_id, :integer
  end
end

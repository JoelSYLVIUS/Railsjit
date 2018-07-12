class AddImageToMangas < ActiveRecord::Migration[5.2]
  def change
    add_column :mangas, :image, :string
  end
end

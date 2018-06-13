class CreateMangas < ActiveRecord::Migration[5.2]
  def change
    create_table :mangas do |t|

            t.string :title, :description, :thumbnail
            t.datetime :date_sortie
            t.integer :iteration
      t.timestamps
    end
  end
end

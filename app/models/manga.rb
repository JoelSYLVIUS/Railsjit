class Manga < ApplicationRecord
        resourcify
        mount_uploader :image, ImageUploader
        belongs_to :genre
        belongs_to :support

end

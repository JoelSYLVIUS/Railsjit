class Manga < ApplicationRecord
        resourcify
        mount_uploader :image, ImageUploader
        belongs_to :genre, optional: true
        belongs_to :support, optional: true

end

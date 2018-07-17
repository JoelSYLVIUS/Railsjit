class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
   def default_url
     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzedos_k3Pd8UgUr-DBIe_KWhUZY4hClu45Rgmggkks4F2HFZ1"
   end

   #Process files as they are uploaded:
   process scale: [300, 200]

   def scale(width, height)
           resize_to_fill width, height
     # do something
   end

  # Create different versions of your uploaded files:
   version :thumb do
     process resize_to_fit: [100, 100]
   end
   version :large do
     process resize_to_fit: [400, 400]
   end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_whitelist
     %w(jpg jpeg png)
   end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
   def filename
     "#{mounted_as}.jpg" if original_filename
   end
end

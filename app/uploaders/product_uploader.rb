class ProductUploader < CarrierWave::Uploader::Base

  # Choose what kind of storage to use for this uploader:
  # storage :aws
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # version :thumb do
  #   process resize_to_fill: [300,300]
  # end

end

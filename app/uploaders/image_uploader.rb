# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

 include CarrierWave::RMagick
 storage :file
 def extension_white_list
   %w(jpg jpeg gif png)
 end

 # Override the directory where uploaded files will be stored
 # This is a sensible default for uploaders that are meant to be mounted:
 def store_dir
   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
 end

 version :icon do
   process :resize_to_fit => [48, 48]
 end

 version :thumb do
   process :resize_to_fit => [128, 128]
 end

 version :medium do
   process :resize_to_fit => [256, 256]
 end
end
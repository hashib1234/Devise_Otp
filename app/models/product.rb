class Product < ApplicationRecord
   belongs_to :type

	mount_uploader  :thumb_image, ProductUploader
    mount_uploader  :main_image, ProductUploader

    validates_presence_of :image_title, :image_desc, :main_image, :thumb_image
end

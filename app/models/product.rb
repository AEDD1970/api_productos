class Product < ApplicationRecord
    
     belongs_to :type_product
  
    mount_base64_uploader  :image, ImageUploader
    validates :producname, presence:true
    validates :producname, uniqueness:true
   

    validates_processing_of :image
    validate :image_size_validation
     
    private
      def image_size_validation
        errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
      end



end
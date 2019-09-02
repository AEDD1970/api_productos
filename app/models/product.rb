class Product < ApplicationRecord
    
     belongs_to :type_product
  
    validates :image, presence: true
    validates :producname, presence:true
    validates :producname, uniqueness:true
    
   
    validate :image_size_validation
     
    private
      def image_size_validation
        errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
      end



end
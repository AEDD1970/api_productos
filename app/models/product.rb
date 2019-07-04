class Product < ApplicationRecord
    validates :producname, presence:true
    validates :producname, uniquenes: true, { 
    message: "There is already a product with that name" }
    validates :price, format: { with: /\A[+-]?\d+\z/, message: "Integer only. No sign allowed." }
end

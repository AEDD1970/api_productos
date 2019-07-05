class Product < ApplicationRecord
    validates :producname, presence:true
    validates :producname, presence: true
    validates :price, format: { with: /\A[+-]?\d+\z/, message: "Integer only. No sign allowed." }
end

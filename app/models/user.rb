class User < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :firstname, :lastname,presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 }
    validates :email, uniqueness: true
    has_secure_password
    validates :password, length: { minimum: 6 }
    validates :birthday, :gender, presence: true
    has_many :posts    
    has_many :favorites, dependent: :destroy
    has_many :favorite_posts, through: :favorites, source: :post
end

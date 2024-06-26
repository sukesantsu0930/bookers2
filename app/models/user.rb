class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys =>[:name]
         
         validates :name, presence: true, uniqueness: true ,length: { in: 2..20 }
         validates :email, presence: true, uniqueness: true, length: { maximum: 50 }
         validates :introduction, length: { maximum: 50 }
         
         has_many :books, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :favorited_books, through: :favorites, source: :book
         has_many :book_comments
         
         has_one_attached :profile_image
         
#         def get_profile_image
#     unless profile_image.attached?
#       file_path = Rails.root.join('app/assets/images/no_image.jpg')
#       profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
#     end
#     profile_image.variant(resize_to_limit: [100, 100]).processed
#   end
         
#          def email_required?
#           false
#          end
         
#          def email_changed?
#           false
#         end
        
        
        def get_profile_image(width, height)
            unless profile_image.attached?
              file_path = Rails.root.join('app/assets/images/no_image.jpg')
              profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
            end
            profile_image.variant(resize_to_limit: [width, height]).processed
          end
end

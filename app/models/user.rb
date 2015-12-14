class User < ActiveRecord::Base
  has_secure_password
  has_many :sweet
  has_attached_file :image, :default_url => "http://www.recipeshubs.com/thumbs/2362836-black-sesame-ice-cream.jpg"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  validates :user_name, presence: true,
                        uniqueness: true,
                        length: {
                          minimum: 6,
                          maximum: 12
                        }
  validates :password, presence: true,
                        length: {
                          minimum: 6,
                          maximum: 10
                        }
  validates :password_confirmation, presence: true

end

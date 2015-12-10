class User < ActiveRecord::Base
  has_secure_password
  has_many :sweets
  has_attached_file :image

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
  validates_attachment :image, presence: true,
                                default_url: "http://www.endlessicons.com/wp-content/uploads/2012/09/cupcake-icon-614x460.png"
                                size: { in: 0..10.kilobytes },
                                content_type: {
                                  content_type: "image/jpeg",
                                                "image/jpeg",
                                                "image/png"
                                }

end

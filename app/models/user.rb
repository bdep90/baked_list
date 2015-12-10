class User < ActiveRecord::Base
  has_secure_password
  has_many :sweets
  has_attached_file :image, :styles => { medium: "300x300>", thumb: "100x100>" },
                            :default_url => "http://www.endlessicons.com/wp-content/uploads/2012/09/cupcake-icon-614x460.png",
                            :content_type => ["image/jpg", "image/jpeg", "image/png"]

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

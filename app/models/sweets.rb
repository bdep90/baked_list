class Sweets < ActiveRecord
  belongs_to :user
  has_attached_file :image, :styles => { medium: "300x300>", thumb: "100x100>" },
                            :default_url =>
  "http://15456d13098a54773ea9-bcf1ad37ada5be7227d2e6a4c20928bc.r8.cf2.rackcdn.com/i/pies/profile/cheesecake_main1.jpg",
                            :content_type => ["image/jpg", "image/jpeg", "image/png"]

  validates :name, :bakery_name, :bakery_location, :description, :rating, presence: true
  validates :description, length: {
                            minimum: 10;
                            maximum: 300;
                          }
  validates_numericality_of :rating, less_than_or_equal_to: 5

end

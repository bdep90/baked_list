class Sweet < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :default_url => "cheesecake.jpg"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  validates :name, presence: true
  validates :description, length: {
                            minimum: 10,
                            maximum: 300
                          }
  validates_numericality_of :rating, less_than_or_equal_to: 5

end

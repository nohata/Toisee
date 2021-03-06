class Information < ApplicationRecord

  belongs_to :user

  validates :title, presence: true, length: { maximum: 256 }
  validates :comment, presence: true

end

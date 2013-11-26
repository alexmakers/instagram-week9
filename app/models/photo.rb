class Photo < ActiveRecord::Base
  has_attached_file :image,
                    styles: { medium: "400x400>", thumb: "200x200>" }

  belongs_to :user
  validates :title, length: 3..255
  validates :image, attachment_presence: { message: 'need a photo' }
end

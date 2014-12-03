class Picture < ActiveRecord::Base
  belongs_to :album
  has_attached_file :photo
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end

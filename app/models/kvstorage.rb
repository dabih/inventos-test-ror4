class Kvstorage < ActiveRecord::Base

  #attr_accessible :key, :value, :hits

  include ActiveModel::ForbiddenAttributesProtection

  validates :key, presence: true, uniqueness: true, length: { maximum: 100 }
  validates_format_of :key, :with => /\A\w/
  validates :value, length: { maximum: 100 }
  

end

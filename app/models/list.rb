class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true,  reject_if: proc { |att| att['desc'].blank? }
  
  acts_as_taggable
end

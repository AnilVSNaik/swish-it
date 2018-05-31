class Task < ApplicationRecord
  belongs_to :user
  belongs_to :list

  mount_uploaders :attaches, AttachUploader

  enum priority: [:low, :medium, :high, :urgent]

  validates :desc, :presence=> true
end

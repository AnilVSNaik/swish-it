class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :list, optional: true

  mount_uploaders :attaches, AttachUploader

  enum priority: [:low, :medium, :high, :urgent]

end

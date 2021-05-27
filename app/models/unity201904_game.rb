class Unity201904Game < ApplicationRecord
  mount_uploader :loader_file, Unity201904Uploader
  mount_uploader :data_file, Unity201904Uploader
  mount_uploader :code_file, Unity201904Uploader
  mount_uploader :framework_file, Unity201904Uploader
  mount_uploader :json_file, Unity201904Uploader

  validates :width, numericality: {only_integer: true}
  validates :height, numericality: {only_integer: true}

  belongs_to :game
end

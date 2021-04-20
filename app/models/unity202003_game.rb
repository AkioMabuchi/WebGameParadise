class Unity202003Game < ApplicationRecord
  mount_uploader :loader_file, Unity202003Uploader
  mount_uploader :data_file, Unity202003Uploader
  mount_uploader :framework_file, Unity202003Uploader
  mount_uploader :wasm_file, Unity202003Uploader

  belongs_to :game
end

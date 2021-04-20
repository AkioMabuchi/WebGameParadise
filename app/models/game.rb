class Game < ApplicationRecord
  include FriendlyId

  friendly_id :permalink

  enum engine_code: [:no_content, :unity_2019_4_x, :unity_2020_3_x]

  validates :user_id, presence: true
  validates :permalink, presence: true, uniqueness: {case_sensitive: true}, length: {maximum: 32}, format: {with: /\A[0-9a-zA-Z\\-]*\z/}
  validates :default_language_id, presence: true

  has_one :unity201904_game, dependent: :destroy
  has_one :unity202003_game, dependent: :destroy

  accepts_nested_attributes_for :unity201904_game, allow_destroy: true
  accepts_nested_attributes_for :unity202003_game, allow_destroy: true
end

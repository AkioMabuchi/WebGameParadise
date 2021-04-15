class Language < ApplicationRecord
  validates :permalink, presence: true, uniqueness: {case_sensitive: true}
  validates :name, presence: true, uniqueness: {case_sensitive: true}
end

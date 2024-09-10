class PrefectureCode < ApplicationRecord
  enum ew_flag: { 'East': 'E', 'West': 'W' }
  validates :name, :code, :ew_flag, presence: true
end

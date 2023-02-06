class Ancestry < ApplicationRecord
  belongs_to :nation

  scope :sort_alphabetically, -> { order(name: :asc) }
end

class Nation < ApplicationRecord
  has_many :ancestries, dependent: :destroy
end

class Business < ApplicationRecord
  has_many:places, dependent: :destroy
end

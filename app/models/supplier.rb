class Supplier < ApplicationRecord
   has_one :account
   has_many :parts, dependent: :destroy
end

class Supplier < ApplicationRecord
   has_one :account
   has_many :parts, dependent: :destroy

   validates :name, presence: true
   validates :cnpj, presence: true, uniqueness: true
end

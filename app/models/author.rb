class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: false
  
end

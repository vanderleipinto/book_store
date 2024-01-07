class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :assemblies

  validates :title, presence: true
  
end

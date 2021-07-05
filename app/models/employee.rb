class Employee < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true

  has_one :employment, dependent: :destroy
  has_one :type, through: :employment
end

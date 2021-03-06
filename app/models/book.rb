# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :books_users, dependent: :destroy
  has_many :users, through: :books_users

  validates :name, presence: true, uniqueness: true
  delegate :to_s, to: :name
end

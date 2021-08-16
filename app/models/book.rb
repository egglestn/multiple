# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :users_books, dependent: :destroy
  has_many :users, through: :users_books

  validates :name, presence: true, uniqueness: true
  delegate :to_s, to: :name
end

# frozen_string_literal: true

class User < ApplicationRecord
  has_many :books_users, dependent: :destroy
  has_many :books, through: :books_users
  accepts_nested_attributes_for :books_users

  validates :name, presence: true, uniqueness: true
  delegate :to_s, to: :name
end

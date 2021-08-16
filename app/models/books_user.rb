# frozen_string_literal: true

class BooksUser < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book_id, uniqueness: { scope: :user_id }
  validates_presence_of(:score)

  enum score: %i[
    hate
    dislike
    neutral
    like
    love
  ]
end

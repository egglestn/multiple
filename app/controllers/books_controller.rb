# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @user = User.all.last
  end
end

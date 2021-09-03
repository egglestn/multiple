# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :load_user

  def edit
    @books = Book.all.order(:name)
    # Destroy previous scores and start again
    # Useful for demo / prototype, but suggest you don't do this in a production system!
    @user.books_users.delete_all

    form
  end

  def update
    book_params[:books_user].each do |param|
      next unless param.last[:score]&.present?

      BooksUser.create(user_id: @user.id, score: param.last[:score].to_i, book_id: param.first.to_i)
    end

    redirect_to user_path(@user)
  end

  def show
    @books = Book.all.order(:name)
  end

  private

  def form
    case params[:form]
    when 'a'
      render template: "users/edit_a"
    when 'b'
      render template: "users/edit_b"
    else
      render action: :edit
    end
  end

  def load_user
    @user = User.find(params[:id])
  end

  def book_params
    params.require(:user).permit(books_user: :score)
  end
end

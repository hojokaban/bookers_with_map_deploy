class FavoritesController < ApplicationController
	before_action :set_book

	def create
		#binding.pry
		Favorite.new(book_id: @book.id,
			         user_id: current_user.id).save unless @book.favorited_by?(current_user)
		binding.pry
		respond_to do |format|
			format.html {redirect_back(fallback_location: books_path)}
			format.js
		end
	end

	def destroy
		#binding.pry
		Favorite.find_by(user_id: current_user.id, book_id: @book.id).destroy if @book.favorited_by?(current_user)
		respond_to do |format|
			format.html {redirect_back(fallback_location: books_path)}
			format.js
		end
	end

	private

	  def set_book
	  	@book = Book.find(params[:id])
	  end

end

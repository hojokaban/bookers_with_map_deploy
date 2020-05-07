class BookCommentsController < ApplicationController
=begin
	def create
		@comment = current_user.book_comments.new(comment_params)
		@comments = BookComment.all
		@book = Book.find(@comment.book_id)
		if @comment.save
			flash[:notice] = "successfully upload comment!"
			respond_to do |format|
				format.html {redirect_to @book}
				format.js
			end
		else
			@book_new = Book.new
			@user = @book.user
			respond_to do |format|
				format.html {render "books/show" and return}
				format.js
			end
		end
=end

	def create
		@comment = current_user.book_comments.new(comment_params)
		@comments = BookComment.all
		@book = Book.find(@comment.book_id)
			if @comment.save
				flash[:notice] = "successfully upload comment!"
				#redirect_to @book
			else
				@book_new = Book.new
				@user = @book.user
				#render "books/show" and return
			end
	end

	def destroy
		@comment = BookComment.find(params[:id])
		book = Book.find(@comment.book_id)
		if @comment.user == current_user
			@comment.destroy
			flash[:notice] = "successfully deleted!"
		else
			flash[:notice] = "You cannot delete this comment"
		end
		redirect_to book
	end

	private

	def comment_params
		params.require(:book_comment).permit(:content, :book_id)
	end

end

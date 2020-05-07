class BookCommentsController < ApplicationController

	def create
		@comment_new = BookComment.new
		@comment = current_user.book_comments.new(comment_params)
		@book = Book.find(@comment.book_id)
		@comments = @book.book_comments
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
		respond_to do |format|
			format.html{redirect_to book}
			format.js
		end
	end

	private

	def comment_params
		params.require(:book_comment).permit(:content, :book_id)
	end

end

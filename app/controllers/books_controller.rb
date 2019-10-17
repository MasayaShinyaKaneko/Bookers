class BooksController < ApplicationController
	def top
	end
    def about
    end
	def index
		@book = Book.new
		@books = Book.all
        @user = current_user
    end
    def show
        @books = Book.new
    	@book = Book.find(params[:id])
        @user = User.find(@book.user.id)
    end
    def create
    	@book = Book.new(book_params)
    	@book.user_id = current_user.id
    	if @book.save
           flash[:notice] = "You have creatad book successfully."
    	   redirect_to book_path(@book.id)
        else
           flash[:notice] = "error!!"
           @user = current_user
           @books = Book.all
           render :index
        end
    end
    def edit
        @book = Book.find(params[:id])
        if @book.user != current_user
           flash[:notice] = "編集するが権限がありません"
           redirect_to books_path
        else
           @book = Book.find(params[:id])
           render :edit
        end
    end
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
           flash[:notice] = "You have updated book successfully."
           redirect_to book_path(@book.id)
        else
           flash[:notice] = "error!!"
           render :edit
        end
    end
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end
  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
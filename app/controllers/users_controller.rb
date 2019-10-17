class UsersController < ApplicationController
    def index
        @users = User.all
        @user = current_user
        @book = Book.new
    end
    def show
    	@user = User.find(params[:id])
        @book = Book.new
    	@books = @user.books
    end
    def edit
        @user = User.find(params[:id])
        if @user != current_user
           flash[:notice] = "編集するが権限がありません"
           redirect_to user_path(current_user.id)
        else
           @user = User.find(params[:id])
           render :edit
        end
    end
    def update
    	@user = User.find(params[:id])
        if @user.update(user_params)
           flash[:notice] = "You have updated profile successfully."
           redirect_to user_path(current_user.id)
        else
           flash[:notice] = "error!!"
           render :edit
        end
    end
def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
end
end
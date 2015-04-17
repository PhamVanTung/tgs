class	UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy ]
	def index
		@users = User.all
	end
	
	def new
		@users = User.new
	end

	def edit
		@users = User.find(params[:id])
	end

	def show
		@users = User.find(params[:id])
		@entries = @users.feed.paginate(page: params[:page])
	end

	def create
		@users = User.new user_params
		if @users.save 
			log_in @user
			flash[:success] = "Insert user complete"
	    redirect_to users_path
		else
			render "new"
		end
	end

	def update
		@users = User.find(params[:id])
    if @users.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to users_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def logged_in_user
	  unless logged_in?
	    flash[:danger] = "Please log in take access system"
	      redirect_to root_path
    end
  end
end
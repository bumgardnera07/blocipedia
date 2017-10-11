class UsersController < ApplicationController
   def update
    @user = User.find(params[:id])
    @user.standard!
    flash[:success] = 'NO REFUNDS!'
    redirect_to root_path
   end
   
end

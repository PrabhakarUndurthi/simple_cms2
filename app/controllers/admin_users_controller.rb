class AdminUsersController < ApplicationController

	layout "admin"

	before_action :confirm_logged_in


  def index

  	@adminusers = AdminUser.sorted
  end

  def new
  	@adminuser = AdminUser.new
  end


  def create

  	@adminuser = AdminUser.new(admin_user_params)
  	if @adminuser.save
  		flash[:notice] = "Admin User creted"
  		redirect_to(:action=> 'index')
  	else
  		render(:action => 'new')
  	end
  end


  def edit
  	@adminuser = AdminUser.find(params[:id])
  end


  def update
    @adminuser = AdminUser.find(params[:id])
  	 if @adminuser = AdminUser.update_attribues(admin_user_params)
  	 	flash[:notice] ="Admin User updated."
  	redirect_to(:action => 'index')
  else
  	render(:action => 'edit')
  end
end


  def delete
  	@adminuser = AdminUser.find(params[:id])
  end


  def destroy
    AdminUser.find(params[:id]).destroy
    flash[:notice] = "Admin User destroyed."
    redirect_to(:action => 'index')
  end


  private


  def admin_user_params
  	params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password)
  end


end

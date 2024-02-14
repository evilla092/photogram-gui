class UsersController < ApplicationController

  def list
    @users_list = User.all
    render(template: "user_templates/list")
  end

  def create
    @new_user = User.new
    @new_user.username = params.fetch("input_username")

    if @new_user.valid?
      @new_user.save
      redirect_to("/users/#{@new_user.username}", { :notice => "User created successfully." })
    else
      redirect_to("/users/#{@new_user.username}", { :notice => "User failed to create successfully." })
    end
  end

  def profile
    @user_profile = User.where(username: params.fetch("username") ).first
    render(template: "user_templates/profile")
  end

  def update
    the_id = params.fetch("user_id")
    updated_user = User.where(id: the_id).first
    updated_user.username = params.fetch("input_username")
    if updated_user.valid?
      updated_user.save
      redirect_to("/users/#{updated_user.username}", { :notice => "User updated successfully." })
    else
      redirect_to("/users/#{updated_user.username}", { :notice => "User failed to update successfully." })
    end

  end

end


class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @titre = @user.nom

  end

  def new
     @titre = "Inscription"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Bienvenue dans l'Application Exemple!"
      redirect_to @user
    else
      @titre = "Inscription"
      @user.password =""
      @user.password_confirmation = ""
      render 'new'
    end
  end
end

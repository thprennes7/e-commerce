class BannersController < ApplicationController
  before_action :set_banner, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def new

  end
  #Method that saves the banner in different format once it is created.
  def create
    @banner = Banner.new(banner_params)
    respond_to do |format|
      if @banner.save
        format.js
        format.html { redirect_to @banner, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @banner }
        #If the conditions are not met send an error without saving.
      else
        format.html { render :new }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end
  #Method that saves the banner in different format once it is modified.
  def update
    respond_to do |format|
      if @banner.update(title: params[:title], description: params[:description])
        format.js
        format.html { redirect_to @banner, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @banner }
        #If the conditions are not met send an error without saving.
      else
        format.html { render :edit }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end
#If the user is not admin, can not destroy the banner otherwise he can
  def destroy
    unless is_admin?(current_user)
      redirect_to request.referer
      flash[:notice] = "Accés interdit"
    end
    @banner.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to banners_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def banner_params
    params.require(:banner).permit(:title, :description, :banner_image)
  end

  def set_banner
    @banner = Banner.find(params[:id])
  end
end

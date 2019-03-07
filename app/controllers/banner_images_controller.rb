class BannerImagesController < ApplicationController
  def create
    @banner = Banner.find(params[:banner_id])
    @banner.banner_image.attach(banner_img_params[:banner_image])
    respond_to do |format|
      format.js
      format.html { redirect_to(root_path) }
    end
  end

  private

  def banner_img_params
  params.permit(:banner_image, :item_id)
  end

end

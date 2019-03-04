class CatPicturesController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    puts cat_params
    @item.cat_picture.attach(cat_params[:cat_picture])
    respond_to do |format|
      format.js
      format.html { redirect_to(item_path(@item)) }
    end
  end

private

def cat_params
  params.permit(:cat_picture, :item_id)
end

end

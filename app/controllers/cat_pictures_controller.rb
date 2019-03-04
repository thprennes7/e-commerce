class CatPicturesController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @item.cat_picture.attach(cat_params[:cat_picture])
    respond_to do |format|
      format.html { redirect_to(item_path(@item)) }
      format.js
    end
  end

private

def cat_params
  params.permit(:cat_picture)
end

end

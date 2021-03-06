class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /items
  # GET /items.json
  def index
    @banners = Banner.all
    @items = Item.all
    @orders = Order.all
    @count = Banner.all.length
    @banners_sorted = @banners.sort.reverse
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    unless is_admin?(current_user)
      redirect_to request.referer
      flash[:notice] = "Accés interdit"
    end
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    unless is_admin?(current_user)
      redirect_to request.referer
      flash[:notice] = "Accés interdit"
    end
  end

  # POST /items
  # POST /items.json
  def create
    puts '=' * 30
    puts item_params
    puts '=' * 30
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.js
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    unless is_admin?(current_user)
      redirect_to request.referer
      flash[:notice] = "Accés interdit"
    end
    # 
    # if already_ordered(@item)
    #   flash[:notice] = "Impossible de supprimer un objet déjà commandé"
    #   redirect_to root_path
    # end

    @item.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:price, :title, :description, :cat_picture)
  end
end

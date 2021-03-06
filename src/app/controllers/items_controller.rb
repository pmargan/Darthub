# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :check_login
  before_action :check_owner, only: %i[edit update destroy]
  before_action :set_item, only: %i[show edit update destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  def my_items
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @items = Item.all
  end

  # GET /items/new
  def new
    @item = Item.new
    @item = current_user.items.build
    @item.quantity = 1
  end

  # GET /items/1/edit
  def edit; end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item = current_user.items.build(item_params)
    @item.image.attach(params[:item][:image])
    respond_to do |format|
      if @item.save
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
    @item = Item.find(params[:id])

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
    @item = Item.find(params[:id])

    @item.destroy
    respond_to do |format|
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
    params.require(:item).permit(:name, :description, :condition, :price, :image, :quantity)
  end

  def user_owns?(item)
    current_user.items.include?(item)
  end

  def check_owner
    return if user_owns?(Item.find(params[:id])) || current_user.has_role?(:admin)

    flash[:error] = 'You do not have permissions to edit this item'
    redirect_to items_path
  end
end

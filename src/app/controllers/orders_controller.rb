# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :check_login
  before_action :check_owner, only: %i[edit update destroy]
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show; end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit; end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.new(order_params)
    @item = Item.find(params[:item_id])

    respond_to do |format|
      if @order.save
        format.html { redirect_to item_order_path(@item, @order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:order_id, :user_id)
  end

  def user_owns?(order)
    current_user.orders.include?(order)
  end

  def check_owner
    return if user_owns?(Order.find(params[:id])) || current_user.has_role?(:admin)

    flash[:error] = 'You do not have permissions to edit this item'
    redirect_to orders_path
  end
end

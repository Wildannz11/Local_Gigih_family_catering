class OrdersController < ApplicationController
  before_action :set_order_by_id, only: %i[ show edit update destroy ]
  before_action :set_item, only: %i[edit update new create]
  before_action :select_order_date, only: %i[ create ]
  before_action :check_order_status, only: %i[ index ]


  # GET /orders or /orders.json
  def index
    @orders = if !params[:order_date].nil?
                Order.by_order_date(params[:order_date])
              elsif !params[:email].nil?
                Order.by_customer_email(params[:email])
              elsif !params[:total_price].nil?
                Order.by_total_price(params[:total_price].to_f)
              else
                Order.all
              end
  end

  # GET /orders/1 or /orders/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_by_id
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:customer_id, :total_price, :order_date, :status , carts_attributes: [:item_id, :quantity, :_destroy])
    end

    def check_order_status
      current_hour = Time.now.strftime('%H')
      Order.where('status LIKE ?', 'NEW').update_all(status: 'CANCELLED') if current_hour.to_i >= 17
    end

    def select_order_date
      order_date = [ params[:order]['order_date(1i)'], params[:order]['order_date(2i)'], params[:order]['order_date(3i)'] ].join("-")
      params[:order][:order_date] = order_date
    end

    def set_item
      @items = Item.all
    end  
end

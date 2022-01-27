class OrdersController < ApplicationController
  def new
    @order = current_cart.order

  end

  def create
    @order = current_cart.order

    if @order.update_attribute(order_params.merge(status: 'open'))
      redirect_to root_path
    else
      render :new
    end
  end

    private

    def order_params
      params.require(:order).permit(:first_name, :last_name)

    end

end
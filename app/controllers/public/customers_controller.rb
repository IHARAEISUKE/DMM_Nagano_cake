class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  @customer = Customer.find(params[:id])
  @customer.update(customer_params)
  redirect_to customer_path(@customer.id)
  end

  def check

  end

  def status
  @customer = current_customer
  @customer.update(is_active: false)
  reset_session
  redirect_to root_path
  end

private

def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)


end

end
# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_customer, only: [:create]


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected

    def reject_customer
     @customer = Customer.find_by(email: params[:customer][:email])
      if @customer

        if @customer.valid_password?(params[:customer][:password]) && (@customer.is_active == false)

         #flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
          redirect_to new_customer_registration_path, notice: "退会済みです。再度ご登録をしてご利用ください。"
        else
          flash[:notice] = "項目を入力してください"
        end
      end
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

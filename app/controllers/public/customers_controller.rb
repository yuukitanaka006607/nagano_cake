class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!

    def show
      @customer = current_customer
    end

    def edit
      @customer = current_customer
    end

    def update
      @customer = current_customer
      @customer.update(customer_params)
      redirect_to "/customers/my_page"
    end

    def check
      @customer = current_customer
    end

    def withdrawal
     @customer = current_customer
     @customer.update(is_active: false)
     reset_session
     redirect_to root_path
    end

    private

    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
    end

end
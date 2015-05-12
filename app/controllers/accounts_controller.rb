class AccountsController < ApplicationController
	def index
		@accounts=Account.all		
	end

	def new
		@account = Account.new
	end
	
	def create
		@account = Account.new(account_params)
		if @account.save
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@account = Account.find(params[:id])
	end

	def update
		@account = Account.find(params[:id])
		if @account.update(account_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@account = Account.find(params[:id])
		@account.destroy
		redirect_to root_path
	end

	def dashboard
		@data= Account.dashboard
	end

	private
	def account_params
		params.require(:account).permit(:title ,:expense, :datetime)
		
	end
end

class InvestmentsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :show]
  def new
    @investment = Investment.new
  end

  def create
    if !Investment.find_by(user_id: current_user.id, month: 12)
    @investment = Investment.new(investment_params)
    @investment.user_id = current_user.id
    if @investment.stock.present? && @investment.bonds.present? && @investment.pachinko.present?
      @investment.saving = 100000000 - @investment.stock - @investment.bonds - @investment.pachinko
      @investment.total = @investment.stock + @investment.bonds + @investment.pachinko + @investment.saving
      @investment.month = 0
      if @investment.saving >= 0 && @investment.save
        1.upto(12) do |num|
          @investment = @investment.dup
          @investment.stock = @investment.stock * rand(4..23) /11.to_f
          @investment.bonds = @investment.bonds * rand(8..17) /11.to_f
          @investment.pachinko = @investment.pachinko * rand(1..11) /10.to_f
          @investment.total = @investment.stock + @investment.bonds + @investment.pachinko + @investment.saving
          @investment.month = num
          @investment.save
        end
        #binding.irb
        redirect_to @investment
      else
        flash.now[:danger] = '投資することが出来ませんでした'
        #binding.irb
        render :new
      end
    else
      flash.now[:danger] = '入力してください'
      render :new
    end
    else
      flash.now[:danger] = '既に相談しています'
      render :new
    end
  end

  def show
    @result = Investment.find_by(user_id: current_user.id, month: 12)
    @investments = Investment.where(user_id: current_user.id).includes(:user).order(month: :asc)
  end

  def index
    @investments = Investment.where(month: 12).order(total: :desc).limit(10)
  end

  private

  def investment_params
    params.require(:investment).permit(:stock, :bonds, :pachinko)
  end
end

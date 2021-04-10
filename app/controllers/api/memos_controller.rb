class Api::MemosController < ApplicationController
  protect_from_forgery

  def index
    @memos = Memo.order('created_at DESC')
  end

  def create
    @memo = Memo.new(memo_params)
    puts @memo
    if @memo.save
      render :show, status: :created
    else
      render json: @memo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    render :index
  end

  private
    def memo_params
      params.require(:memo).permit(:title, :description)
    end
end

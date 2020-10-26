class Stores::StoresController < ApplicationController
  before_action :authenticate_store!

  def show
    @store = Store.find(params[:id])
  end

  def edit
    @store = Store.find(params[:id])
    if @store == current_store
       render "edit"
    else
      redirect_to stores_root_path
    end
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to stores_store_path, notice: 'お店内容を修正しました'
    else
      render "edit"
    end
  end

  private
  def store_params
    params.require(:store).permit(:image, :name, :phone_number, :postal_number, :address, :introduce, :genre, :mood, :use, :seat, :private,  :smoking)
  end
end

class Admins::StoresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @stores = Store.all
  end
  def show
    @store = Store.find(params[:id])
  end
end

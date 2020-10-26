class Users::StoresController < Users::Base
  def index
    @stores = Store.all
  end
  def show
    @stores = Store.all
  end
end

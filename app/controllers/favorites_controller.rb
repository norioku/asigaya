class FavoritesController < ApplicationController
    
def index
    @user = User.find(params[:id])
end

end
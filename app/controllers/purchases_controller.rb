class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def new
    @purchase= current_user.purchases.build
  end

  def show
  end

  def create
    @artwork=Artwork.find(params[:artwork_id])
    @purchase= current_user.purchases.build
    @purchase.artwork_id= @artwork.id
    

    if @purchase.save
      redirect_to artwork_path(@artwork)
    else
      redirect_to artwork_path(@artwork)
    end
  end 




end

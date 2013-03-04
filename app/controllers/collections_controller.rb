class CollectionsController < ApplicationController

  def index
    @collections = Collection.order :name
  end

  def new
    @collection = Collection.new
  end

  def edit
    @collection = Collection.find params[:id]
  end

  def create
    @collection = Collection.new params[:collection]
    if @collection.save
      redirect_to root_path, notice: 'Create Collection'
    else
      render :new
    end
  end

  def update
    @collection = Collection.find params[:id]

    if @collection.update_attributes params[:collection]
      redirect_to root_path, notice: 'Updated Collection'
    else
      render :edit
    end
  end

  def destroy
    colleciton = Collection.find params[:id]
    colleciton.destroy
    flash[:error] = "Deleted Collection"
    redirect_to root_path
  end
end
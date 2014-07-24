class CollectionsController < ApplicationController
  before_filter :authenticate

  def index
    @collections = Collection.order :name
  end

  def show
    @collection = Collection.find params[:id]
  end

  def new
    @collection = Collection.new    
  end

  def edit
    @collection = Collection.find params[:id]
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      redirect_to collection_path(@collection), notice: 'Create Collection'
    else
      render :new
    end
  end

  def update
    @collection = Collection.find params[:id]

    if @collection.update_attributes(collection_params)
      redirect_to collection_path(@collection), notice: 'Updated Collection'
    else
      render :edit
    end
  end

  def destroy
    colleciton = Collection.find params[:id]
    colleciton.destroy
    flash[:error] = "Deleted Collection"
    redirect_to collections_path
  end

  private

  def collection_params
    params.require(:collection).permit(
      :name,
      :collection_description,
      :icon_1,
      :icon_2,
      :icon_3,
      :icon_4,
      :icon_5,
      collection_sections_attributes: [:title, :body, :_destroy])
  end
end
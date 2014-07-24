class StyleTypesController < ApplicationController
  before_filter :authenticate

  def index
    @style_types = StyleType.order :name
  end

  def new
    @style_type = StyleType.new
  end

  def edit
    @style_type = StyleType.find params[:id]
  end

  def create
    @style_type = StyleType.new(style_type_params)
    if @style_type.save
      redirect_to collection_path(@style_type.collection), notice: 'Create Style Type'
    else
      render :new
    end
  end

  def update
    @style_type = StyleType.find params[:id]

    if @style_type.update_attributes(style_type_params)
      redirect_to collection_path(@style_type.collection), notice: 'Updated Style Type'
    else
      render :edit
    end
  end

  def destroy
    style_type = StyleType.find params[:id]
    style_type.destroy
    flash[:error] = "Deleted Style Type"
    redirect_to collections_path
  end

  private

  def style_type_params
    params.require(:style_type).permit(:collection_id, :name, :material)
  end
end

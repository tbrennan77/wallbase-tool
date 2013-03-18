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
    @style_type = StyleType.new params[:style_type]
    if @style_type.save
      redirect_to collections_path, notice: 'Create Style Type'
    else
      render :new
    end
  end

  def update
    @style_type = StyleType.find params[:id]

    if @style_type.update_attributes params[:style_type]
      redirect_to collections_path, notice: 'Updated Style Type'
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
end
class ColorsController < ApplicationController
  
  before_filter :authenticate

  def new    
    @color = Color.new color_palette_id: params[:id]
  end

  def edit
    @color = Color.find params[:id]
  end

  def create
    @color = Color.new params[:color]
    if @color.save
      redirect_to color_palettes_path, notice: 'Created Color'
    else
      render :new
    end
  end

  def update
    @color = Color.find params[:id]
    if @color.update_attributes params[:color]
      redirect_to color_palettes_path(color_palette_id: @color.color_palette_id), notice: 'Updated Color'
    else
      render :edit
    end
  end

  def destroy
    color = Color.find params[:id]
    color.destroy
    flash[:error] = "Deleted Color"
    redirect_to color_palettes_path
  end
end
class ColorPalettesController < ApplicationController
  before_filter :authenticate

  def index
    @color_palettes = ColorPalette.ordered
  end

  def new
    @color_palette = ColorPalette.new
  end

  def edit
    @color_palette = ColorPalette.find params[:id]
  end

  def create
    @color_palette = ColorPalette.new params[:color_palette]
    if @color_palette.save
      redirect_to color_palettes_path, notice: 'Create Color Palette'
    else
      render :new
    end
  end

  def update
    @color_palette = ColorPalette.find params[:id]

    if @color_palette.update_attributes params[:color_palette]
      redirect_to color_palettes_path, notice: 'Updated Color Palette'
    else
      render :edit
    end
  end

  def destroy
    color_palette = ColorPalette.find params[:id]
    color_palette.destroy
    flash[:error] = "Deleted Color Palette"
    redirect_to color_palettes_path
  end
end
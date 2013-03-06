class FiltersController < ApplicationController
  def index
    @collections = Collection.order(:name)
    @color_palettes = ColorPalette.ordered
    @style_types = StyleType.order(:name)
    
    if params[:profile_id].present?
      @profile = Profile.find params[:profile_id]
    end

    filter = Profile.scoped include: :style_type

    # Filter collections
    if params[:collection_id].present?
      filter = filter.scoped conditions: ['style_types.collection_id = ?', params[:collection_id]]    
    end

    # Filter styles
    if params[:style_type_id].present?
      filter = filter.scoped conditions: ['style_type_id = ?', params[:style_type_id]]
    end

    # Filter materials
    if params[:material].present?
      filter = filter.scoped include: :collection, conditions: ['collections.material LIKE ?', params[:material]]
    end

    # Filter color palettes
    if params[:color_palette_ids].present?
      params[:color_palette_ids].each do |cpid|
        sql = <<-END_SQL
          EXISTS ( SELECT 1
                   FROM profile_color_palettes
                   WHERE profile_id = profiles.id
                   AND color_palette_id = ?)
        END_SQL
        filter = filter.scoped conditions: [sql, cpid]
      end
    end

    @profiles = filter 
    @empty = "<h1 class='animated bounceInDown' style='margin-top: 40%;text-align:center'>There were no results</h1>".html_safe if @profiles.blank?      
  end
end

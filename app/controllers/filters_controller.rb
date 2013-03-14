class FiltersController < ApplicationController
  def index
    @collections = Collection.order(:name)
    @color_palettes = ColorPalette.ordered    
    
    @profile = Profile.find params[:profile_id] || Profile.first #if params[:profile_id].present?

    filter = StyleType.scoped
    
    # Filter collections
    if params[:collection_id].present?
      filter = filter.scoped conditions: ['collection_id = ?', params[:collection_id]]    
    end

    # Filter styles
    if params[:style_type_id].present?
      filter = filter.scoped conditions: ['style_types.id = ?', params[:style_type_id]]
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
        filter = filter.scoped include: :profiles, conditions: [sql, cpid]
      end
    end

    @style_types = filter 
    @empty = "<h1 class='animated bounceInDown' style='margin-top: 40%;text-align:center'>There were no results</h1>".html_safe if @style_types.blank?      
  end
end

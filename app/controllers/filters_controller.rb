class FiltersController < ApplicationController
  def index
    @collections = Collection.order(:name)
    @color_palettes = ColorPalette.ordered
    @style_types = StyleType.order(:name)
    
    filter = Profile.scoped :include => :style_type

    if params[:collection_id].present?
      filter = filter.scoped :conditions => ['style_types.collection_id = ?', params[:collection_id]]    
    end

    if params[:style_type_id].present?
      filter = filter.scoped :conditions => ['style_type_id = ?', params[:style_type_id]]
    end

    if params[:color_palette_ids].present?
      sql = <<-END_SQL
        EXISTS ( SELECT 1
                 FROM profile_color_palettes
                 WHERE profile_id = profiles.id
                 AND color_palette_id IN (?))
      END_SQL
      filter = filter.scoped :conditions => [sql, params[:color_palette_ids]]
    end

    @profiles = filter

    @empty = @profiles.blank? ? 'There were no results' : ''
  end
end

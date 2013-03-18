class FiltersController < ApplicationController
  def index
    @collections = Collection.order(:name)
    @color_palettes = ColorPalette.ordered    
    
    @profile = Profile.find params[:profile_id] if params[:profile_id].present?

    # begin filtering
    style_type_filter = StyleType.scoped

    # collections
    if params[:collection_id].present?
      style_type_filter = style_type_filter.scoped conditions: ['collection_id = ?', params[:collection_id]]    
    end

    # styles
    if params[:style_type_id].present?
      style_type_filter = style_type_filter.scoped conditions: ['style_types.id = ?', params[:style_type_id]]
    end

    # materials
    if params[:material].present?
      style_type_filter = style_type_filter.scoped include: :collection, conditions: ['collections.material LIKE ?', params[:material]]
    end

    # color palettes
    if params[:color_palette_ids].present?
      params[:color_palette_ids].each do |cpid|
        sql = <<-END_SQL
          EXISTS ( SELECT 1
                   FROM profile_color_palettes
                   WHERE profile_id = profiles.id                   
                   AND color_palette_id = ?)
        END_SQL
        style_type_filter = style_type_filter.scoped include: :profiles, conditions: [sql, cpid]
      end
    end

    @style_types = style_type_filter.limit(8)
  end
end

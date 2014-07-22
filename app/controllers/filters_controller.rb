class FiltersController < ApplicationController
  layout 'filter'

  def index
    @collections = Collection.order(:name)
    @color_palettes = ColorPalette.ordered    
    
    if params[:profile_id].present?
      @profile = Profile.includes(
        :color_palettes,
        :colors,
        :style_type,
        :collection,
        :collection_sections
        ).find(params[:profile_id])
    end

    # begin filtering
    style_type_filter = StyleType.includes(:collection, :profiles, :color_palettes).scoped

    # collections
    if params[:collection_id].present?
      style_type_filter = style_type_filter.scoped(conditions: ['collection_id = ?', params[:collection_id]])
    end

    # styles
    if params[:style_type_name].present?
      style_type_filter = style_type_filter.scoped(conditions: ['style_types.name = ?', params[:style_type_name]])
    end

    # materials
    if params[:material].present?
      style_type_filter = style_type_filter.scoped(conditions: ['collections.material LIKE ?', params[:material]])
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

        style_type_filter = style_type_filter.scoped(conditions: [sql, cpid])      
      end
    end

    @style_types = style_type_filter.order('style_types.collection_id').limit(30)
  end

  def samplecart    
    johnsonite_api_path = cookies[:wallbase_sample_skus] || ''
    johnsonite_api_path += ',' unless johnsonite_api_path.blank?

    params[:wallbase_skus].each do |sku|
      johnsonite_api_path += "#{sku},"
    end
    
    cookies[:wallbase_sample_skus] = {
      value: johnsonite_api_path.split(',').uniq.join(','),
      domain: '.johnsonite.com'
    }
    flash[:notice] = "Added skus to sample cart!"
    render text: '<script>document.domain = "johnsonite.com";parent.GoToCart();</script>'
  end

  def color_palettes
    @color_palettes = ColorPalette.ordered    
  end
end

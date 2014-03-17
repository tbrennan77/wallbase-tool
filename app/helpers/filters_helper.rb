# encoding: UTF-8
module FiltersHelper
  def nice_color_palette_name_for(color_palette)
    if color_palette.name == 'Selects'
      'Selects Palette'
    elsif color_palette.name == 'W'
      'Wall Art'
    elsif color_palette.name == 'Wood'
      'Wood Patterns (Masquerade)'
    elsif color_palette.name == 'Stone'
      'Stone Patterns (Masquerade)'
    elsif color_palette.name == 'Wall Art'
      'Wall Art Patterns'
    else
      "Palette #{color_palette.name}"
    end
  end

  def nice_checkbox_palette_name_for(color_palette)
    if color_palette.name == 'Selects'
      '<span class="color-palette round color-palette-Selects" style=""></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Selects Palette'.html_safe
    elsif color_palette.name == 'W'
      '&nbsp;<span class="color-palette round color-palette-W" style="left:20px !important">W</span> Wall Art'.html_safe
    elsif color_palette.name == 'Wood'
      'Masquerade (Standard)'
    elsif color_palette.name == 'Stone'
      'hide'
    elsif color_palette.name == 'Wall Art'
      'Wall Art Patterns'
    else
      "&nbsp;<span class='color-palette round color-palette-#{color_palette.name}'>#{color_palette.name}</span> Palette #{color_palette.name}".html_safe
    end
  end

  def colors_for(color_palette)
    list_items = ""
    if color_palette.name == "Selects"            
      Color.where(selects: true).each do |color|
      list_items += "<li style='display:inline-block;margin: 0 8px; width: 50px;' class='has-tip' data-tooltip title='#{display_color_number color.color_number} #{color.name} #{color.color_foundation}'>               
            <label class='color-label' style='background: ##{color.hex}' data-color='#{color.hex}'>
              <input type='checkbox' data-sku='#{@profile.uuid.gsub('XX', display_color_number(color.color_number))}' value='#{display_color_number color.color_number} #{color.name}' style='display:none'/>
            </label>
          </li>"
      end
    elsif color_palette.name == "Wall Art"
      color_palette.colors.each do |color|
      list_items += "<li style='display:inline-block;margin: 0 8px; width: 50px;' class='has-tip' data-tooltip title='#{display_color_number color.color_number} #{color.name} #{color.color_foundation}'>               
          <label class='color-label' style='background: url(/assets/wallart/#{color.color_number}.jpg)' data-color='#{color.hex}'>
            <input type='checkbox' data-sku='#{@profile.uuid.gsub('XX', color.color_number)}' value='#{color.color_number} #{color.name}' style='display:none'/>
          </label>
        </li>"
      end
    elsif color_palette.name == "Wood"
      color_palette.colors.each do |color|
      list_items += "<li style='display:inline-block;margin: 0 8px; width: 50px;' class='has-tip' data-tooltip title='#{display_color_number color.color_number} #{color.name} #{color.color_foundation}'>               
          <label class='color-label' style='background: url(/assets/wood/#{color.color_number}.jpg)' data-color='#{color.hex}'>
            <input type='checkbox' data-sku='#{@profile.uuid.gsub('XX', display_color_number(color.color_number))}' value='#{display_color_number color.color_number} #{color.name}' style='display:none'/>
          </label>
        </li>"
      end
    elsif color_palette.name == "Stone"
      color_palette.colors.each do |color|
      list_items += "<li style='display:inline-block;margin: 0 8px; width: 50px;' class='has-tip' data-tooltip title='#{color.color_number} #{color.name} #{color.color_foundation}'>               
          <label class='color-label' style='background: url(/assets/stone/#{color.color_number}.jpg)' data-color='#{color.hex}'>
            <input type='checkbox' data-sku='#{@profile.uuid.gsub('XX', color.color_number)}' value='#{color.color_number} #{color.name}' style='display:none'/>
          </label>
        </li>"
      end
    else
      color_palette.colors.each do |color|
      list_items += "<li style='display:inline-block;margin: 0 8px; width: 50px;' class='has-tip' data-tooltip title='#{display_color_number color.color_number} #{color.name} #{color.color_foundation}'>               
          <label class='color-label' style='background: ##{color.hex}' data-color='#{color.hex}'>
            <input type='checkbox' data-sku='#{@profile.uuid.gsub('XX', display_color_number(color.color_number))}' value='#{display_color_number color.color_number} #{color.name}' style='display:none'/>
          </label>
        </li>"
      end
    end

    list_items.html_safe
  end

  def image_for(profile, options={})
    if options[:type] == 'profile'
      folder = "profile_images"
      image_suffex = "profile"
    elsif options[:type] == 'corner'
      folder = "corner_images"
      image_suffex = "image"
    end

    if File.exists?(File.join(Rails.root, "app/assets/images/#{folder}/#{profile.style_type.name.capitalize}-#{profile.name}-#{image_suffex}.jpg"))
      image_tag "/assets/#{folder}/#{profile.style_type.name.capitalize}-#{profile.name}-#{image_suffex}.jpg", class: options[:class]
    else
      image_tag "missing.jpg", class: options[:class]
    end
  end

  def image_for_results(style_type)
    if File.exists?(File.join(Rails.root, "app/assets/images/profile_images/#{style_type.name.capitalize}-#{style_type.profiles.first.name}-profile.jpg"))
      image_tag "/assets/profile_images/#{style_type.name.capitalize}-#{style_type.profiles.first.name}-profile.jpg", class: "left has-tip result-profile-image", title: "Choose a profile from the dropdown to see more details!", data: {tooltip:  ''}
    else
      image_tag "missing.jpg", class: "left has-tip result-profile-image", title: "Choose a profile from the dropdown to see more details!", data: {tooltip:  ''}
    end
  end

  def icons_for_collection(collection)
    image_div = ""
    if @profile.collection.icon_1
      image_div << image_tag("Icon_BIAQ.png")
      image_div << "<br /><br />"
    end
    if @profile.collection.icon_2
      image_div << image_tag("icon_floorscore.png")
      image_div << "<br /><br />"
    end
    if @profile.collection.icon_3
      image_div << image_tag("icon_NSF.png")
      image_div << "<br /><br />"
    end
    if @profile.collection.icon_4
      image_div << image_tag("icon_phthalateFree.png")
      image_div << "<br /><br />"
    end
    if @profile.collection.icon_5
      image_div << image_tag("icon_phthalateHalogen.png")
    end
    image_div.html_safe
  end

  def color_swatch_for(color_palette)
    divs = ""
    if color_palette.name.downcase == "selects"            
      Color.where(:selects => true).order(:color_number).each do |color|
        divs += "<div class='large-3 columns color-swatch'><div class='swatch shadow' style='background: ##{color.hex};'></div><br />
                       <b>#{display_color_number color.color_number}</b> #{color.name}<b> #{color.color_foundation}</b> #{in_selects? color}<br />"
        divs += "</div>"
      end
    elsif color_palette.name.downcase == "wall art"            
      color_palette.colors.order(:color_number).each do |color|
        divs += "<div class='large-3 columns color-swatch'><div class='swatch shadow' style='background: url(/assets/wallart/#{color.color_number}.jpg);'></div><br />
                       <b>#{color.color_number}</b> #{color.name}<b> #{color.color_foundation}</b> #{in_selects? color}<br />"
        divs += "</div>"
      end
    elsif color_palette.name.downcase == "w"            
      color_palette.colors.order(:color_number).each do |color|
        divs += "<div class='large-3 columns color-swatch'><div class='swatch shadow' style='background: url(/assets/wallart/#{color.color_number}.jpg);'></div><br />
                       <b>#{color.color_number}</b> #{color.name}<b> #{color.color_foundation}</b> #{in_selects? color}<br />"
        divs += "</div>"
      end
    elsif color_palette.name.downcase == "wood"            
      color_palette.colors.order(:color_number).each do |color|
        divs += "<div class='large-3 columns color-swatch'><div class='swatch shadow' style='background: url(/assets/wood/#{color.color_number}.jpg);'></div><br />
                       <b>#{color.color_number}</b> #{color.name}<b> #{color.color_foundation}</b> #{in_selects? color}<br />"
        divs += "</div>"
      end
    elsif color_palette.name.downcase == "stone"            
      color_palette.colors.order(:color_number).each do |color|
        divs += "<div class='large-3 columns color-swatch'><div class='swatch shadow' style='background: url(/assets/stone/#{color.color_number}.jpg);'></div><br />
                       <b>#{color.color_number}</b> #{color.name}<b> #{color.color_foundation}</b> #{in_selects? color}<br />"
        divs += "</div>"
      end
    else
      color_palette.colors.order(:color_number).each do |color|
        divs += "<div class='large-3 columns color-swatch'><div class='swatch shadow' style='background: ##{color.hex};'></div><br />
                       <b>#{display_color_number color.color_number}</b> #{color.name}<b> #{color.color_foundation}</b> #{in_selects? color}<br />"
        divs += "</div>"
      end
    end

    divs.html_safe
  end

  def color_name_with_text(color_name)
    case color_name
    when 'Wood'
      'Masquerade (Standard)'
    when 'Stone'
      'hide'
    when 'Wall Art'
      color_name
    else
      color_name.gsub(/$W/, "Wall Art")
    end
  end
end

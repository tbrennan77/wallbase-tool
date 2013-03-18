module ColorPalettesHelper  
  def color_swatch_for(color_palette)
    divs = ""
    if color_palette.name.downcase == "selects"            
      Color.where(:selects => true).order(:color_number).each do |color|
        divs += "<div class='large-3 columns color-swatch'><div class='swatch shadow' style='background: ##{color.hex};'></div><br />
                       <b>#{display_color_number color.color_number}</b> #{color.name}<b> #{color.color_foundation}</b> #{in_selects? color}<br />"
        divs += link_to "Edit", edit_color_path(color)
        divs += " | "
        divs += link_to "Delete", color_path(color), method: :delete, class: 'red', data: {confirm: "Are you sure?"}
        divs += "</div>"
      end
    else
      color_palette.colors.order(:color_number).each do |color|
        divs += "<div class='large-3 columns color-swatch'><div class='swatch shadow' style='background: ##{color.hex};'></div><br />
                       <b>#{display_color_number color.color_number}</b> #{color.name}<b> #{color.color_foundation}</b> #{in_selects? color}<br />"
        divs += link_to "Edit", edit_color_path(color)
        divs += " | "
        divs += link_to "Delete", color_path(color), method: :delete, class: 'red', data: {confirm: "Are you sure?"}
        divs += "</div>"
      end
    end

    divs.html_safe
  end
end
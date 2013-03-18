module ApplicationHelper
  def in_selects?(color)
    '<span style="margin-left: 8px; position: absolute; margin-top: 4px; dispaly: block; -webkit-transform: rotate(45deg); height: 12px; width: 12px; background: maroon;">&nbsp;</span>'.html_safe if color.selects
  end

  def display_color_number(color_number)    
    if color_number.to_i < 99
      color_number[1..2]
    else
      color_number
    end    
  end
end

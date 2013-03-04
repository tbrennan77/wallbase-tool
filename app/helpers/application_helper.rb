module ApplicationHelper
  def in_selects?(color)
    '<span style="margin-left: 8px; position: absolute; margin-top: 4px; dispaly: block; -webkit-transform: rotate(45deg); height: 12px; width: 12px; background: maroon;">&nbsp;</span>'.html_safe if color.selects
  end
end

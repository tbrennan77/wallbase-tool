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

  def link_to_add_fields(name, f, association, options={})
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, 'javascript:void(0)', class: "add_fields #{options[:class]}", data: {id: id, fields: fields.gsub("\n", "")})
  end
end

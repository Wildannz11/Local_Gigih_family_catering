module ApplicationHelper

    def link_to_add_fields(name, form, association)
		new_object = form.object.send(association).klass.new
		id = new_object.object_id
		fields = form.fields_for(association, new_object, child_index: id) do |builder|
			render("orders/carts_fields", form: builder)
 		end
		link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
	end

end

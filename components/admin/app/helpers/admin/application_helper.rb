module Admin
  module ApplicationHelper
    def render_field(field, form)
      render partial: field.to_partial_path, locals: {form: form, field: field}
    end
  end
end

module Admin
  class Field
    # for outside API
    attr_accessor :column_name
    attr_accessor :field_module_name
    def initialize(params)
      @column_name = params[:column_name]
      @field_module_name = params[:field_module_name]

    end

    def to_partial_path

      "admin/field/#{field_type}/form"
    end

    def field_type
      field_module_name.to_s.split("::").last.underscore
    end

  end
end

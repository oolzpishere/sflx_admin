require "administrate/field/base"

class ImageField < Administrate::Field::HasMany
  def to_s
    data
  end
end

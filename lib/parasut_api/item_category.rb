class ParasutApi
  class ItemCategory < ParasutApi::Core::Model
    URL = '/:company_id/item_categories'

    attribute :id,             Integer
    attribute :category_type,  String
    attribute :name,           String
    attribute :bg_color,       String
    attribute :text_color,     String
  end
end
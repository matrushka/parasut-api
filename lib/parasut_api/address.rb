class ParasutApi
  class Address < ParasutApi::Core::Model
    attribute :address,  String
    attribute :phone,    String
    attribute :fax,      String
  end
end

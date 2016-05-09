class ParasutApi
  class User < ParasutApi::Core::Model
    attribute :id,            Integer
    attribute :name,          String
    attribute :email,         String
    attribute :display_name,  String
    attribute :avatar_url,    String
    attribute :companies,     Array[ParasutApi::Company], relation: true
  end
end

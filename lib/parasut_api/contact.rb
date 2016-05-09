class ParasutApi
  class Contact < ParasutApi::Core::Model
    URL = '/:company_id/contacts'

    attribute :id,                  Integer
    attribute :contact_type,        String
    attribute :name,                String
    attribute :email,               String
    attribute :tax_number,          String
    attribute :category,            ParasutApi::ItemCategory, relation: true
    attribute :address,             ParasutApi::Address
    attribute :phone,               String
    attribute :fax,                 String
    attribute :archived,            Boolean, default: false
    attribute :tax_office,          String
    attribute :e_invoice_city,      String
    attribute :e_invoice_district,  String
    attribute :balance,             String

    def as_json(*args)
      result = super(*args)
      result['address_attributes'] = result.delete('address')
      result
    end
  end
end
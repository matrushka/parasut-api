class ParasutApi
  class Company < ParasutApi::Core::Model
    attribute :id,          Integer
    attribute :name,        String
    attribute :is_owner,    Boolean
    attribute :accessible,  Boolean

    def contacts
      @contacts ||= ParasutApi::Core::Repository.new(context, ParasutApi::Contact, {
        company_id: self.id
      })
    end

    def item_categories
      @item_categories ||= ParasutApi::Core::Repository.new(context, ParasutApi::ItemCategory, {
        company_id: self.id
      })
    end

    def products
      @products ||= ParasutApi::Core::Repository.new(context, ParasutApi::Product, {
        company_id: self.id
      })
    end

    def sales_invoices
      @sales_invoices ||= ParasutApi::Core::Repository.new(context, ParasutApi::SalesInvoice, {
        company_id: self.id
      })
    end

    def tags
      @tags ||= ParasutApi::Core::Repository.new(context, ParasutApi::Tag, {
        company_id: self.id
      })
    end
  end
end

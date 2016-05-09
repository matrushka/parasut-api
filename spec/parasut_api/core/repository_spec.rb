require 'spec_helper'

class BuildURLTestClass
end

class BuildURLTestContext
  def root
    ''
  end
end

describe ParasutApi::Core::Repository do
  describe '.build_url' do
    it 'builds a url from template using options' do
      repo   = ParasutApi::Core::Repository.new(BuildURLTestContext.new, BuildURLTestClass.new)
      result = repo.build_url('/sales_invoices/:invoice_id/details/:id', {
        invoice_id: 1,
        id:         2
      })

      expect(result).to eq('/sales_invoices/1/details/2')
    end
  end
end

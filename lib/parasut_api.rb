require 'oauth2'
require 'virtus'
require 'virtus/relations'
require 'active_support/all'

require 'parasut_api/version'
require 'parasut_api/core/error'
require 'parasut_api/core/repository'
require 'parasut_api/core/model'
require 'parasut_api/core/list'

require 'parasut_api/company'
require 'parasut_api/user'
require 'parasut_api/address'
require 'parasut_api/item_category'
require 'parasut_api/contact'
require 'parasut_api/product'
require 'parasut_api/sales_invoice'
require 'parasut_api/tag'

require 'parasut_api/company'

class ParasutApi
  attr_reader :access_token, :root

  def initialize(access_token, root = nil)
    @root         = root || 'http://api.parasut.com/v1'
    @access_token = access_token
  end

  def current_user
    self.users.find('me')
  end

  def users
    @users ||= ParasutApi::Core::Repository.new(self, ParasutApi::User)
  end
end

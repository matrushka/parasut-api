require 'spec_helper'
require 'oauth2'

describe ParasutApi do
  it 'has a version number' do
    expect(ParasutApi::VERSION).not_to be nil
  end

  it 'does something useful' do
    api = ParasutApi.new(OAUTH_TOKEN, 'http://api.parasut.dev:3000/v1')
    user = api.current_user

    user.is_a? ParasutApi::User
    user.companies.first.is_a? ParasutApi::Company

    company   = user.companies.first
    contact   = company.contacts.find(407486)
    contact.address = ParasutApi::Address.new(address: 'test sok.')
    ap contact.save
  end
end










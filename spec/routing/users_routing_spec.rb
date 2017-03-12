require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do

    it 'routes to #create' do
      expect(:get => 'registrations/new').to route_to('registrations#new')
    end

    # it 'routes to #show' do
    #   expect(:get => '/users').to route_to('users#show')
    # end

    it 'routes to #edit' do
      expect(:get => '/user/edit').to route_to('users#edit')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/user').to route_to('users#update')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/user').to route_to('users#update')
    end

    # it 'routes to #destroy' do
    #   expect(:delete => '/users/1').to route_to('users#destroy', :id => '1')
    # end

  end
end

require './config/environment'

class App < Sinatra::Base
  use Rack::Session::Cookie, secret: ENV['RACK_COOKIE_SECRET']
  use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET'],
             access_type: 'offline',
             prompt: 'consent',
             provider_ignores_state: true,
             scope: 'email,profile,drive.file'
  end
  use ApplicationController
  use AuthController
  use TorrentEntitiesController
end
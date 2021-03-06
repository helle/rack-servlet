require 'sinatra/base'

class Application < Sinatra::Base
  get '/set-multiple-cookies' do
    response.set_cookie :foo, 'bar'
    response.set_cookie :bar, 'foo'
  end

  get '/legen-wait-for-it' do
    WaitForIt.new('dary!')
  end

  class WaitForIt
    def initialize(it)
      @it = it
    end

    def each
      sleep 2
      yield @it
    end
  end
end

Application.new
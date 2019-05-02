module API
  module Version1
    class Def < Grape::API
      format :json
      version 'v1', using: :path
      content_type :json, 'application/json'

      resource :def do
        get '/' do
          { status: 'def' }
        end
      end

      # get :def do
      #   { status: 'def' }
      # end
    end
  end
end

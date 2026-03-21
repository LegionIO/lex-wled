# frozen_string_literal: true

require 'faraday'

module Legion
  module Extensions
    module Wled
      module Helpers
        module Client
          def connection(url: 'http://wled-light.local', **_opts)
            Faraday.new(url: url) do |conn|
              conn.request :json
              conn.response :json, content_type: /\bjson$/
              conn.adapter Faraday.default_adapter
            end
          end
        end
      end
    end
  end
end

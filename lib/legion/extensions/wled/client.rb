# frozen_string_literal: true

require_relative 'helpers/client'
require_relative 'runners/state'
require_relative 'runners/effects'

module Legion
  module Extensions
    module Wled
      class Client
        include Helpers::Client
        include Runners::State
        include Runners::Effects

        attr_reader :opts

        def initialize(url: 'http://wled-light.local', **extra)
          @opts = { url: url, **extra }
        end

        def settings
          { options: @opts }
        end

        def connection(**override)
          super(**@opts, **override)
        end
      end
    end
  end
end

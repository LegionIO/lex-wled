# frozen_string_literal: true

require 'legion/extensions/wled/version'
require 'legion/extensions/wled/helpers/client'
require 'legion/extensions/wled/runners/state'
require 'legion/extensions/wled/runners/effects'
require 'legion/extensions/wled/client'

module Legion
  module Extensions
    module Wled
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end

require 'legion/extensions/wled/version'

module Legion
  module Extensions
    module Wled
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end

# frozen_string_literal: true

module Legion
  module Extensions
    module Wled
      module Runners
        module State
          def get_state(**)
            resp = connection(**).get('/json/state')
            { state: resp.body }
          end

          def set_power(on:, **)
            resp = connection(**).post('/json/state', { on: on })
            { state: resp.body }
          end

          def set_brightness(bri:, **)
            resp = connection(**).post('/json/state', { bri: bri })
            { state: resp.body }
          end

          def set_color(red:, green:, blue:, **)
            resp = connection(**).post('/json/state', { seg: [{ col: [[red, green, blue]] }] })
            { state: resp.body }
          end
        end
      end
    end
  end
end

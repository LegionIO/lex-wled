# frozen_string_literal: true

module Legion
  module Extensions
    module Wled
      module Runners
        module Effects
          def list_effects(**)
            resp = connection(**).get('/json/effects')
            { effects: resp.body }
          end

          def set_effect(id:, **)
            resp = connection(**).post('/json/state', { seg: [{ fx: id }] })
            { state: resp.body }
          end

          def list_palettes(**)
            resp = connection(**).get('/json/palettes')
            { palettes: resp.body }
          end
        end
      end
    end
  end
end

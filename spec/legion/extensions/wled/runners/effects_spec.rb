# frozen_string_literal: true

RSpec.describe Legion::Extensions::Wled::Runners::Effects do
  let(:client) { Legion::Extensions::Wled::Client.new(url: 'http://wled-light.local') }

  let(:stubs) { Faraday::Adapter::Test::Stubs.new }
  let(:test_connection) do
    Faraday.new(url: 'http://wled-light.local') do |conn|
      conn.request :json
      conn.response :json, content_type: /\bjson$/
      conn.adapter :test, stubs
    end
  end

  before { allow(client).to receive(:connection).and_return(test_connection) }

  describe '#list_effects' do
    it 'returns a list of available effects' do
      stubs.get('/json/effects') do
        [200, { 'Content-Type' => 'application/json' },
         ['Solid', 'Blink', 'Breathe', 'Wipe', 'Wipe Random']]
      end
      result = client.list_effects
      expect(result[:effects]).to include('Solid', 'Blink')
    end
  end

  describe '#set_effect' do
    it 'sets the effect by id' do
      stubs.post('/json/state') do
        [200, { 'Content-Type' => 'application/json' }, { 'on' => true }]
      end
      result = client.set_effect(id: 3)
      expect(result[:state]).to be_a(Hash)
    end

    it 'accepts effect id 0 for solid' do
      stubs.post('/json/state') do
        [200, { 'Content-Type' => 'application/json' }, { 'on' => true }]
      end
      result = client.set_effect(id: 0)
      expect(result[:state]).to be_a(Hash)
    end
  end

  describe '#list_palettes' do
    it 'returns a list of available palettes' do
      stubs.get('/json/palettes') do
        [200, { 'Content-Type' => 'application/json' },
         ['Default', 'Random Cycle', 'Primary Color', 'Based on Primary']]
      end
      result = client.list_palettes
      expect(result[:palettes]).to include('Default', 'Random Cycle')
    end
  end
end

# frozen_string_literal: true

RSpec.describe Legion::Extensions::Wled::Runners::State do
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

  describe '#get_state' do
    it 'returns the current device state' do
      stubs.get('/json/state') do
        [200, { 'Content-Type' => 'application/json' },
         { 'on' => true, 'bri' => 128, 'ps' => -1 }]
      end
      result = client.get_state
      expect(result[:state]['on']).to be true
      expect(result[:state]['bri']).to eq(128)
    end
  end

  describe '#set_power' do
    it 'turns the light on' do
      stubs.post('/json/state') do
        [200, { 'Content-Type' => 'application/json' }, { 'on' => true }]
      end
      result = client.set_power(on: true)
      expect(result[:state]['on']).to be true
    end

    it 'turns the light off' do
      stubs.post('/json/state') do
        [200, { 'Content-Type' => 'application/json' }, { 'on' => false }]
      end
      result = client.set_power(on: false)
      expect(result[:state]['on']).to be false
    end
  end

  describe '#set_brightness' do
    it 'sets brightness to the given value' do
      stubs.post('/json/state') do
        [200, { 'Content-Type' => 'application/json' }, { 'bri' => 200 }]
      end
      result = client.set_brightness(bri: 200)
      expect(result[:state]['bri']).to eq(200)
    end

    it 'accepts minimum brightness value' do
      stubs.post('/json/state') do
        [200, { 'Content-Type' => 'application/json' }, { 'bri' => 0 }]
      end
      result = client.set_brightness(bri: 0)
      expect(result[:state]).to be_a(Hash)
    end
  end

  describe '#set_color' do
    it 'sets an RGB color' do
      stubs.post('/json/state') do
        [200, { 'Content-Type' => 'application/json' }, { 'on' => true }]
      end
      result = client.set_color(red: 255, green: 0, blue: 0)
      expect(result[:state]).to be_a(Hash)
    end

    it 'sets a white color' do
      stubs.post('/json/state') do
        [200, { 'Content-Type' => 'application/json' }, { 'on' => true }]
      end
      result = client.set_color(red: 255, green: 255, blue: 255)
      expect(result[:state]).to be_a(Hash)
    end
  end
end

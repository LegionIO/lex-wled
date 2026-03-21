# frozen_string_literal: true

RSpec.describe Legion::Extensions::Wled::Client do
  subject(:client) { described_class.new(url: 'http://wled-light.local') }

  describe '#initialize' do
    it 'stores url in opts' do
      expect(client.opts[:url]).to eq('http://wled-light.local')
    end

    it 'uses default url when none provided' do
      c = described_class.new
      expect(c.opts[:url]).to eq('http://wled-light.local')
    end
  end

  describe '#settings' do
    it 'returns a hash with options key' do
      expect(client.settings).to eq({ options: client.opts })
    end
  end

  describe '#connection' do
    it 'returns a Faraday connection' do
      expect(client.connection).to be_a(Faraday::Connection)
    end
  end
end

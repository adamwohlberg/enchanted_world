require 'rails_helper'

describe 'YelpService' do
  subject { YelpService.new }
  describe '.build_url' do
    it 'generates url using options' do
      expect(subject.build_url('autocomplete', text: 'res'))
        .to eq('https://api.yelp.com/v3/autocomplete?text=res')
    end
  end

  describe '.base_url' do
    it 'returns yelp url' do
      expect(subject.base_url).to eq('https://api.yelp.com/v3/')
    end
  end

  describe '#get_businesses' do
    it 'calls yelp with autocomplete endpoint' do
      stub_request(:get, 'https://api.yelp.com/v3/search')
        .with(query: {
          'term' => 're',
          'sort_by' => 'sort_by',
          'latitude' => '40.0165447',
          'longitude' => '-105.281686',
          'open_now' => 'true',
          'limit' => 50
        })
        .to_return(:status => 200, :body => {'businesses'=> ['Random']}.to_json, :headers => {:content_type => 'application/json'})
      expect(subject.class.get_businesses('re', 'sort_by', 40.0165447, -105.281686, true, 50)).to eq(['Random'])
    end
  end

  describe '#get_categories' do
    it 'calls yelp with autocomplete endpoint' do
      stub_request(:get, 'https://api.yelp.com/v3/autocomplete')
        .with(query: {'text' => 're'})
        .to_return(:status => 200, :body => {'categories'=> [{'text': 'Restaurant'}]}.to_json, :headers => {:content_type => 'application/json'})
      expect(subject.class.get_categories('re')).to eq([{'text'=>'Restaurant'}])
    end
  end
end
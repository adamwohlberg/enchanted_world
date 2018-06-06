require 'rails_helper'
include Select2Helper

describe 'Settings page', js: true do
  before do
    allow(YelpService).to receive(:get_categories).and_return([{ 'title' => 'Restaurants'}])
    visit settings_path
  end
  context 'when visiting the settings page' do
    it 'updates search term using autocomplete' do
      select2_remote('Restaurants', from: '#setting_search_term')
      click_on 'Save'
      expect(Setting.last.search_term).to eq('Restaurants')
    end
  end
end

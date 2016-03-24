feature 'Add tags' do
  scenario 'add tag' do
    visit '/add_link'
    fill_in :title, with: 'Sky Sports'
    fill_in :url, with: 'www.skysports.com'
    fill_in :tags, with: 'sports,tv'
    click_button 'Add link'
    link = Link.last
    expect(link.tags.map(&:name)).to include 'sports', 'tv'
  end
end

feature 'adding links' do

  before do
    visit 'links/new'
    fill_in('url', with: 'http://google.com')
    fill_in('title', with: 'Google')
    fill_in('tags', with: 'education')
    click_button 'Add link'
  end

  scenario 'allows user to add a new link' do
    expect(current_path).to eq '/links'
    within 'ul#links' do
        expect(page).to have_content('Google')
      end
  end

  scenario 'tags can be added' do
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end
end

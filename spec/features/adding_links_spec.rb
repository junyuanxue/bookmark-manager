feature 'adding links' do

  before do
    visit 'links/new'
    fill_in('url', with: 'http://google.com')
    fill_in('title', with: 'Google')
    fill_in('tags', with: 'advertising')
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
    expect(link.tags.map(&:name)).to include('advertising')
  end

  scenario 'multiple tags can be added' do
    visit 'links/new'
    fill_in('url', with: 'http://makersacademy.com')
    fill_in('title', with: 'Makers Academy')
    fill_in('tags', with: 'education, coding')
    click_button 'Add link'
    link = Link.last
    expect(link.tags.map(&:name)).to include('education', 'coding')
  end
end

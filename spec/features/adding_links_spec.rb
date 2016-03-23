feature 'adding links' do
  scenario 'allows user to add a new link' do
    visit 'links/new'
    fill_in('url', with: 'http://google.com')
    fill_in('title', with: 'Google')
    click_button 'Add link'
    expect(current_path).to eq '/links'

    within 'ul#links' do
        expect(page).to have_content('Google')
      end
  end
end

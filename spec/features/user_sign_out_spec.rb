feature 'User sign out' do
  scenario 'User can sign out' do
    sign_up
    sign_in
    click_button 'Sign out'
    expect(page).to have_content 'Thanks for using Bookmark Manager'
    expect(page).not_to have_content 'Welcome Joe'
    expect(page.current_path).to eq '/links'
  end
end

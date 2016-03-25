feature 'Resetting password' do
  scenario 'User can see a link to reset password' do
    visit '/sissions/new'
    click_link 'Forgot password'
    expect(page).to have_content 'Please enter your email address'
  end
end

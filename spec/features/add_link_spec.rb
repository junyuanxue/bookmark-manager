require './app/models/link'

feature 'Adding links' do
  scenario 'it can create additional links' do
    visit "/add_link"
    fill_in(:title, with: "Add link test")
    fill_in(:url, with: "http://www.addlinks.com/")
    click_button("Add link")
    expect(page).to have_content("Add link")
    expect(page).to have_content("http://www.addlinks.com/")
  end
end

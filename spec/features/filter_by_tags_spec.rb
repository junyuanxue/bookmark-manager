feature 'Filter by tags' do
  scenario 'Should view url only for particular tag' do
    google = Link.create(title: 'Google', url: "www.google.com")
    tag = Tag.create(name: 'search')
    google.tags << tag
    google.save
    bing = Link.create(title: 'Bing', url: "www.bing.com")
    bing.tags << tag
    bing.save
    visit '/tags/search'
    expect(page).to have_content("Google")
    expect(page).to have_content("Bing")
  end
end

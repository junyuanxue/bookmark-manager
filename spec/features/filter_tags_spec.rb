feature 'filtering by tags' do
  before do
    twitter = Link.create(url: 'https://twitter.com/', title: 'Twitter')
    twitter.tags << Tag.first_or_create(name: 'social')
    twitter.save

    facebook = Link.create(url: 'https://www.facebook.com/', title: 'Facebook')
    facebook.tags << Tag.first_or_create(name: 'social')
    facebook.save
  end

  scenario 'search for links by tags' do
    visit '/tags/social'
    expect(page).to have_content 'Twitter'
    expect(page).to have_content 'Facebook'
  end
end

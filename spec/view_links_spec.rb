feature 'Viewing links' do
  scenario 'see existing links on the links page' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content('Makes Academy')
    end
  end
end

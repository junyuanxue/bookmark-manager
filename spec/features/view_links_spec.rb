require './app/models/link'

feature "View links" do
  before do
    Link.create(title: "Makers Academy", url: "http://www.makersacademy.com", tags: [Tag.first_or_create(name: "education")])
    Link.create(title: "Google", url: "http://www.google.com", tags: [Tag.first_or_create(name: "search")])
    Link.create(title: "Facebook", url: "https://www.facebook.com", tags: [Tag.first_or_create(name: "social_media")])
    Link.create(title: "Twitter", url: "http://twitter.com", tags: [Tag.first_or_create(name: "social_media")])
  end

  scenario "see a list of links on the links page" do
    visit "/links"
    within "ul#links" do
      expect(page).to have_content "Makers Academy"
    end
  end

  scenario "filter links by tag" do
    visit "/tags/social_media"
    within "ul#links" do
      expect(page).not_to have_content "Makers Academy"
      expect(page).not_to have_content "Google"
      expect(page).to have_content "Facebook"
      expect(page).to have_content "Twitter"
    end
  end
end

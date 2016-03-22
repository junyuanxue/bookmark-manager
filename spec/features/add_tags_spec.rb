feature "Add tags" do
  before do
    visit "/links/new"
    fill_in :title, with: "Makers Academy"
    fill_in :url, with: "http://www.makersacademy.com/"
  end

  scenario "user can add a single tag to a new link" do
    fill_in :tags, with: "education"
    click_button "Create link"
    link = Link.first
    expect(link.tags.map(&:name)).to include "education"
  end

  scenario "user can add multiple adds to a new link" do
    fill_in :tags, with: "education coding"
    click_button "Create link"
    link = Link.first
    expect(link.tags.map(&:name)).to include "education", "coding"
  end
end

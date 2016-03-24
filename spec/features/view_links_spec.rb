require './app/models/link'

feature "View links" do
  scenario "see a list of links on the links page" do
    Link.create(url: "http://www.viewlinksspec.com/", title: "View links")

    visit "/links"

    expect(page.status_code).to eq 200

    within "ul#links" do
      expect(page).to have_content("View links")
    end
    # Link.all.destroy

  end
end

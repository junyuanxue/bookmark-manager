feature "User sign up" do
  scenario "user can sign up with a name and email address" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, Mittens"
    expect(User.first.email).to eq "mittens@gmail.com"
  end
end

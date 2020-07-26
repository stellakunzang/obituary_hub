require "rails_helper"

describe "User Profile Page" do
  it "Displays user's obituaries and account information" do
    user = create(:user)
    obit1 = create(:obituary, user_id: user.id)
    obit2 = create(:obituary, user_id: user.id)
    obit4 = create(:obituary, user_id: user.id)
    obit4 = create(:obituary)

    visit '/'
    click_on "Login"
    expect(current_path).to eq("/login")

    fill_in :email, with: user.email
    fill_in :password, with: user.password
      
    find('#submit').click

    expect(current_path).to eq("/profile")
    expect(page).to have_content("You are now logged in as #{user.first_name}")
    expect(page).to have_content("First Name: Bob")
    expect(page).to have_content("Last Name: Bobby")
    expect(page).to have_content("Email:bobbobby@bobby.com")

    within(".my_obituaries") do 
        expect(page).to have_link("/obituaries/#{obit.id}")
        expect(page).to have_link("/obituaries/#{obit2.id}")
        expect(page).to have_link("/obituaries/#{obit3.id}")
        expect(page).to_not have_link("/obituaries/#{obit4.id}")
    end 
  end 
end 
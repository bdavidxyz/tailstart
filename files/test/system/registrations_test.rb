require "application_system_test_case"

class RegistrationsTest < ApplicationSystemTestCase
  test "signing up" do
    visit sign_up_url

    fill_in "Email", with: "lazaronixon@hey.com"
    fill_in "Password", with: "Secret6*4*2*"
    check "registration_terms"

    click_on "Create an account"
    assert_text "Welcome! You have signed up successfully"
  end
end

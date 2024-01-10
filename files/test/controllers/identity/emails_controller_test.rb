require "test_helper"

class Identity::EmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = sign_in_as(users(:lazaro_nixon))
  end

  test "should get edit" do
    get edit_account_email_path
    assert_response :success
  end

  test "should update email" do
    patch account_email_path, params: { email: "new_email@hey.com", password_challenge: "Secret1*3*5*" }
    assert_redirected_to root_url
  end


  test "should not update email with wrong password challenge" do
    patch account_email_path, params: { email: "new_email@hey.com", password_challenge: "SecretWrong1*3" }

    assert_response :unprocessable_entity
  end
end

class NewUserContract < Dry::Validation::Contract
  params do
    required(:email).filled(:string)
    required(:password).filled(:string)
    required(:terms).value(:integer)
  end

  rule(:email) do
    unless URI::MailTo::EMAIL_REGEXP.match?(value)
      key.failure("has invalid format")
    end
    if User.find_by(email: value)
      key.failure("email has been taken")
    end
  end

  rule(:terms) do
    key.failure("terms and condition must be accepted") if value < 1
  end

  rule(:password) do
    # test if a given string contains at least a lowercase letter, a uppercase, a digit, a special char and 8+ chars
    strong_regex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\W]).{12,}$/
    is_password_strong_enough = !!value[strong_regex]
    unless is_password_strong_enough
      key.failure("password is not strong enough")
    end
  end
end

module Mutations
  class Login < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(email:, password:)
      account = Account.find_by(email: email)
      if account&.authenticate(password)
        account.token = account.to_sgid(expires_in: 12.hours, for: 'graphql')
        account
      else
        raise GraphQL::ExecutionError.new("Invalid email or password")
      end
    end
  end
end

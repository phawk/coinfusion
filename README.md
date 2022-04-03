# Coinfusion

This is a fictional crypto exchange, designed purely to have a meaningful example of how registrations can work with Rails 7 and Turob.


## Creating the project

This project was generated using the following command:

```sh
rails new coinfusion --database=postgresql --skip-action-mailbox --skip-jbuilder --skip-test --javascript=importmap --css=tailwind
```

## Generating the Account model

```sh
rails g model Account account_type name company_number date_of_birth:date email password_digest
```

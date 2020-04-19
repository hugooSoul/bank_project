# Bank APP

> Ruby on Rails 5

## About
App to create clients with a bank account to perform witdraws and deposits transactions into the same account or theirs.

Those transaction are base in Ajax request to an endpoint.

* Ruby version
    '2.6.3'

* Configuration
```
 $ git clone https://github.com/hugooSoul/bank-project
 $ cd bank-project
 $ bundle install
 $ rails s
 ```

* Add Client
Into the App there's a form to create a new client or can be created in the console

```
 $ rails console
 $ Client.create!(first_name: "Hugo", last_name: "Mandujano", client_number: "0000001") 
 $ client = Client.last
 $ exit
 ```

* Add Bank Account
Into the app there's a form to create bank accounts, but needs to be a Client first.

or you can create it in the console like:

```
 $ rails console
 $ BankAccount.create!(client: client, account_number: "000000001")
 $ exit
 ```

* Database creation
`rails db:migrate`

## Missing
    * Style
    * Use a Front Framework like React 
    * A client can't make transactions to other accounts, just theirs.
    * Use Devise or a similar Gem to make a Admin secction 
    * Deploy to a server


## Deployment instructions


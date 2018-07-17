# Instructions
1. First you need to clone this repo into the terminal
2. Go into irb,  type `require './account.rb'` to access the files. Do the same for `statement.rb` and `printer.rb`.
3. Create new account, statement (passing in the account) and printer e.g. `account = Account.new` 
4. Add a transaction - e.g. `account.deposit(5)`
5. Create a statement of your transactions - e.g. `statement.transaction_list`
6. Print a statement using the printer (passing in the statement.previous_transactions) - e.g. `printer.print_statement(statement.previous_transactions)`

## User stories:
```
As a user 
So that I can put money in my account,
I can make a deposit
```

```
As a user 
So that I can use money from my account,
I can make a withdrawal.
```

```
As a user
So that I can create a nice ordered list of the transactions I've made
I can create a statement.
```

```
As a user
So that I can see the transactions ordered on a page
I can print a statement of my transactions.
```

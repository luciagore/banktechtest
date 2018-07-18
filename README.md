# Instructions
1. First you need to clone this repo into the terminal and run `bundle install` to make sure all dependencies are installed.
2. Go into irb,  type `require './account.rb'` to access the files. Do the same for `statement.rb` and `printer.rb`.
3. Create a new account - e.g. `account = Account.new`
4. Add a transaction - e.g. `account.deposit(5)`
5. Create a new statement (making sure to pass in the account you've created) - e.g. `statement = Statement.new(account)`
6. Print a statement of your transactions - e.g. `statement.print_statement`

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
I tried to work through the User Stories as simply as possible - I planned out my design to include an account that would handle the transactions (withdrawing and depositing money) which can be seen in an array of transactions and which affect the account's balance. This covered the first two User Stories.

I then decided that although I could create a method in the Account Class to reorder and format the list of transactions - this would upset the Single Responsibility Principle and so I instead created a Statement Class to take the list of transactions - put them in reverse chronological order and add some formatting.

To implement the final User Story I created a Printer Class which takes the reordered transaction list - and puts it to the console, after having first given the title row provided to us of `"date || credit || debit || balance\n"`.

## Refactoring

To begin with you had to access the printer in order to print the statement, which was not a very good user experience - to fix this I created a `print_statement` method within the Statement class, which accesses the Printer class. This makes it much easier to use!

Other things I refactored were to create a class that dealt with the Date - so that the Account did not need to figure this out itself.  I've also added features tests for each user instance.

## Example of irb User Experience

```
➜  bank git:(master) ✗ irb
2.5.0 :001 > require './lib/account.rb'
 => true
2.5.0 :002 > require './lib/statement.rb'
 => true
2.5.0 :003 > account = Account.new
 => #<Account:0x00007f7f280822e0 @balance=0, @transactions=[]>
2.5.0 :004 > statement = Statement.new(account)
 => #<Statement:0x00007f7f28079cd0 @account=#<Account:0x00007f7f280822e0 @balance=0, @transactions=[]>, @printer=#<Printer:0x00007f7f28079ca8>, @previous_transactions=[]>
2.5.0 :005 > account.deposit(1)
 => [{:date=>"18-07-2018", :credit=>"1.00", :debit=>nil, :balance=>"1.00"}]
2.5.0 :006 > account.deposit(100)
 => [{:date=>"18-07-2018", :credit=>"1.00", :debit=>nil, :balance=>"1.00"}, {:date=>"18-07-2018", :credit=>"100.00", :debit=>nil, :balance=>"101.00"}]
2.5.0 :007 > account.withdraw(3)
 => [{:date=>"18-07-2018", :credit=>"1.00", :debit=>nil, :balance=>"1.00"}, {:date=>"18-07-2018", :credit=>"100.00", :debit=>nil, :balance=>"101.00"}, {:date=>"18-07-2018", :credit=>nil, :debit=>"3.00", :balance=>"98.00"}]
2.5.0 :008 > statement.print_statement
date || credit || debit || balance
18-07-2018 ||  || 3.00 || 98.00
18-07-2018 || 100.00 ||  || 101.00
18-07-2018 || 1.00 ||  || 1.00
 => ["18-07-2018 ||  || 3.00 || 98.00", "18-07-2018 || 100.00 ||  || 101.00", "18-07-2018 || 1.00 ||  || 1.00"]
2.5.0 :009 > exit
```

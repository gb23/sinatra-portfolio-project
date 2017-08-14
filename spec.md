# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
        Sinatra is used to build this app.
- [x] Use ActiveRecord for storing information in a database
         ActiveRecord is used for storing information.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
        Model Classes: Fridge, Item, UserFridge, User
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
        A User has_many fridges, Fridge has_many items, User has_many items
- [x] Include user accounts
        Users need to sign in to view their fridges and items within.
- [x] Ensure that users can't modify content created by other users
        Users only have access to fridges of their own account or an account that they personally linked.
- [x] Include user input validations
        User must have username, User must have password, Fridge must have name, Item must have name.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
        Improper user input results in failure.erb rendered in browser
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
        See README.md for these requirements.

Confirm
- [x] You have a large number of small Git commits
        See github for 50+ commits
- [x] Your commit messages are meaningful
        See github for 50+ commits
- [x] You made the changes in a commit that relate to the commit message
        See github for 50+ commits
- [x] You don't include changes in a commit that aren't related to the commit message
        See github for 50+ commits

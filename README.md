# RailsAssessmentApp

This is a forum application with simple authentication and user privileges. It allows for the creation of boards, topics (under boards), and posts (under topics). The user can save topics and see their post history. All interactions are externally anonymous, though a user needs an account to post.

Permissions are simple:
  -users can create boards
  -users can create topics
  -users can create posts
  -users can edit any topics or posts on boards they own
  -users can edit or delete anything they created themselves

User authentication is internally done with Devise. There is also the option to signin with Github, using the Omniauth gem. For your own application replace the Github Secret and Github ID keys in `config/initializers/omniauth.rb`

Styling is done primarily with Skeleton. Greentext makes use of code by Jason Lam, https://github.com/tesu/greentextify/blob/master/greentext.js . 

# Use
To run the application clone this repository, navigate to the parent directory and run

  rails s

The flow of the application is self-explanatory from there and all content, except on the about and news pages, are creatable/editable by users.

# License
This is licensed under GPL 3 any forms of non-compliance are bugs.

Github's recommended name for this repo was crispy-disco


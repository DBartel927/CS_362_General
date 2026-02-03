# Get These Tests Working

We have a problem. We need to test our code, but it depends on the
production database. And we can't connect to the production database
from the test servers.

1. Try running the tests: `ruby tc_notebook.rb`
2. Examine the code.
3. Note that we cannot modify the `database.rb` file.
4. Get the tests to pass.

Run the tests (which use the built-in Ruby unit testing framework) first
thing so you can see what's going wrong:

```
ruby tc_notebook.rb
```

Make changes to get the tests to pass quickly. You should be minimally
invasive, that is, change the existing code as little as possible.
Additional code has to be written for this challenge, but the existing
code only needs to change in a few lines.


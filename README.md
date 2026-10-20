<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/sarmstead/inventlorry/blob/main/README-logo--dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/sarmstead/inventlorry/blob/main/README-logo--light.svg">
  <img alt="Inventlorry navy logo" src="https://github.com/sarmstead/inventlorry/blob/main/README-logo--light.svg">
</picture>

# Inventlorry

You ever seen an Amazon truck from another state and wonder how they keep track of all of them? Well, I don't know the answer to that, but I ([@sarmstead](https://github.com/sarmstead)) *do* know how *I* would keep track of my company vehicles. Introducing, **Inventlorry**: an inventory for all your lorries!

## Quick start
Set up the repo locally (install Gems, create the SQLite database, etc.):
```bash
bin/setup
```

Fire up a Rails server:
```bash
bin/dev
```

Head over to [http://localhost:3000](http://localhost:3000) and start poking around!

## Testing
Look, tests are great. So add them!

This repo uses [Minitest](https://minite.st/docs/) for Rails, so make sure you follow the coventions in the docs.

To run our tests:
```bash
# Run the whole suite
bin/rails test

# Run a specific file
bin/rails test some/file/path_spec.rb

# Run a specific test block on line 123
bin/rails test some/file/path_spec.rb:123
```
## Nitty gritty
Inventlorry is a Rails app on SQLite3. What, you wanted more?! Check out the source code!

## Assignment: Recipe Finder

The overall goal of this assignment is to implement a Rails application using model,
view, and controller classes with their test cases.

  * the model class will access information
  * the view class will display information and accept commands from the user
  * the controller class will implement actions through internal service logic
    and the delegation to model and view classes.

The functional goal is to provide web page access to recipe information
served by `http://food2fork.com/api` through JSON and images. Documentation for the 
API can be found at http://food2fork.com/about/api.

### Functional Requirements

You are tasked with creating a Rails app that will display a recipe
index page based on a search keyword entered.  

  * the user will supply a keyword to search for 
  * the Rails app will pass that query to `http://food2fork.com/api` and accept the
    results
  * the Rails app will build a web page display of the results and accept the next keyword
    search
  * the web page displayed will provide HTML links to more detailed recipe information
    from other web sites.

### Getting Started

1. Create a new Rails application using the `rails` command called `recipefinder`.

2. Download and extract the starter set of boostrap files into the recipefinder directory.

    * replace the generated Gemfile with the Gemfile from the bootstrap fileset
    * run the `bundle` command to resolve new gems 

    ```shell
    |-- Gemfile
    |-- README.md
    |-- .rspec (important hidden file)
    `-- spec
        |-- recipes_app_spec.rb
        `-- spec_helper.rb
    ```

3. Install the following gems used by the rspec unit tests. The last gem is used for headless 
web page testing.

    ```shell
    $ gem install rspec
    $ gem install rspec-its
    $ gem install capybara
    $ gem install poltergeist
    ```

4. Make sure phantomJS is installed and in your bin PATH on your system
($ phantomjs --version). This binary is used by the `poltergeist`
gem to implement a headless unit test for the Web interface (bonus points: use selenium, if you can).  You can
interact with your Rails app directly using a browser without this
library. It is only needed by the rspec tests to provide you feedback
for example criteria the grader will be looking for later when submitted. In case you need more 
information, the download URLs are below.

    * phantomjs downloads: http://phantomjs.org/download.html
    * bitbucket: https://bitbucket.org/ariya/phantomjs/downloads

5. The included rspec tests are for Acceptance Testing, therefore run them to receive feedback. They must be run from their location at the 
root of your rails application. All acceptance tests will (obviously) fail until you complete the specified solution.

    ```shell
    Finished in 1.69 seconds (files took 0.41211 seconds to load)
    8 examples, 8 failures

    Failed examples:

    rspec ./spec/recipes_app_spec.rb:6 # Recipes App displays 
        'Kahlúa-Spiked' when request parameter 'search' is mocha
    rspec ./spec/recipes_app_spec.rb:11 # Recipes App utilizes 
        the FOOD2FORK_SERVER_AND_PORT environment variable
    rspec ./spec/recipes_app_spec.rb:16 # Recipes App utilizes 
        the FOOD2FORK_KEY environment variable
    rspec ./spec/recipes_app_spec.rb:24 # Recipes App visit root 
        displays chocolate (default)
    rspec ./spec/recipes_app_spec.rb:28 # Recipes App visit root 
        displays 'Powered By Food2Fork.com'
    rspec ./spec/recipes_app_spec.rb:32 # Recipes App visit root 
        displays table element that has a row with 3 columns
    rspec ./spec/recipes_app_spec.rb:36 # Recipes App visit root 
        column 1 should have the thumbnail inside img tag inside a link tag
    rspec ./spec/recipes_app_spec.rb:40 # Recipes App visit root 
        title should be inside a second column inside a link tagink tag
    ```

6. Implement your Rails app solution and use the rspec acceptance tests to help 
verify your completed Rails app solution.

7. Write test cases for new code you implement in addition to the acceptance tests.

8. Submit your Rails app solution for evaluation.

### Technical Requirements

1. Create a new Rails app using the Gemfile provided in the boostrap files (note: use 4.2.8)

2. Generate a controller that uses the `search` term as the keyword if supplied, and 
use a default value of `chocolate` if not supplied

3. Create a model that will query the Food2Fork API (`http://food2fork.com/api`) for a result. 

4. Foods2Fork requires attribution when using their API. Place the following somewhere 
in your application layout file (`application.html.erb`) to be displayed alongside the recipes.

    ```
    <p>Powered By Food2Fork.com</p>
    ```

5. Create your view that lists each recipe with links in the image and title that go
straight to the actual recipe (sanitize recipe titles displayed)

6. Make sure you are able to go to `http://localhost:3000/?search=apple%20pie` see your
results.

### Acceptance Test

Some unit tests have been provided in the bootstrap files. They can be run from any location
but be sure to copy the hidden `.rspec` file if you move them. 

```shell
$ rspec 
...
Recipes App
  displays 'Kahlúa-Spiked' when request parameter 'search' is mocha
  utilizes the FOOD2FORK_SERVER_AND_PORT environment variable
  utilizes the FOOD2FORK_KEY environment variable
  visit root
    displays chocolate (default)
    displays 'Powered By Food2Fork.com'
    displays table element that has a row with 3 columns
    column 1 should have the thumbnail inside img tag inside a link tag
    title should be inside a second column inside a link tag

Finished in 2.73 seconds (files took 0.54954 seconds to load)
8 examples, 0 failures
```

The tests assume your server is running on localhost:3000. Please adjust
the source code in `recipes_app_spec.rb` if that is not the case with 
your development environment.

  ```ruby
  Capybara.app_host = "http://localhost:3000"
  ```
In addition to the provided acceptance tests, you are required to write additional test cases.


### Submission

Submit an archive file with your solution root directory as the top-level.

```text
|-- app
|   |-- assets
|   |-- controllers
|   |-- helpers
|   |-- mailers
|   |-- models
|   `-- views
|-- bin
|-- config
|-- config.ru
|-- db
|-- Gemfile
|-- Gemfile.lock
|-- lib
|-- log
|-- public
|-- Rakefile
|-- README.rdoc
|-- test
`-- vendor
```

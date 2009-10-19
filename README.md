Mustache Rails
=========

An attempt to integrate the awesome Mustache template builder by Chris Wanstrath (aka @defunkt) into Rails.

Unfortunately, integration is a work in progress since Rails is quite a large and complicated beast.

Because Mustache forces you to keep all logic out of your template code, it actually changes the paradigm a little. Previously Rails Helpers were a place to put code that didn't quite fit into your view templates exactly, but now, if you have to move _all_ code out of your templates, you will actually find that you require greater code seperation. The current solution is to create sub-modules on the Helpers for each action, as shown below.

Example Usage:
------

app/controllers/pages_controller.rb

    class PagesController < ApplicationController
      def index
        @number = 15
      end
    end
    
app/helpers/pages_helper.rb

    module PagesHelper
      def page_title
        "%s | Generic Page Title" % page_sub_title
      end
  
      module Index
        def page_sub_title
          "Index Page Title"
        end
        
        def do_calculation
          @number + 1
        end
      end
    end

app/views/layouts/application.html.mustache

    <html>
      <head>
        <title>{{page_title}}</title>
      </head>
      {{{yield}}}
    </html>

app/views/pages/index.html.mustache

    {{number}} + 1 = {{do_calculation}}


There is an example application available in the 'spec/mock_app' directory.

Testing:
-------

You can `rake spec` to run the tests.

Requires the mustache gem to be installed.

Known Issues:
--------

- form_for and other helpers are designed to be called within an erb template and therefore need a bit more work. Basic stuff like the calculations above definitely works though. For more information see [this post by Yahuda Katz](http://yehudakatz.com/2009/08/31/simplifying-rails-block-helpers-with-a-side-of-rubinius/).
- content_for is not working, but the cascading nature of the Helpers means that this is not really an issue. It would be nice to get these working though since they are widely used rails methods.
- rails incorrectly reports line numbers for errors in templates.




app/helpers/pages_helper.rb

    module PagesHelper
      def show_title
        "Generic Page Title"
      end
  
      module Index
        def show_title
          "Index Page Title"
        end
        
        def do_calculation
          @number + 1
        end
      end
    end

app/controllers/pages_controller.rb

    class PagesController < ApplicationController
      allow_instance_variables :only => [:index]
      
      def index
        @number = 15
      end
      
    end
    
    
app/views/pages/index.html.mustache

    <html>
      <head>
        <title>{{show_title}}</title>
      </head>
      {{number}} + 1 = {{do_calculation}}
    </html>


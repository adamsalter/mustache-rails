require "mustache"

require 'mustache/rails/helper'
require 'action_view/template_handlers/mustache'

ActionView::Template.register_template_handler(:mustache, ActionView::TemplateHandlers::Mustache)

# ActiveSupport::Dependencies.load_paths << Rails.root.join("app", "views")

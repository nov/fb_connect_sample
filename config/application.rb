require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module FbConnect
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)
    config.title = 'FB Connect Sample'
    config.repository = 'https://github.com/nov/fb_graph_sample'
  end
end

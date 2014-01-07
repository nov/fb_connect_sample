class TopController < ApplicationController
  before_filter :require_anonymous_access

  def show
  end
end

class FacebooksController < ApplicationController
  before_filter :require_anonymous_access

  def show
    redirect_to client.authorization_uri
  end

  def callback
    client.authorization_code = params[:code]
    fb_token = client.access_token! :body
    fb_profile = FbGraph::User.me(fb_token).fetch(
      fields: [:id, :name, :username]
    )

    current_account = Account.where(
      fb_uid: fb_profile.identifier
    ).first_or_create
    authenticate current_account

    redirect_to dashboard_url
  end

  private

  def client
    @client ||= Rack::OAuth2::Client.new(
      identifier:             '130982493738728',
      secret:                 'ba04b7cd41dc814c83b4ae568c0c8e74',
      authorization_endpoint: 'https://www.facebook.com/dialog/oauth',
      token_endpoint:         'https://graph.facebook.com/oauth/access_token',
      redirect_uri:           callback_facebook_url
    )
  end
end

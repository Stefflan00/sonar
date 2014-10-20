class AnalyticsController < ApplicationController
require 'date'
require 'google/api_client'
respond_to :json

  def visitors

    # set up a client instance
    client  = ::Google::APIClient.new
    client.authorization = Signet::OAuth2::Client.new(
        :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
        :audience             => 'https://accounts.google.com/o/oauth2/token',
        :scope                => 'https://www.googleapis.com/auth/analytics.readonly',
        :issuer               => SERVICE_ACCOUNT_EMAIL_ADDRESS,
        :signing_key          => Google::APIClient::KeyUtils.load_from_pkcs12(PATH_TO_KEY_FILE, 'notasecret')
    ).tap { |auth| auth.fetch_access_token! }

    api_method = client.discovered_api('analytics','v3').data.ga.get

    # make queries
    result = client.execute(:api_method => api_method, :parameters => {
        'ids'        => PROFILE,
        'start-date' => "28daysAgo",
        'end-date'   => "today",
        'dimensions' => 'ga:week',
        'metrics'    => 'ga:users'
    })

    respond_with result.data.rows
  end
end

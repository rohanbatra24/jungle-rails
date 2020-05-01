module HttpAuthConcern  

  Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRIPE_SECRET_KEY']
}


  extend ActiveSupport::Concern
  included do
      before_action :http_authenticate
  end
  def http_authenticate
    puts ENV['USERNAME']
      # return true unless Rails.env == 'production'
      authenticate_or_request_with_http_basic do |username, password|
          username == ENV['USERNAME'] && password == ENV['PASSWORD']
        
      end
  end
end
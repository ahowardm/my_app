if Rails.env.production?
  Rails.configuration.stripe = {
    # :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    # :secret_key => ENV['STRIPE_SECRET_KEY']
    :publishable_key => 'pk_test_Y6HEaficlNtFiQIsfuhWCfzo',
    :secret_key => 'sk_test_Ent7lH7t69nu51fH5WZQUEWp'
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_Y6HEaficlNtFiQIsfuhWCfzo',
    :secret_key => 'sk_test_Ent7lH7t69nu51fH5WZQUEWp'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'sk_test_2FmhZIvDhg8CW3xgdZ2nz7Ns',
    :secret_key => 'pk_test_lefPTehyBejLZ5eXRUmmXznn'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

unless Rails.env.production?
  ENV['SENDGRID_USERNAME'] = 'app20284816@heroku.com'
  ENV['SENDGRID_PASSWORD'] = 'es90h9a9'
end


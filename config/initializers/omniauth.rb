Rails.application.config.middleware.use OmniAuth::Builder do
    # provider :github, '9e5ec8ba55042f5dfa57', 'e3951b289465253674b2cd5c3496dd2e97fb0aac', scope: 'user:email'
    provider :github, '9e5ec8ba55042f5dfa57', 'e3951b289465253674b2cd5c3496dd2e97fb0aac'

end

class User < ActiveResource::Base
  self.site = ENV["AR_SITE_USER"]
  self.user = ENV["AR_USER_LOGIN"]
  self.password = ENV["AR_USER_PASSWORD"]
end
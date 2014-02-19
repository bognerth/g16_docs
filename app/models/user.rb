class User < ActiveResource::Base
  self.site = "http://#{ENV["AR_SERVER"]}"
end
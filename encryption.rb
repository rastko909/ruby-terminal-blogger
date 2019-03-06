require 'digest'
require 'digest/bubblebabble'
require 'base64'
require 'pry'

def encrypt(string)
	Digest::SHA2.hexdigest(string)
end
def babble_this_bubble(string)
	Digest::SHA1.bubblebabble(string)
end
def secret_secret(string)
    Base64.encode64(string)
end

def decode(encrypted_password)
    Base64.decode64(encrypted_password)
end    
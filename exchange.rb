class User
  attr_accessor :dh, :name
  def initialize(name, dh)
    @dh = dh
    @name = name
  end
end

require 'openssl'

# Боб создает свой ключ
bob_pem = "-----BEGIN DH PARAMETERS-----\nMIIBCAKCAQEA3u41O8BFqi2S7BNrZFrq+HSR3IaMsyilKpY8QvlJ6CBV3oDYQVmk\n5s2Ny3CapOOSDbdc7arawom5kiM/6VOCt0xpPJunsPN5Kx1Ir/MzGPaJRk4hSX4B\na/JbWbvZY41zVw/9Jwn6s8Y+QdB5pPDwKWuowEPZfjQSowHN0wDTF+bYXL/BJegi\n7rJ58BbcnaKEPF5DmbWMkKi8YxrT996YHhKmp2GVRYHuUZ7vxRTl0eMy0QQC2uOh\n2Vp7xoFi5239UKemwHoX6PlQoKf6BhxyL/UkMU/vEh0U4YJnAEswzq7Pk4wSnCtq\njIpZHujaxH3iSa7vaD3BnXdk5HIeKMfrgwIBAg==\n-----END DH PARAMETERS-----\n"
bob = User.new('Bob', OpenSSL::PKey::DH.new(bob_pem) )
# bob = User.new('Bob', OpenSSL::PKey::DH.new(OpenSSL::PKey::DH.new(2048)) )

# Элис создает свой ключ
alice_pem = "-----BEGIN DH PARAMETERS-----\nMIIBCAKCAQEAtU2sl9T7jbLGFsoLsqZ/SR5DGHrnzEKqjc490ZnWHyaE+/CJUvSb\ndZPMmKan0BM+wZ4gFvVCS67QttsHLYPrtIyjX6OZt6L4O6qkSQrrOn3iMArA0sL8\nxmBGa0Mvuf90xAsw8ZbrSHk58Ehg4VuwoFnCGxpjMqfTbhVW0GQm0FYazefVwT4p\nNZlZvx6cAvq/VBvzKHHgUisi1XNDezLQnNzgOTO/bWxcXC+28WqKRzI5v/jLz7er\nSQHzbjDgZQW+l/moVGR3n9LdkkmGOAW4sRgzLGmeE7ectclZ16kSnf/j4jTNSBnL\n0RcfRQ5V+ZA9K/hPYhy9teel71bm8363UwIBAg==\n-----END DH PARAMETERS-----\n";
alice = User.new('Bob', OpenSSL::PKey::DH.new(alice_pem) )
# alice = User.new('Bob', OpenSSL::PKey::DH.new(OpenSSL::PKey::DH.new(2048)) )

puts bob.dh.p
puts bob.dh.g
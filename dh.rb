require 'openssl'

puts 'here 1'

dh1 = OpenSSL::PKey::DH.new(2048)

puts 'here 1/2'

der = dh1.public_key.to_der #you may send this publicly to the participating party

puts 'here 2'

dh2 = OpenSSL::PKey::DH.new(der)
dh2.generate_key! #generate the per-session key pair

puts 'here 3'

symm_key1 = dh1.compute_key(dh2.pub_key)

puts 'here 4'

symm_key2 = dh2.compute_key(dh1.pub_key)

puts 'here 5'

puts symm_key1 == symm_key2 # => true


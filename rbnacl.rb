# https://github.com/cryptosphere/rbnacl/wiki/Public-Key-Encryption

require 'rbnacl'

class User
  attr_accessor :pk, :name
  def initialize(name)
    @pk = RbNaCl::PrivateKey.generate
    @name = name
  end
end

bob = User.new('Bob')
alice = User.new('Alice')

alice_box = RbNaCl::Box.new(bob.pk.public_key, alice.pk)
bob_box = RbNaCl::Box.new(alice.pk.public_key, bob.pk)

# Crypt
alice_nonce = RbNaCl::Random.random_bytes(alice_box.nonce_bytes)
alice_message = 'Sell APPL now!!!!!11'
alice_ciphertext = alice_box.encrypt(alice_nonce, alice_message)
transfer_data = {nonce: alice_nonce, message: alice_ciphertext}

# Decrypt
bob_nonce = transfer_data[:nonce]
bob_ciphertext = transfer_data[:message]
bob_message = bob_box.decrypt(bob_nonce, bob_ciphertext)

puts bob_message


from Crypto.Cipher import AES
obj = AES.new('This is a key123', AES.MODE_CBC, 'This is an IV456')
message = "The answer is no"
ciphertext = obj.encrypt(message)
print(ciphertext)
obj2 = AES.new('This is a key123', AES.MODE_CBC, 'This is an IV456')
decrypte = obj2.decrypt(ciphertext)
print(decrypte)

"""
from Crypto.Hash import MD5
h = MD5.new()
h.update(b'Hello')
print(h.hexdigest())
"""


from Crypto.Hash import SHA256
hash = SHA256.new()
hash.update(b'message')
hashed = hash.digest()
print(hashed)
<h1>Enigma Project BE 2207</h1>

<h4>Submitted by Ken Lenhart</h4>

#
<h3><strong>Functionality</strong></h3>

**Meets Expectations** - I was able to implement the Enigma Class with working encrypt and decrypt methods that perform according to the provided interaction pattern. Encrypt and Decrypt runner files work as expected with command line interface. 
#
<h3><strong>Object Oriented Programming</strong></h3>

**Meets Expectations** - I broke my project into 3 Classes and 2 helper modules. Each Class is between 30 and 35 lines of code. The helper modules are between 15 and 20 lines of code. 

Enigma Class instantiates Encryptor and Decryptor Classes and is soley responsible for interacting with the Encrypt and Decrypt runner files. Engima includes the Enigmable helper module that contains helper methods used only Enigma.

Encryptor Class is instantiated by Enigma and is soley responsible for containing the functionality for the Enigma Class *#encrypt* method. Encryptor includes the Encryptable helper module that contains helper methods for functionality. Encryptor only "talks" to the Enigma Class and the Encryptable helper module.

like Encryptor, Decryptor Class is instantiated by Enigma and is solely responsible for containing the functionality for the Enigma Class *#decrypt* method. Decryptor also includes the Encryptable helper module that contains helper methods it also uses for functionality. Decryptor only "talks" to the Enigma Class and the Encryptable helper module.

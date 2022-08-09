<h1>Enigma Project BE 2207</h1>

<h4>Submitted by Ken Lenhart</h4>

#
<h3><strong>Functionality</strong></h3>

**Meets Expectations** - I was able to implement the Enigma Class with working encrypt and decrypt methods that perform according to the provided interaction pattern. Encrypt and Decrypt runner files work as expected with command line interface. 
#
<h3><strong>Object Oriented Programming</strong></h3>

**Meets Expectations <--> Above Expectations** - I broke my project into 3 Classes and 2 helper modules. Each Class is between 30 and 35 lines of code. The helper modules are between 15 and 20 lines of code. 

Enigma Class instantiates Encryptor and Decryptor Classes and is solely responsible for interacting with the Encrypt and Decrypt runner files. Engima includes the Enigmable helper module that contains helper methods used only Enigma.

Encryptor Class is instantiated by Enigma and is solely responsible for containing the functionality for the Enigma Class *#encrypt* method. Encryptor includes the Encryptable helper module that contains helper methods for functionality. Encryptor only "talks" to the Enigma Class and the Encryptable helper module.

like Encryptor, Decryptor Class is instantiated by Enigma and is solely responsible for containing the functionality for the Enigma Class *#decrypt* method. Decryptor also includes the Encryptable helper module that contains helper methods it also uses for functionality. Decryptor only "talks" to the Enigma Class and the Encryptable helper module.

I chose to use modules for the Engima and Encryptor/Decryptor Classes because while my design choice was going to need to share behavior in the form of helper methods between Classes, my design was not going to need to share both behavior and state as provided by inheritance. If I were to start this program over, I might try an approach in which Encryptor and Decryptor are child classes of Enigma and have access to helper methods contained within Enigma as well as state in the form of the key and date information. 
#
<h3><strong>Ruby Conventions and Mechanics</strong></h3>

**Meets Expectations <--> Below Expectations** - My project is mostly properly indented and spaced and I feel that file, class, and module names follow convention. 

Hashes were implemented in the Encryptor and Decryptor Classes. 

I could have made better use of enumerables that would have reduced the amount of code needed in the decrypt/encrypt methods. I also feel that an enumerable could have been used to reduce the size and repetition in the *#offset_generator* method contained in the Encryptable helper module. 
#
<h3><strong>Test Driven Development</strong></h3>

**Meets Expectations <--> Above Expectations** - I have 93 commits and 15 pull requests. 

Most of my pull requests contain related work but some are general "clean up" passes that could have been done differently in a way that better follows good version control convention. 

While I tried to keep my commits focused to specific pieces of functionality, there are several that include bits and pieces from across Classes/Modules, especially as I got into the refactoring phase.
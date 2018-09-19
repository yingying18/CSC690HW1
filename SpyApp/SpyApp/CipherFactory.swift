import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceaser": CeaserCipher()
    ]
    
    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
    
    private var otherciphers: [String: otherCipher] = [
        "Alphanumeric": AlphanumericCeaserCipher()
    ]
    
    func othercipher(for key: String) -> otherCipher {
        return otherciphers[key]!
    }
    
    private var thirdciphers: [String: thirdCipher] = [
        "Reverse": ReverseCeaserCipher()
    ]
    
    func thirdcipher(for key: String) -> thirdCipher {
        return thirdciphers[key]!
    }
    
    private var fourthciphers: [String: fourthCipher] = [
        "Multiply": MultipleCeaserCipher()
    ]
    
    func fourthcipher(for key: String) -> fourthCipher {
        return fourthciphers[key]!
    }
}

import Foundation

protocol otherCipher {
    func encode(_ plaintext: String, secret: String) -> String
    func decode(_ plaintext: String, secret: String) -> String
}

struct AlphanumericCeaserCipher: otherCipher {
    func encode(_ plaintext: String, secret: String) -> String {
        var encoded = ""
        var newSecret = ""
        var shiftBy:UInt32 = 0
        
        if secret.range(of: "-") != nil {
            newSecret = secret.replacingOccurrences(of: "-", with: "")
            shiftBy = UInt32(newSecret)!
            for character in plaintext {
                let unicode = character.unicodeScalars.first!.value
                let shiftedUnicode = unicode - shiftBy
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
        } else {
            shiftBy = UInt32(secret)!
            for character in plaintext {
                let unicode = character.unicodeScalars.first!.value
                let shiftedUnicode = unicode + shiftBy
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
        }
        
        return encoded.uppercased()
    }
    
    func decode(_ plaintext: String, secret: String) -> String {
        var decoded = ""
        var newSecret = ""
        var shiftBy:UInt32 = 0
        
        if secret.range(of: "-") != nil {
            newSecret = secret.replacingOccurrences(of: "-", with: "")
            shiftBy = UInt32(newSecret)!
            for character in plaintext {
                let unicode = character.unicodeScalars.first!.value
                let shiftedUnicode = unicode + shiftBy
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                decoded = decoded + shiftedCharacter
            }
        } else {
            shiftBy = UInt32(secret)!
            for character in plaintext {
                let unicode = character.unicodeScalars.first!.value
                let shiftedUnicode = unicode - shiftBy
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                decoded = decoded + shiftedCharacter
            }
        }
        
        return decoded.uppercased()
    }
}

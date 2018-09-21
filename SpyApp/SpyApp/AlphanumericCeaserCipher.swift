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
                var tempUnicode = unicode
                if unicode > 96 && unicode < 123 {
                    tempUnicode = unicode - 32
                }
                if tempUnicode-shiftBy < 65 || tempUnicode-shiftBy < 48 {
                    var oneShift = shiftBy
                    while oneShift > 0 {
                        if tempUnicode-1 < 48 {
                            tempUnicode += 42
                            oneShift -= 1
                        } else if tempUnicode-1 < 65 && tempUnicode > 57 {
                            tempUnicode -= 8
                            oneShift -= 1
                        } else {
                            tempUnicode -= 1
                            oneShift -= 1
                        }
                    }
                }else {
                    tempUnicode -= shiftBy
                }
                let shiftedUnicode = tempUnicode
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
        } else {
            shiftBy = UInt32(secret)!
            for character in plaintext {
                let unicode = character.unicodeScalars.first!.value
                var tempUnicode = unicode
                if unicode > 96 && unicode < 123 {
                    tempUnicode = unicode - 32
                }
                if tempUnicode+shiftBy > 90 || tempUnicode+shiftBy > 57 {
                    var oneShift = shiftBy
                    while oneShift > 0 {
                        if tempUnicode+1 > 57 && tempUnicode+1 < 65 {
                            tempUnicode += 8
                            oneShift -= 1
                        } else if tempUnicode+1 > 90 {
                            tempUnicode -= 42
                            oneShift -= 1
                        } else {
                            tempUnicode += 1
                            oneShift -= 1
                        }
                    }
                }else {
                    tempUnicode += shiftBy
                }
                let shiftedUnicode = tempUnicode
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
        }
        
        return encoded
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
                var tempUnicode = unicode
                if unicode > 96 && unicode < 123 {
                    tempUnicode = unicode - 32
                }
                if tempUnicode+shiftBy > 90 || tempUnicode+shiftBy > 57 {
                    var oneShift = shiftBy
                    while oneShift > 0 {
                        if tempUnicode+1 > 57 && tempUnicode+1 < 65 {
                            tempUnicode += 8
                            oneShift -= 1
                        } else if tempUnicode+1 > 90 {
                            tempUnicode -= 42
                            oneShift -= 1
                        } else {
                            tempUnicode += 1
                            oneShift -= 1
                        }
                    }
                }else {
                    tempUnicode += shiftBy
                }
                let shiftedUnicode = tempUnicode
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                decoded = decoded + shiftedCharacter
            }
        } else {
            shiftBy = UInt32(secret)!
            for character in plaintext {
                let unicode = character.unicodeScalars.first!.value
                var tempUnicode = unicode
                if unicode > 96 && unicode < 123 {
                    tempUnicode = unicode - 32
                }
                if tempUnicode-shiftBy < 65 || tempUnicode-shiftBy < 48 {
                    var oneShift = shiftBy
                    while oneShift > 0 {
                        if tempUnicode-1 < 48 {
                            tempUnicode += 42
                            oneShift -= 1
                        } else if tempUnicode-1 < 65 && tempUnicode > 57 {
                            tempUnicode -= 8
                            oneShift -= 1
                        } else {
                            tempUnicode -= 1
                            oneShift -= 1
                        }
                    }
                }else {
                    tempUnicode -= shiftBy
                }
                let shiftedUnicode = tempUnicode
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                decoded = decoded + shiftedCharacter
            }
        }
        
        return decoded
    }
}

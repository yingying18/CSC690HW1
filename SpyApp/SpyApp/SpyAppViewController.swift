import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!

    let factory = CipherFactory()
    var cipher: Cipher?
    var othercipher: otherCipher?
    var thirdcipher: thirdCipher?
    var fourthcipher: fourthCipher?

    var plaintext: String {
        if let text = input.text {
            return text
        } else {
            return ""
        }
    }
    
    var secretText: String {
        if let text = secret.text {
            return text
        } else {
            return ""
        }
    }
    
    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        if let othercipher = self.othercipher {
            output.text = othercipher.encode(plaintext, secret: secretText)
        } else if let thirdcipher = self.thirdcipher {
            output.text = thirdcipher.encode(plaintext, secret: secretText)
        } else if let fourthcipher = self.fourthcipher {
            output.text = fourthcipher.encode(plaintext, secret: secretText)
        } else if let cipher = self.cipher {
            output.text = cipher.encode(plaintext, secret: secretText)
        } else {
            output.text = "No cipher selected"
        }
    }

    @IBAction func decodeButtonPressed(_ sender: UIButton) {
        if let othercipher = self.othercipher {
            output.text = othercipher.decode(othercipher.encode(plaintext, secret: secretText), secret: secretText)
        } else if let thirdcipher = self.thirdcipher {
            output.text = thirdcipher.decode(thirdcipher.encode(plaintext, secret: secretText), secret: secretText)
        } else if let fourthcipher = self.fourthcipher {
            output.text = fourthcipher.decode(fourthcipher.encode(plaintext, secret: secretText), secret: secretText)
        } else if let cipher = self.cipher {
            output.text = cipher.decode(cipher.encode(plaintext, secret: secretText), secret: secretText)
        } else {
            output.text = "No cipher selected"
        }
    }
    
    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        guard
            let buttonLabel = sender.titleLabel,
            let buttonText = buttonLabel.text
        else {
            output.text = "No button or no button text"
            return
        }
        cipher = factory.cipher(for: buttonText)
    }
    
    @IBAction func AlphanumericButtonPressed(_ sender: UIButton) {
        guard
            let buttonLabel = sender.titleLabel,
            let buttonText = buttonLabel.text
        else {
                output.text = "No button or no button text"
                return
        }
        othercipher = factory.othercipher(for: buttonText)
    }
    
    
    @IBAction func ReverseButtonPressed(_ sender: UIButton) {
        guard
            let buttonLabel = sender.titleLabel,
            let buttonText = buttonLabel.text
        else {
                output.text = "No button or no button text"
                return
        }
        thirdcipher = factory.thirdcipher(for: buttonText)
    }
    
    @IBAction func MultiplyButtonPresed(_ sender: UIButton) {
        guard
            let buttonLabel = sender.titleLabel,
            let buttonText = buttonLabel.text
        else {
                output.text = "No button or no button text"
                return
        }
        fourthcipher = factory.fourthcipher(for: buttonText)
    }
}


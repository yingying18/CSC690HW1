import XCTest
@testable import SpyApp

class ReverseCeaserCipherTests: XCTestCase {
    
    var cipher: thirdCipher!
    
    override func setUp() {
        super.setUp()
        
        cipher = ReverseCeaserCipher()
    }
    
    func test_oneCharacterStringGetsMappedtoSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }
    
}

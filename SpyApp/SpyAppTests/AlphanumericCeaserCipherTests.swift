import XCTest
@testable import SpyApp

class AlphanumericCeaserCipherTests: XCTestCase {
    
    var cipher: otherCipher!
    
    override func setUp() {
        super.setUp()
        
        cipher = AlphanumericCeaserCipher()
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

import XCTest
@testable import UserDefaultsActor

final class UserDefaultsActorTests: XCTestCase {
    
    func testSavingString() async {
        let string = "Hello, World!"
        let userDefaultsActor = UserDefaultsActor(suite: .custom(UUID().uuidString))
        await userDefaultsActor.set(string, forKey: "key")
        let retrieved = await userDefaultsActor.string(forKey: "key")
        XCTAssertEqual(string, retrieved)
    }
    
    func testSavingArray() async {
        let array = ["Hello", "Hi",]
        let userDefaultsActor = UserDefaultsActor(suite: .custom(UUID().uuidString))
        await userDefaultsActor.set(array, forKey: "key")
        let retrieved = await userDefaultsActor.array(forKey: "key")
        XCTAssertEqual(array.count, retrieved?.count)
    }
    
    func testSavingDict() async {
        let dict = ["Hello" : "Hi"]
        let userDefaultsActor = UserDefaultsActor(suite: .custom(UUID().uuidString))
        await userDefaultsActor.set(dict, forKey: "key")
        let retrieved = await userDefaultsActor.dictionary(forKey: "key")
        XCTAssertEqual(dict.keys.count, retrieved?.keys.count)
    }
    
    func testSavingNestedArray() async {
        let array: Array<Sendable> = ["Hello", ["Hi", "Hey"]]
        let userDefaultsActor = UserDefaultsActor(suite: .custom(UUID().uuidString))
        await userDefaultsActor.set(array, forKey: "key")
        let retrieved = await userDefaultsActor.array(forKey: "key")
        XCTAssertEqual((array.first as? Array<Any>)?.count, (retrieved?.first as? Array<Any>)?.count)
    }
    
    func testSavingNestedDict() async {
        let dict: [String: Sendable] = ["Hello": ["Hi", "Hey"]]
        let userDefaultsActor = UserDefaultsActor(suite: .custom(UUID().uuidString))
        await userDefaultsActor.set(dict, forKey: "key")
        let retrieved = await userDefaultsActor.dictionary(forKey: "key")
        XCTAssertEqual((dict["Hello"] as? Array<Any>)?.count, (retrieved?["Hello"] as? Array<Any>)?.count)
    }
    
}

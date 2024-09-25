//
//  UserDefaultsActor.swift
//  LaunchCounter
//
//  Created by Mark Bridges on 24/09/2024.
//

import Foundation

public actor UserDefaultsActor {
    
    public enum Suite: Sendable {
        case standard
        case custom(String)
    }
    
    private let userDefaults: UserDefaults
    
    public init?(suite: Suite = .standard) {
        switch suite {
        case .standard:
            userDefaults = .standard
        case .custom(let suiteName):
            guard let defaults = UserDefaults(suiteName: suiteName) else {
                return nil
            }
            userDefaults = defaults
        }
    }
    
    public func object(forKey defaultName: String) -> Any? {
        return userDefaults.object(forKey: defaultName)
    }

    /**
     -setObject:forKey: immediately stores a value (or removes the value if nil is passed as the value) for the provided key in the search list entry for the receiver's suite name in the current user and any host, then asynchronously stores the value persistently, where it is made available to other processes.
     */
    public func set(_ value: Any?, forKey defaultName: String) {
        userDefaults.set(value, forKey: defaultName)
    }

    /// -removeObjectForKey: is equivalent to -[... setObject:nil forKey:defaultName]
    public func removeObject(forKey defaultName: String) {
        userDefaults.removeObject(forKey: defaultName)
    }

    /// -stringForKey: is equivalent to -objectForKey:, except that it will convert NSNumber values to their NSString representation. If a non-string non-number value is found, nil will be returned.
    public func string(forKey defaultName: String) -> String? {
        userDefaults.string(forKey: defaultName)
    }

    /// -arrayForKey: is equivalent to -objectForKey:, except that it will return nil if the value is not an NSArray.
    public func array(forKey defaultName: String) -> [Any]? {
        userDefaults.array(forKey: defaultName)
    }

    /// -dictionaryForKey: is equivalent to -objectForKey:, except that it will return nil if the value is not an NSDictionary.
    public func dictionary(forKey defaultName: String) -> [String : Any]? {
        userDefaults.dictionary(forKey: defaultName)
    }

    /// -dataForKey: is equivalent to -objectForKey:, except that it will return nil if the value is not an NSData.
    public func data(forKey defaultName: String) -> Data? {
        userDefaults.data(forKey: defaultName)
    }

    /// -stringForKey: is equivalent to -objectForKey:, except that it will return nil if the value is not an NSArray<NSString *>. Note that unlike -stringForKey:, NSNumbers are not converted to NSStrings.
    public func stringArray(forKey defaultName: String) -> [String]? {
        userDefaults.stringArray(forKey: defaultName)
    }

    /**
     -integerForKey: is equivalent to -objectForKey:, except that it converts the returned value to an NSInteger. If the value is an NSNumber, the result of -integerValue will be returned. If the value is an NSString, it will be converted to NSInteger if possible. If the value is a boolean, it will be converted to either 1 for YES or 0 for NO. If the value is absent or can't be converted to an integer, 0 will be returned.
     */
    public func integer(forKey defaultName: String) -> Int {
        userDefaults.integer(forKey: defaultName)
    }

    /// -floatForKey: is similar to -integerForKey:, except that it returns a float, and boolean values will not be converted.
    public func float(forKey defaultName: String) -> Float {
        userDefaults.float(forKey: defaultName)
    }

    /// -doubleForKey: is similar to -integerForKey:, except that it returns a double, and boolean values will not be converted.
    public func double(forKey defaultName: String) -> Double {
        userDefaults.double(forKey: defaultName)
    }

    /**
     -boolForKey: is equivalent to -objectForKey:, except that it converts the returned value to a BOOL. If the value is an NSNumber, NO will be returned if the value is 0, YES otherwise. If the value is an NSString, values of "YES" or "1" will return YES, and values of "NO", "0", or any other string will return NO. If the value is absent or can't be converted to a BOOL, NO will be returned.
     
     */
    public func bool(forKey defaultName: String) -> Bool {
        userDefaults.bool(forKey: defaultName)
    }

    /**
     -URLForKey: is equivalent to -objectForKey: except that it converts the returned value to an NSURL. If the value is an NSString path, then it will construct a file URL to that path. If the value is an archived URL from -setURL:forKey: it will be unarchived. If the value is absent or can't be converted to an NSURL, nil will be returned.
     */
    @available(iOS 4.0, *)
    public func url(forKey defaultName: String) -> URL? {
        userDefaults.url(forKey: defaultName)
    }

    /// -setInteger:forKey: is equivalent to -setObject:forKey: except that the value is converted from an NSInteger to an NSNumber.
    public func set(_ value: Int, forKey defaultName: String) {
        userDefaults.set(value, forKey: defaultName)
    }

    /// -setFloat:forKey: is equivalent to -setObject:forKey: except that the value is converted from a float to an NSNumber.
    public func set(_ value: Float, forKey defaultName: String) {
        userDefaults.set(value, forKey: defaultName)
    }

    /// -setDouble:forKey: is equivalent to -setObject:forKey: except that the value is converted from a double to an NSNumber.
    public func set(_ value: Double, forKey defaultName: String) {
        userDefaults.set(value, forKey: defaultName)
    }

    /// -setBool:forKey: is equivalent to -setObject:forKey: except that the value is converted from a BOOL to an NSNumber.
    public func set(_ value: Bool, forKey defaultName: String) {
        userDefaults.set(value, forKey: defaultName)
    }

    /// -setURL:forKey is equivalent to -setObject:forKey: except that the value is archived to an NSData. Use -URLForKey: to retrieve values set this way.
    @available(iOS 4.0, *)
    public func set(_ url: URL?, forKey defaultName: String) {
        userDefaults.set(url, forKey: defaultName)
    }

    /**
     -registerDefaults: adds the registrationDictionary to the last item in every search list. This means that after NSUserDefaults has looked for a value in every other valid location, it will look in registered defaults, making them useful as a "fallback" value. Registered defaults are never stored between runs of an application, and are visible only to the application that registers them.
     
     Default values from Defaults Configuration Files will automatically be registered.
     */
    public func register(defaults registrationDictionary: [String : Any]) {
        userDefaults.register(defaults: registrationDictionary)
    }

    /**
     -addSuiteNamed: adds the full search list for 'suiteName' as a sub-search-list of the receiver's. The additional search lists are searched after the current domain, but before global defaults. Passing NSGlobalDomain or the current application's bundle identifier is unsupported.
     */
    public func addSuite(named suiteName: String) {
        userDefaults.addSuite(named: suiteName)
    }

    /**
     -removeSuiteNamed: removes a sub-searchlist added via -addSuiteNamed:.
     */
    public func removeSuite(named suiteName: String) {
        userDefaults.removeSuite(named: suiteName)
    }

    /**
     -dictionaryRepresentation returns a composite snapshot of the values in the receiver's search list, such that [[receiver dictionaryRepresentation] objectForKey:x] will return the same thing as [receiver objectForKey:x].
     */
    public func dictionaryRepresentation() -> [String : Any] {
        userDefaults.dictionaryRepresentation()
    }

    public var volatileDomainNames: [String] {
        userDefaults.volatileDomainNames
    }

    public func volatileDomain(forName domainName: String) -> [String : Any] {
        userDefaults.volatileDomain(forName: domainName)
    }

    public func setVolatileDomain(_ domain: [String : Any], forName domainName: String) {
        userDefaults.set(domain, forKey: domainName)
    }

    public func removeVolatileDomain(forName domainName: String) {
        userDefaults.removeVolatileDomain(forName: domainName)
    }

    /// -persistentDomainForName: returns a dictionary representation of the search list entry specified by 'domainName', the current user, and any host.
    public func persistentDomain(forName domainName: String) -> [String : Any]? {
        userDefaults.persistentDomain(forName: domainName)
    }

    /// -setPersistentDomain:forName: replaces all values in the search list entry specified by 'domainName', the current user, and any host, with the values in 'domain'. The change will be persisted.
    public func setPersistentDomain(_ domain: [String : Any], forName domainName: String) {
        userDefaults.setPersistentDomain(domain, forName: domainName)
    }

    /// -removePersistentDomainForName: removes all values from the search list entry specified by 'domainName', the current user, and any host. The change is persistent.
    public func removePersistentDomain(forName domainName: String) {
        userDefaults.removeObject(forKey: domainName)
    }
    
}

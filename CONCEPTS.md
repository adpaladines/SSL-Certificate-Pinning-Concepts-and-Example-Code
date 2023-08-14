# iOS Security:
    1. Data Storage Security
    2. Network layer Security
    3. Jailbroken Detection
    4. Development techniques or best practices

## 1. Data Storage Security:
    a. UserDefaults -> Don't store sensitive data here
    b. Keychain -> To store small sensitive data
    c. CoreData -> We can use `SQLCipher` or sqlite file we can set a value for key `NSPersistenStoreFilePRotectionKey` to store data in a secure way.
    d. plist -> Save tokens and API keys in plist not in code directly (like google plist file).
    e. bundle -> Use `completeFileProtection` flag for writing files in your app.
        - Complete 
        bundle:
        ```swift
            func saveFileWithProtection() {
                do {
                    let bundle = Bundle(for: NetworkManager.self)
                    let fileURL = URL(string: "xyz")!
                    let data = "someData".data(using: .utf8)
                    try data?.write(to: fileURL, options: .completeFileProtection)
                } catch {
                    print(error.localizedDescription)
                }
            }
        ```

## 2. Network Layer Security - SSL/Certificate Pinning:

SSL Pinning is a mechanism used in ios to ensure the authenticity and integritty of server certificate durint api calls

we are adding an extra layer of security to our app's network communications by ensuring that the servers certificate is trusted and has not been tampered

### Certificate Pinning
1. Certificate Pinning
2. Public Key Pinning

 1. Certificate Pinning:
    Create server trust
    Certificate
    SSL Prolicy for domain name check
    evaluate server Certificate
    local Certificate
    Comparing data of local an remote server certificates

 2. The public key pinning:
    a. priate jey
    b. multiple public key

#### 2. ATS -> App Transport Security: By default requires https request.
- It doesn't allow any http connections happen in your app.
    
#### 3. Authentication Frameworks
    a. OAuth - Oauth2.0 -> Most common Industry standard:
        - Access Token
        - Refresh Token
    b. OKTA (SSO): Single Signing ???
    c. Apple Sign In:
    d. Firebase Authentication:
    
You can use your own Authentication Frameworks build by your backend team.

Third Party Frameworks:
Alamofire
TrustKit

### CryptoKit // -> 2019 (iOS 13)
 This will be helpfull to encryp and decrypt data (ecample in `NetworkManager.swift`)
- AES
- SHA

```swift
func encryptDataUsingCryptoKit() {
    let dataTOEncrypt = "Test Data".data(using: .utf8)!
    let sha256Hash = SHA256.hash(data: dataTOEncrypt)
    let sha384Hash = SHA384.hash(data: dataTOEncrypt)
    let sha512Hash = SHA512.hash(data: dataTOEncrypt)
}
```

## 3. Jailbroken Detection:
There is a preatty standard file that helps us with this task `JailbrokenCheck.swift`
SwiftUI:
```swift
    var body: some Scene {
        WindowGroup {
            if UIDevice.current.isJailBroken {
                EmptyView()
            }else {
                MainPageView()
                    .environmentObject(Coordinator())
            }
        }
    }
```

## 4. Development techniques or best practices:
Taking in cosideration all the past mentioned practices.
- Development Techniques:
    Deleting all prints and replacing it with a log file if necessary.
    Using `#if DEBUG` if prints are necessary in development mode.
    Following guidelines in [auth0.com](https://auth0.com/blog/security-best-practices-in-ios/)
    Synopsys.com -> Black Duck Software Comsposition Analysis.

# Assignment_32
SSL Certificate Pinning: Concepts and Example Code.

## Author: Andres D. Paladines

[![License][license-image]][license-url] [![Swift Version][swift-image]][swift-url]  [![SwiftUI][swiftUI-image]][swiftUI-url] [![Combine][cleancode-image]][cleancode-url]  [![Unit Tests][unittest-image]][unittest-url] 

[swift-image]:https://img.shields.io/badge/Swift-5.8.1-orange?style=for-the-badge
[swift-url]: https://swift.org/

[license-image]: https://img.shields.io/badge/License-MIT-blue?style=for-the-badge
[license-url]: LICENSE

[SwiftUI-image]: https://img.shields.io/badge/SwiftUI-3.0-orange?style=for-the-badge&logo=swift&logoColor=white
[SwiftUI-url]: https://developer.apple.com/xcode/swiftui/

[cleancode-image]: https://img.shields.io/badge/Clean_Code-orange?style=for-the-badge
[cleancode-url]: Clean_Code

[unittest-image]: https://img.shields.io/badge/Unit_Tests-green?style=for-the-badge
[unittest-url]: Unit_Tests

1. In Any of you existing  project implement SSL Certificate pinning using URLSession. Use Charles to snif network  and Test SSL Certificate pinning

2. Write answer for below Interview questions 
  a. What all things we can do to implement/ enhance Security in iOS app
  b. What is SSL pinning
  c. What is certificate SSL pinning
  d. What is certificate SSL Public key pinning

3. For Final project please work on your design part, decide what design you are going to implement, if possible take a screenshots of what design you are thinking of implementing, We will check designs on Monday.

- [x] SSL Certificate Pinning Implementation
- [x] Questions and answers
- [x] Designs for Final project

### 1. SSL Certificate Pinning Implementation:
  - [link to project](https://github.com/apaladines-techconsulting/Assignment_32/tree/main/mvvm-coordinator-repository%2BSOLID)
### 2. Concepts:
1. What all things we can do to implement / enhance Security in iOS app?
  - Data Storage Security
  - Network layer Security
  - Jailbroken Detection
  - Development techniques or best practices

2. What is SSL pinning?
  - Is a mechanism used in to ensure the authenticity and integritty of server certificate durint api calls. We are adding an extra layer of security to our app's network communications by ensuring that the servers certificate is trusted and has not been tampered.

3. What is certificate SSL pinning?
  - Create server trust Certificate SSL Prolicy for domain name, check, evaluate server Certificate local Certificate Comparing data of local an remote server certificates.

4. What is certificate SSL Public key pinning?
  - Is a security mechanism used to enhance the trust and security of SSL/TLS connections between a client and a server. It involves associating a specific public key or set of public keys with a particular domain, making it more difficult for attackers to perform man-in-the-middle attacks or impersonate the server.
    - Server Setup: The website owner sets up their server with an SSL certificate and includes one or more specific public keys in the certificate.
    - Client Connection: When a user's browser connects to the website, the server sends its SSL certificate, including the public key(s).
    - Client Check: The user's browser checks if the received public key(s) match the ones it has stored or knows about.
    - Matching Keys: If the public key(s) match, the connection proceeds securely.
    - Mismatch: If the public key(s) don't match, the browser might warn the user or prevent the connection to prevent potential security risks.


### 3. Designs for Final project:
Recipes app with Google Login, CoreData Storage and SwiftUI 

[Behance link](https://www.behance.net/gallery/176410731/recipe-app-ui?tracking_source=search_projects|recipe+app+design)

[API](https://www.themealdb.com/api.php)

Functionalities:

- Full list of recipes.
- Search textBox
- Select preffered three categories
- Gmail login
- Favorites
- Recipes with images and or YouTube videos
- Recipe Details

##### Images:
![Images](https://user-images.githubusercontent.com/138136886/260061023-55ab79ec-0e25-472c-8816-0783660c2963.png)

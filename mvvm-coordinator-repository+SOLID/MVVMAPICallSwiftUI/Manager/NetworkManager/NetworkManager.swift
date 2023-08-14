//
 //  NetworkManager.swift
 //  MVVMAPICallSwiftUI
 //
 //  Created by Andres D. Paladines on 7/18/23.
 //

 import Foundation
 import CryptoKit // -> 2019 (iOS 13)

 class NetworkManager: NSObject {

     var urlSession: NetworkManagersessionable

     init(urlSession: NetworkManagersessionable = URLSession.shared) {
         self.urlSession = urlSession
     }
 }

 extension NetworkManager {

     func encryptDataUsingCryptoKit() {
         let dataTOEncrypt = "Test Data".data(using: .utf8)!
         let sha256Hash = SHA256.hash(data: dataTOEncrypt)
         let sha384Hash = SHA384.hash(data: dataTOEncrypt)
         let sha512Hash = SHA512.hash(data: dataTOEncrypt)
     }
 }

 extension NetworkManager: NetworkAbleProtocol {

     func getDataFromApi(urlRequest: Requestable) async throws -> Data {
         do {
             guard let request = urlRequest.createURLRequest() else {
                 throw NetworkError.invalidUrlError
             }
             urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
             let (data, response) = try await urlSession.getData(for: request, delegate: nil)
             guard response.isValidUrlResponse() else {
                 throw NetworkError.responseError
             }
             return data
         } catch {
             print(error.localizedDescription)
             throw error
         }
     }
 }

 extension NetworkManager: URLSessionDelegate {

     func urlSession(
         _ session: URLSession,
         didReceive challenge: URLAuthenticationChallenge,
         completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
             //Create server trust
             guard let serverTrust = challenge.protectionSpace.serverTrust else {
                 completionHandler(.cancelAuthenticationChallenge, nil)
                 return
             }

             //certificate
             let certificate = SecTrustGetCertificateAtIndex(serverTrust, 0)

//             let certificate = SecTrustCopyCertificateChain(serverTrust)
             
             //let publicKey comes from server
             //generate token
             //send back this token to server
             //server will decrypt this token with there private key
             //if tat is successfull then all further communication will happen

             //SSL Prolicy for domain name check
             let policy = NSMutableArray()
             policy.add(SecPolicyCreateSSL(true, challenge.protectionSpace.host as CFString))

             //evaluate server Certificate
             let isServerTrusted = SecTrustEvaluateWithError(serverTrust, nil)
             let remoteServerCertificate: NSData = SecCertificateCopyData(certificate!)

             //local Certificate
             let pathLocalCertificate = Bundle.main.path(forResource: "vercel.app", ofType: "cer")
             let localCertificare: NSData = NSData(contentsOfFile: pathLocalCertificate!)!

             //Comparing data of local an remote server certificates
             if(isServerTrusted && remoteServerCertificate.isEqual(to: localCertificare as Data)) {
                 print("Certificate Pinning successfully executed")
                 completionHandler(.useCredential, nil)
             }else {
                 print("Certificate didn't match, Certificate Pinning failed.")
                 completionHandler(.cancelAuthenticationChallenge, nil)
             }

         }
 }

//
//  LoginClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

class LoginClient {
    
    static let baseURL = URL(string: "https://dev.rapptrlabs.com/Tests/scripts/login.php")
        
    static func login(email: String, password: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        
        let start = CFAbsoluteTimeGetCurrent()
        
        guard let baseURL = baseURL else { return completion(.failure(.invalidURL)) }
        
        let body = "username=\(email)&password=\(password)"
        let finalBody = body.data(using: .utf8)
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = finalBody
        
        request.timeoutInterval = 20
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            if let response = response {
                print("Response: ", response)
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            do {
                let jsonData = try JSONDecoder().decode(Login.self, from: data)
                let message = jsonData.message
                print("JSON message:", message)
                
                let dif = CFAbsoluteTimeGetCurrent() - start
                let difToMillisec = dif * 1000
                let difFormated = String(format: "%.0f", difToMillisec)
                print("Request took \(difFormated) ms")
                return completion(.success(message))
            } catch {
                return completion(.failure(.unableToDecode))
            }
        }.resume()
    }
}

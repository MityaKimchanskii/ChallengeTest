//
//  ChatClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import UIKit

class ChatClient {

    static let baseURL = URL(string: "http://dev.rapptrlabs.com/Tests/scripts/chat_log.php")
    
    static func fetchChatData(completion: @escaping (Result<[Message], NetworkError>) -> Void) {
        guard let baseURL = baseURL else { return }
        
        URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
            
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Response: \(String(describing: response))")
                return
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            do {
                let dataJSON = try JSONDecoder().decode(Data.self, from: data)
                let resultArrayMessages = dataJSON.data
                var chatArray: [Message] = []
                for message in resultArrayMessages {
                    chatArray.append(message)
                }
                return completion(.success(chatArray))
            } catch {
                return completion(.failure(.unableToDecode))
            }
        }.resume()
    }
}

//
//  NetworkManager.swift
//  H4X0R
//
//  Created by Seth Thorup on 1/27/23.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var hits = [Hit]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Session Error: \(error)")
                } else {
                    let decoder = JSONDecoder()
                    if let data = data {
                        do{
                            let results = try decoder.decode(Welcome.self, from: data)
                            DispatchQueue.main.async {
                                self.hits = results.hits
                            }                            
                        } catch {
                            print("decoder error: \(error)")
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

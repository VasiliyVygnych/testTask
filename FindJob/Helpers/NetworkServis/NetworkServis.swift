//
//  NetworkServis.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 14.03.2024.
//

import UIKit

class NetworkServis: NetworkServisProtocol {
    
    func request(from url: URL) async throws -> FindJob {
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let (data, _) = try await session.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(FindJob.self, 
                                  from: data)
    }
    
    
    func request(url: URL,
                 completion: @escaping ( Result <Data, Error>) -> Void) {
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
        }.resume()
    }
    
    func vacancies(completion: @escaping (FindJob?) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14") else { return }
        request(url: url) { (result)  in
            switch result {
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode(FindJob.self,
                                                         from: data)
                    completion(model)
                } catch let jsonError {
                    print("ERROR", jsonError)
                    completion(nil)
                }
            case .failure(let error):
                print("ERROR DATA \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
    
}

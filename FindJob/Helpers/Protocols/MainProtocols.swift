//
//  MainProtocols.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 14.03.2024.
//

import Foundation

protocol NetworkServisProtocol {
    func request(from url: URL) async throws -> FindJob
    func vacancies(completion: @escaping (FindJob?) -> Void)
    
}

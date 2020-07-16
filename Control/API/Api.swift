//
//  Vehicles.swift
//  Control
//
//  Created by Will DeBerry on 7/8/20.
//

import Combine
import Foundation

class Api {
    enum CommandError: Error {
        case noData
        case httpResponse
        case networkError
        case serverError
        case wake
        case unknown
        case request
    }

    var authModel: AuthModel
    var token: String

    init(authModel: AuthModel) {
        self.authModel = authModel

        if let token = authModel.token {
            self.token = token.accessToken
        } else {
            self.token = ""
        }
    }

    // MARK: - Public Methods

    func sendCommand(method: String, api: String ,id: String?, payload: Array<[String: Any]>?, completion: @escaping (Result<Data, CommandError>) -> Void) {
        guard let request = generateRequest(method: method, api: api, payload: payload) else {
            NSLog("Failed to generate request for \(api)")
            completion(.failure(.request))
            return
        }

        handleRequest(request: request) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                switch error {
                case .wake:
                    if let id = id {
                        self.sendWake(id: id) { success in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                                self.sendCommand(method: method, api: api, id: id, payload: payload, completion: completion)
                            }
                        }
                    }
                default:
                    completion(.failure(error))
                }
            }
        }
    }

    // MARK: - Private Methods

    private func generateRequest(method: String, api: String, payload: Array<[String: Any]>?) -> URLRequest? {
        guard let url = URL(string: "\(Tesla.baseUrl)/api/1/\(api)") else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        return request
    }

    private func handleRequest(request: URLRequest, completion: @escaping (Result<Data, CommandError>) -> Void) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let processedRequest = self.processRequest(data: data, response: response, error: error)
            switch processedRequest {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }.resume()
    }

    private func processRequest(data: Data?, response: URLResponse?, error: Error?) -> Result<Data, CommandError> {
        guard let data = data else { return .failure(.noData) }
        guard let httpResponse = response as? HTTPURLResponse else { return .failure(.httpResponse) }
        switch httpResponse.statusCode {
        case 408:
            NSLog("Please wake car before sending commands, \(httpResponse.statusCode)")
            return .failure(.wake)
        case 400...499:
            NSLog("Network error while sending request, \(httpResponse.statusCode)")
            return .failure(.networkError)
        case 500...599:
            NSLog("Server error while sending request, \(httpResponse.statusCode)")
            return .failure(.serverError)
        default:
            NSLog("Successfully processed request for \(String(describing: httpResponse.url)), \(httpResponse.statusCode)")
            return .success(data)
        }
    }
}

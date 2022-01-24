//
//  AppService.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import Foundation
import Alamofire

class AppService: BaseService {
    func getTopFree(completion: @escaping (AFDataResponse<FeedResponse>) -> ()) {
        let api = "\(baseURLRSS)/top-free/50/apps.json"
        AF.request(api, method: .get).responseDecodable(completionHandler: completion)
    }
    
    func getApplication(_ form: GetApplicationForm, completion: @escaping (AFDataResponse<LookUp>) -> ()) {
        let api = "\(baseURL)/lookup"
        AF.request(api, method: .get, parameters: form).responseDecodable(completionHandler: completion)
    }
}

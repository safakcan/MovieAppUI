//
//  Api.swift
//  MovieAppPlus
//
//  Created by Safak Can Bas on 12.02.2022.
//

import Foundation
import MADNetwork

protocol MovieAPIEndpoint: Endpoint {}

extension MovieAPIEndpoint {

    var api: API {
        return API(baseURL: BaseURL(scheme: "https", host: "api.themoviedb.org"))
    }

}

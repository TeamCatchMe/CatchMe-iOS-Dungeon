//
//  AddActionService.swift
//  Multipart-Moya
//
//  Created by SHIN YOON AH on 2021/09/01.
//

import Moya

enum AddActionService {
    case create(UIImage?, String, String, String, String, Int)
    case delete(DeleteActionRequest)
    case edit(UIImage?, String, String, String, String, Int, Int)
}

extension AddActionService: TargetType {
    public var baseURL: URL {
        return URL(string: GeneralAPI.baseURL)!
    }

    var path: String {
        switch self {
        case .create:
            return "/activity/new"
        case .delete:
            return "/activity/delete"
        case .edit:
            return "/activity/edit"
        }
    }

    var method: Moya.Method {
        switch self {
        case .create,
             .delete,
             .edit:
            return .post
        }
    }

    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }

    var task: Task {
        switch self {
        case .create(let image,
                     let content,
                     let year,
                     let month,
                     let day,
                     let index):
            
            var formData: [Moya.MultipartFormData] = []
            
            if let image = image {
                let imageData = image.pngData()
                
                formData += [Moya.MultipartFormData(provider: .data(imageData!), name: "activityImage", fileName: "\(image).png", mimeType: "image/png")]
            }
            
            let parameters: [String : Any] = [
                "activityContent": content,
                "activityYear": year,
                "activityMonth": month,
                "activityDay": day,
                "characterIndex": index
            ]
            
            for (key, value) in parameters {
                formData.append(Moya.MultipartFormData(provider: .data(value as! Data), name: key))
            }
            
            return .uploadMultipart(formData)
        case .edit(let image,
                   let content,
                   let year,
                   let month,
                   let day,
                   let index,
                   let activityIndex):
            var formData: [Moya.MultipartFormData] = []
            
            if let image = image {
                let imageData = image.pngData()
                
                formData += [Moya.MultipartFormData(provider: .data(imageData!), name: "activityImage", fileName: "\(image).png", mimeType: "image/png")]
            }
            
            let parameters: [String : Any] = [
                "activityContent": content,
                "activityYear": year,
                "activityMonth": month,
                "activityDay": day,
                "characterIndex": index,
                "activityIndex": activityIndex
            ]
            
            for (key, value) in parameters {
                formData.append(Moya.MultipartFormData(provider: .data(value as! Data), name: key))
            }
            
            return .uploadMultipart(formData)
        case .delete(let param):
            return .requestJSONEncodable(param)
        }
    }

    var headers: [String: String]? {
        let accessToken = GeneralAPI.token
        switch self {
        case .create,
             .edit:
            return ["Content-Type": "application/json",
                    "token": accessToken] // GeneralAPI.token
        default:
            return ["Content-Type": "multipart/form-data",
                    "token": accessToken] // GeneralAPI.token
        }
    }
}

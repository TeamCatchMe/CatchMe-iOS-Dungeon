//
//  AddActionModel.swift
//  Multipart-Moya
//
//  Created by SHIN YOON AH on 2021/09/01.
//

import Foundation

/// 활동 작성을 성공했는지 반환하는 데이터 모델입니다
///
/// - Description :
///     - status : HTTP 상태 코드
///     - success : 통신 성공 여부를 알려줍니다.
///     - message : 메시지를 담고 있습니다.
///

struct AddActionModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? 0
        success = (try? values.decode(Bool.self, forKey: .success)) ?? true
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}

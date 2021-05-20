//
//  EYResponse.swift
//  EY.Mtel_ProjectTemplate_Swift
//
//  Created by zxj on 2020/8/10.
//  Copyright © 2020 EY.Mtel. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import HandyJSON

extension Array: HandyJSON {}
extension String: HandyJSON {}

struct EYResponse<T:HandyJSON>:HandyJSON{
    
    var code:Int = 0
    var message:String?
    var feed: T?
    var isSuccess: Bool {
         return code == 0
     }
}

extension Response {

    func mapModel<T>() throws -> EYResponse<T> {
        do {
            
             if let jsonString = String(data: data, encoding: String.Encoding.utf8){
                
                if let obj = JSONDeserializer<EYResponse<T>>.deserializeFrom(json: jsonString) {
                    
                    return obj
                }
                
                throw RxMoyaError.modelMapping(self)
                
            } else {
                
                throw RxMoyaError.modelMapping(self)
            }

        } catch {
            
            throw RxMoyaError.modelMapping(self)
        }
    }

}


extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
    func mapModel<T: HandyJSON>() -> Single<EYResponse<T>> {
        return flatMap { (response) -> Single<EYResponse<T>> in
            
            return Single.just(try response.mapModel())
        }
    }
}

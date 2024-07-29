//
//  DataManager.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 25/06/2024.
//

import Foundation
import UIKit

class DataManager {
    let networCall = NetworkingManager()
    
    func fetchRandomFood(url: String, onComplete: @escaping (MealDataModel?, Error?) -> ()) {
        networCall.responseCall(url: url, responseType: MealDataModel.self) { responseObject, error in
            var dataModel: MealDataModel?
            
            if let error = error {
                print(error)
            } else {
                dataModel = responseObject
                
                print(responseObject!)
            }
            onComplete(dataModel, error)
        }
    }
    
//    func fetchImage(url: String, onComplete: @escaping (UIImage?, Error?) -> ()) {
//        
//        networCall.fetchImage(url: url) { data, error in
//            if let error = error {
//                onComplete(nil, error)
//            }
//            if let safeData = data {
//                onComplete(safeData, nil)
//            }
//        }
//    }
    
    func fetchById(url: String, onComplete: @escaping (MealDataModel?, Error?) -> ()) {
        networCall.responseCall(url: url, responseType: MealDataModel.self) { responseObject, error in
            var dataModel: MealDataModel?
            
            if let error = error {
                print(error)
            } else {
                dataModel = responseObject
            }
            onComplete(dataModel, error)
        }
    }
    
//    func fetchCategory(url: String, onComplete: @escaping (MealsCategoryDataModel?, Error?) -> ()) {
//        networCall.responseCall(url: url, responseType: MealsCategoryDataModel.self) { responseObject, error in
//            var dataModel: MealsCategoryDataModel?
//            
//            if let error = error {
//                print(error)
//            } else {
//                dataModel = responseObject
//            }
//            onComplete(dataModel, error)
//        }
//    }
}

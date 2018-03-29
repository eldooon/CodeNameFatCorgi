//
//  RecipeModels.swift
//  Milo
//
//  Created by Eldon Chan on 3/28/18.
//  Copyright (c) 2018 ByEldon. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Recipe
{
    // MARK: Use cases
    
    enum FetchRecipes {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
            struct DisplayedRecipes {
                var id: String
                var name: String
                var description: String
            }
        }
    }
}

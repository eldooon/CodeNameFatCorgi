//
//  DisplayedAlert.swift
//  Milo
//
//  Created by Eldon Chan on 5/1/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

enum DisplayAlert {
    
    enum AddRecipe {
        struct Request {
        }
        struct Response {
            var isAdded: Bool
        }
        struct ViewModel {
            struct DisplayedAlert {
                var image: UIImage
                var message: String
            }
            var displayedAlert: DisplayedAlert
        }
    }
}

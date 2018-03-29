//
//  ListRecipeInteractor.swift
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

protocol ListRecipeBusinessLogic {
    func fetchRecipes(request: ListRecipe.FetchRecipes.Request)
}

protocol ListRecipeDataStore {
    //var name: String { get set }
}

class ListRecipeInteractor: ListRecipeBusinessLogic, ListRecipeDataStore {
    
    var presenter: ListRecipePresentationLogic?
    var worker: ListRecipeWorker?
    var recipes: [Recipe]?
    
    // MARK: Do something
    func fetchRecipes(request: ListRecipe.FetchRecipes.Request) {
        
        if let recipes = recipes {
            self.recipes = TestRecipe.testRecipeData
            let response = ListRecipe.FetchRecipes.Response(recipes: recipes)
        }
        
        //
    }
    
}

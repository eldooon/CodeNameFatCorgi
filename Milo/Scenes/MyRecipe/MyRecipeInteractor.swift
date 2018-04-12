//
//  MyRecipeInteractor.swift
//  Milo
//
//  Created by Eldon Chan on 4/6/18.
//  Copyright (c) 2018 ByEldon. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MyRecipeBusinessLogic {
    func fetchMyRecipes(request: MyRecipe.FetchMyRecipes.Request)
}

protocol MyRecipeDataStore {
    var recipes: [Recipe]? {get}
}

class MyRecipeInteractor: MyRecipeBusinessLogic, MyRecipeDataStore {

    var presenter: MyRecipePresentationLogic?
    var worker = RecipesWorkers(recipesStore: MyRecipeCoreDataStore())
    var recipes: [Recipe]?
    
    
    // MARK: Do something
    
    func fetchMyRecipes(request: MyRecipe.FetchMyRecipes.Request)
    {
        MyRecipeCoreDataStore.shared.persistentContainer.performBackgroundTask { (backgroundContext) in
            do {
                try backgroundContext.save()
                DispatchQueue.main.async {
                    MyRecipeCoreDataStore.shared.fetchRecipes { (recipes, error) in
                        print(recipes)
                        self.recipes = recipes
                        let response = MyRecipe.FetchMyRecipes.Response(myRecipes: recipes)
                        self.presenter?.presentMyRecipes(response: response)
                    }
                }
            } catch let err {
                print("Failed to save:", err)
            }
        }
//        worker.fetchMyRecipes { (recipes, error) in
//            print(recipes)
//            self.recipes = recipes
//            let response = MyRecipe.FetchMyRecipes.Response(myRecipes: recipes)
//            self.presenter?.presentMyRecipes(response: response)
//        }
    }
}

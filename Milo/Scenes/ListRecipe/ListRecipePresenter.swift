//
//  ListRecipePresenter.swift
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

protocol ListRecipePresentationLogic {
    func presentFetchedRecipes(response: ListRecipe.FetchRecipes.Response)
}

class ListRecipePresenter: ListRecipePresentationLogic {

    weak var viewController: ListRecipeDisplayLogic?
    
    // MARK: Do something
    func presentFetchedRecipes(response: ListRecipe.FetchRecipes.Response) {
        
        var displayedRecipes: [ListRecipe.FetchRecipes.ViewModel.DisplayedRecipes] = []
        for recipe in response.recipes {
            
            let displayedRecipe = ListRecipe.FetchRecipes.ViewModel.DisplayedRecipes(name: recipe.name, description: recipe.description)
            displayedRecipes.append(displayedRecipe)
        }
        let viewModel = ListRecipe.FetchRecipes.ViewModel(displayedRecipes: displayedRecipes)
    }
}

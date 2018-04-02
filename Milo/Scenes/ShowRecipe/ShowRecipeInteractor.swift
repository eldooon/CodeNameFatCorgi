//
//  ShowRecipeInteractor.swift
//  Milo
//
//  Created by Eldon Chan on 4/2/18.
//  Copyright (c) 2018 ByEldon. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ShowRecipeBusinessLogic
{
  func doSomething(request: ShowRecipe.Something.Request)
}

protocol ShowRecipeDataStore
{
  //var name: String { get set }
}

class ShowRecipeInteractor: ShowRecipeBusinessLogic, ShowRecipeDataStore
{
  var presenter: ShowRecipePresentationLogic?
  var worker: ShowRecipeWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: ShowRecipe.Something.Request)
  {
    worker = ShowRecipeWorker()
    worker?.doSomeWork()
    
    let response = ShowRecipe.Something.Response()
    presenter?.presentSomething(response: response)
  }
}

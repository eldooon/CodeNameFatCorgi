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

protocol MyRecipeBusinessLogic
{
  func doSomething(request: MyRecipe.Something.Request)
}

protocol MyRecipeDataStore
{
  //var name: String { get set }
}

class MyRecipeInteractor: MyRecipeBusinessLogic, MyRecipeDataStore
{
  var presenter: MyRecipePresentationLogic?
  var worker: MyRecipeWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: MyRecipe.Something.Request)
  {
    worker = MyRecipeWorker()
    worker?.doSomeWork()
    
    let response = MyRecipe.Something.Response()
    presenter?.presentSomething(response: response)
  }
}

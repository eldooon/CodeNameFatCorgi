//
//  ListRecipeViewController.swift
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

protocol ListRecipeDisplayLogic: class{
    func displaySomething(viewModel: ListRecipe.FetchRecipes.ViewModel.DisplayedRecipes)
}

class ListRecipeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, ListRecipeDisplayLogic {
    var interactor: ListRecipeBusinessLogic?
    var router: (NSObjectProtocol & ListRecipeRoutingLogic & ListRecipeDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = ListRecipeInteractor()
        let presenter = ListRecipePresenter()
        let router = ListRecipeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRecipes()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func fetchRecipes(){
        //    let request = Recipe.Something.Request()
        //    interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: ListRecipe.FetchRecipes.ViewModel.DisplayedRecipes) {
        //nameTextField.text = viewModel.name
    }
    
    //Collectionview Setup
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TestRecipe.testRecipeData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSize = (view.frame.width/2)-1
        return CGSize(width: cellSize, height: cellSize)
    }
    
}

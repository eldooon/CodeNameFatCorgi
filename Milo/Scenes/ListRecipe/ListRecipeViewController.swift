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

protocol ListRecipeDisplayLogic: class {
    func displayFetchRecipes(viewModel: ListRecipe.FetchRecipes.ViewModel)
    func displayAddRecipe(viewModel: ListRecipe.AddRecipe.ViewModel)
}

class ListRecipeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, ListRecipeDisplayLogic {
    
    var interactor: ListRecipeBusinessLogic?
    var router: (NSObjectProtocol & ListRecipeRoutingLogic & ListRecipeDataPassing)?
    var displayedRecipes: [ListRecipe.FetchRecipes.ViewModel.DisplayedRecipes] = []
    
    @IBAction func addRecipeButtonTapped(_ sender: AnyObject) {
        
        let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to: self.collectionView)
        guard let indexPath = self.collectionView?.indexPathForItem(at: buttonPosition) else {return}
        let request = ListRecipe.AddRecipe.Request()
        interactor?.addRecipe(indexPath: indexPath.item, request: request)
    }
    
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
        print("1. Asking for segue")
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
    
    // MARK: Fetch Recipes
    
    func fetchRecipes(){
        print("1. Request recipe")
        let request = ListRecipe.FetchRecipes.Request()
        interactor?.fetchRecipes(request: request)
    }
    
    // MARK: Display
    
    func displayFetchRecipes(viewModel: ListRecipe.FetchRecipes.ViewModel) {
        print("5. Showing on VC")
        displayedRecipes = viewModel.displayedRecipes
        collectionView?.reloadData()
    }
    
    func displayAddRecipe(viewModel: ListRecipe.AddRecipe.ViewModel) {
        
    }
    
    
    //Collectionview Setup
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedRecipes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! ListRecipeCell
        cell.nameLabel.text = displayedRecipes[indexPath.item].name
        cell.imageView.image = displayedRecipes[indexPath.item].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSize = (view.frame.width/2)-1
        return CGSize(width: cellSize, height: cellSize)
    }
    
    
}

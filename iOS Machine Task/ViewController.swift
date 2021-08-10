//
//  ViewController.swift
//  iOS Machine Task
//
//  Created by yogendra singh on 8/9/21.
//  Copyright © 2021 codeepie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var searching = false
       var searchedProduct = [ProductData]()
    
    var productList = [ProductData]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    @IBOutlet var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fillData()
        configureSearchController()
    }


        private func configureSearchController(){
            searchController.loadViewIfNeeded()
            searchController.searchResultsUpdater = self
            searchController.searchBar.delegate = self
            searchController.delegate = self
            searchController.searchBar.sizeToFit(); self.searchController.hidesNavigationBarDuringPresentation = false
            
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.enablesReturnKeyAutomatically = false
            searchController.searchBar.returnKeyType = UIReturnKeyType.done
            
            self.navigationItem.searchController = searchController
            self.navigationItem.hidesSearchBarWhenScrolling = false
            
            definesPresentationContext = true
            searchController.searchBar.placeholder = " Search by Name"
            
           
//searchController.searchBar.backgroundColor = .gray
    //        print("Search success")
        }
        

    
    private func fillData(){
        
        let productItem1 = ProductData(pImage: "Apple", pName: "Apple")
        productList.append(productItem1)
        
        let productItem2 = ProductData(pImage: "Ball", pName: "Ball")
               productList.append(productItem2)
        
        let productItem3 = ProductData(pImage: "Catt", pName: "Cat")
               productList.append(productItem3)
        
        let productItem4 = ProductData(pImage: "Dog", pName: "Dog")
               productList.append(productItem4)
        
        let productItem5 = ProductData(pImage: "Elephant", pName: "Elephant")
               productList.append(productItem5)
        
        let productItem6 = ProductData(pImage: "Frog", pName: "Frog")
        productList.append(productItem6)
        
        let productItem7 = ProductData(pImage: "Girl", pName: "Girl")
               productList.append(productItem7)
        
        let productItem8 = ProductData(pImage: "Hen", pName: "Hen")
               productList.append(productItem8)
        
        let productItem9 = ProductData(pImage: "IceCream", pName: "IceCream")
               productList.append(productItem9)
        
        let productItem10 = ProductData(pImage: "Jug", pName: "Jug")
               productList.append(productItem10)
        
        let productItem11 = ProductData(pImage: "Kite", pName: "Kite")
        productList.append(productItem11)
        
        let productItem12 = ProductData(pImage: "Lion", pName: "Lion")
               productList.append(productItem12)
        
        let productItem13 = ProductData(pImage: "Monkey", pName: "Monkey")
               productList.append(productItem13)
        
        let productItem14 = ProductData(pImage: "Nest", pName: "Nest")
               productList.append(productItem14)
        
        let productItem15 = ProductData(pImage: "Orange", pName: "Orange")
               productList.append(productItem15)
        
        let productItem16 = ProductData(pImage: "Parrot", pName: "Parrot")
        productList.append(productItem16)
        
        let productItem17 = ProductData(pImage: "Queen", pName: "Queen")
               productList.append(productItem17)
        
        let productItem18 = ProductData(pImage: "Rabbit", pName: "Rabbit")
               productList.append(productItem18)
        
        let productItem19 = ProductData(pImage: "Sun", pName: "Sun")
               productList.append(productItem19)
        
        let productItem20 = ProductData(pImage: "Tree", pName: "Tree")
               productList.append(productItem20)
        
        let productItem21 = ProductData(pImage: "Umbrella", pName: "Umbrella")
        productList.append(productItem21)
        
        let productItem22 = ProductData(pImage: "Van", pName: "Van")
               productList.append(productItem22)
        
        let productItem23 = ProductData(pImage: "Wheel", pName: "Wheel")
               productList.append(productItem23)
        
        let productItem24 = ProductData(pImage: "Xray", pName: "Xray")
               productList.append(productItem24)
        
        let productItem25 = ProductData(pImage: "Yarn", pName: "Yarn")
               productList.append(productItem25)
        
        let productItem26 = ProductData(pImage: "Zebra", pName: "Zebra")
        productList.append(productItem26)
        
        
    }


    
}

extension ViewController :  UICollectionViewDelegate , UICollectionViewDataSource , UISearchResultsUpdating , UISearchBarDelegate , UISearchControllerDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching {
            
            return searchedProduct.count
            
        }
        else{
            return productList.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCollectionViewCell
        cell.layer.cornerRadius = 12
        
       
        
        if searching{
            
            cell.myImage.image = UIImage(named: searchedProduct[indexPath.row].ProductImg)
            cell.myLabel.text = searchedProduct[indexPath.row].ProductName
            
        }
        else{
            cell.myImage.image = UIImage(named: productList[indexPath.row].ProductImg)
            cell.myLabel.text = productList[indexPath.row].ProductName
            
        }
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty{
            searching = true
            searchedProduct.removeAll()
            for product in productList {
                if product.ProductName.lowercased().contains(searchText.lowercased()){
                    searchedProduct.append(product)
                }
                
            }
            
        }
        else{
            searching = false
            searchedProduct.removeAll()
            searchedProduct = productList
            
        }
        myCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedProduct.removeAll()
        myCollectionView.reloadData()
    }
}

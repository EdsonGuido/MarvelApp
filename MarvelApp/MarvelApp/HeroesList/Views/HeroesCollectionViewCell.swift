//
//  HeroesCollectionViewCell.swift
//  MarvelApp
//
//  Created by Vinicius Marques on 19/04/2018.
//  Copyright © 2018 Vinicius Carvalho. All rights reserved.
//

import UIKit

protocol FavoriteDelegate: class {
    func save(character: Character?)
}

class HeroesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: ImageViewAsync!
    @IBOutlet weak var heroesTitle: UILabel!
    @IBOutlet weak var favoriteIcon: UIImageView!
    fileprivate var character: Character?
    fileprivate var viewModel: CharactersViewModelProtocol?
    
    fileprivate func clean() {
        self.heroesTitle.text = ""
        self.imageView.image = UIImage(named: "placeholder")
    }
    
    func setup(character: Character, viewModel: CharactersViewModelProtocol? = nil) {
        self.character = character
        self.viewModel = viewModel
        self.heroesTitle?.text = character.name
        self.heroesTitle?.font = UIFont(name: "Avenir", size: 16)
        if let path = character.thumbnail?.path, let ext = character.thumbnail?.extension {
            self.imageView?.imageFromServerURL(urlString: "\(path).\(ext)")
        }
        
        guard let name = character.name else { return }
        
        print("NAME: \(name)")
        
        if let status = UserDefaults.standard.value(forKey: name) as? Bool {
            if status {
                favoriteIcon.image = UIImage(named: "favorite_full_icon")
            }
        }
    }
    
    public func image() -> UIImage? {
        return imageView.image
    }
}

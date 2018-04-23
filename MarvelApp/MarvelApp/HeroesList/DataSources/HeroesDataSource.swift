//
//  HeroesDataSource.swift
//  MarvelApp
//
//  Created by Vinicius Marques on 19/04/2018.
//  Copyright © 2018 Vinicius Carvalho. All rights reserved.
//

import Foundation
import UIKit

class HeroesDataSource: NSObject {
    
    fileprivate var characters: [Character]
    fileprivate var selectedCharacter: Character?
    var isSearching: Bool = false
    
    init(with characters: [Character]) {
        self.characters = characters
        super.init()
    }
    
    func registerCell() {
        let nib = UINib(nibName: "HeroesCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "HeroesCollectionViewCell")
    }
    
    func numberOfCharacters() -> Int {
        return characters.count
    }
    
    func getCharacter(byIndexPath indexPath: IndexPath) -> Character {
        let row = indexPath.row
        return characters[row]
    }
    
    func getSelectedCharacters() -> Character? {
        return self.selectedCharacter
    }
    
}

extension HeroesDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.numberOfCharacters()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroesCollectionViewCell", for: indexPath) as? HeroesCollectionViewCell {
            
            let character = self.getCharacter(byIndexPath: indexPath)
            
            cell.setup(character: character)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HeroesDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = collectionView.bounds.height / 2.5
        let collectionPadding = CGFloat(45)
        let collectionWidth = collectionView.bounds.width - collectionPadding
        let cellWidth = collectionWidth / 2
        
        return CGSize(width: cellWidth, height: cellHeight);
    }
}

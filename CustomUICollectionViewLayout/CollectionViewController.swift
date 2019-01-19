//
//  CollectionViewController.swift
//  CustomUICollectionViewLayout
//
//  Created by Toomas Vahter on 19/01/2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

import UIKit

final class CollectionViewController: UICollectionViewController {

    // MARK: Managing the View
    
    enum ReuseIdentifier: String {
        case item = "ItemCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView!.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: ReuseIdentifier.item.rawValue)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
    }

    // MARK: Managing the Content
    
    private var items: [UIColor] = [.random(), .random(), .random()]
    
    @objc private func addItem() {
        items.append(.random())
        collectionView.insertItems(at: [IndexPath(item: items.count - 1, section: 0)])
    }
    
    // MARK: Collection View Data Source

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count > 0 ? 1 : 0
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.item.rawValue, for: indexPath) as! CircleCollectionViewCell
        cell.backgroundView?.backgroundColor = items[indexPath.item]
        cell.titleLabel.text = "\(indexPath.item)"
        return cell
    }
}

private extension UIColor {
    class func random() -> UIColor {
        return UIColor(hue: .random(in: 0.0...1.0),
                       saturation: .random(in: 0.5...1.0),
                       brightness: .random(in: 0.5...1.0), alpha: 1.0)
    }
}

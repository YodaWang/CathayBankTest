//
//  InvitingListView.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/26.
//

import UIKit

class InvitingListView: UIView {
    
    enum DisplayType {
        case Collapse
        case Expand
        
        var viewHeight:CGFloat {
            switch self {
            case .Collapse:
                return 120.0
            case .Expand:
                return 180.0
            }
        }
    }
    var collaspeConstraints:NSLayoutConstraint!
    var expandConstraints:NSLayoutConstraint!
    
    var dispalyType :DisplayType = .Collapse {
        didSet {
            switch dispalyType {
            case .Collapse:
                collectionView.setCollectionViewLayout(InvitingListCollapseLayout(), animated: true)
            case .Expand:
                collectionView.setCollectionViewLayout(UICollectionViewFlowLayout(), animated: true)
            }
            
            collaspeConstraints.isActive = dispalyType == .Collapse
            expandConstraints.isActive = dispalyType == .Expand
            
            
            collectionView.reloadData()
        }
    }
    
    var list:[Friend] = [] {
        didSet {
            if list.count == 0 {
                collaspeConstraints.isActive = false
                expandConstraints.isActive = false
            }
            else {
                collaspeConstraints.isActive = dispalyType == .Collapse
                expandConstraints.isActive = dispalyType == .Expand
            }
            collectionView.reloadData()
        }
    }
    var collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: InvitingListCollapseLayout())
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.clear
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: collectionView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: collectionView.rightAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: collectionView.leftAnchor).isActive = true
        
        collectionView.register(UINib(nibName: "InvitingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InvitingCollectionViewCell")
       
        collaspeConstraints = self.heightAnchor.constraint(equalToConstant: DisplayType.Collapse.viewHeight)
        collaspeConstraints.priority = UILayoutPriority(rawValue: 900.0)
        expandConstraints = self.heightAnchor.constraint(equalToConstant: DisplayType.Expand.viewHeight)
        expandConstraints.priority = UILayoutPriority(rawValue: 900.0)
    }
    
}

class InvitingListCollapseLayout:UICollectionViewLayout {
    
    override open var collectionView: UICollectionView {
      return super.collectionView!
    }
    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let numberOfItems = collectionView.numberOfItems(inSection: 0)

        guard numberOfItems > 0 else {
            return nil
        }
        var attributesList:[UICollectionViewLayoutAttributes] = []
        for index in 0...numberOfItems-1 {
            let indexPath = IndexPath(item: index, section: 0)
            attributesList.append(attributesForItem(indexPath: indexPath))
        }

      return attributesList
    }
    
    fileprivate func attributesForItem(indexPath: IndexPath) -> UICollectionViewLayoutAttributes {
      let attributes = UICollectionViewLayoutAttributes(forCellWith:indexPath)
        
        attributes.zIndex = -indexPath.row
        switch indexPath.row {
        case 0:
            attributes.size = CGSize(width: collectionView.bounds.width, height: 80)
            attributes.center = CGPoint(x: collectionView.bounds.midX , y: 60)
            
            break
        case 1:
            attributes.size = CGSize(width: collectionView.bounds.width - 20, height: 80)
            attributes.center = CGPoint(x: collectionView.bounds.width/2.0 , y: 60 + 10)
            break
        default:
            attributes.alpha = 0
            break
            
        }
      return attributes
    }
}

extension InvitingListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InvitingCollectionViewCell", for: indexPath) as! InvitingCollectionViewCell
        
        let friend = list[indexPath.row]
        cell.name = friend.name
        return cell
    }
    
}

extension InvitingListView:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width,
                      height: 80.0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch dispalyType {
        case.Collapse:
            dispalyType = .Expand
            break
        case .Expand:
            dispalyType = .Collapse
            break
        }
    }
}
 

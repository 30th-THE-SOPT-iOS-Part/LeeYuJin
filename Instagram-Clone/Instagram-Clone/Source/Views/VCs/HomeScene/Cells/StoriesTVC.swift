//
//  StoriesTVC.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/05/06.
//

import UIKit

class StoriesTVC: UITableViewCell {
    static let identifier = "StoriesTVC"
    
    @IBOutlet weak var storyCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNib()
        setCollectionView()
        setLayout()
    }
    
    private func registerNib(){
        let nib = UINib(nibName: StoryCVC.identifier, bundle: nil)
        storyCollectionView.register(nib, forCellWithReuseIdentifier: StoryCVC.identifier)
    }
    
    private func setCollectionView(){
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
    }
    
    private func setLayout(){
        storyCollectionView.snp.makeConstraints{
            $0.height.equalTo(72)
        }
    }
    
}

extension StoriesTVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StoryDataModel.sampleData.count
    }
    
}

extension StoriesTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCVC.identifier, for: indexPath) as? StoryCVC else { return UICollectionViewCell() }
        cell.setData(StoryDataModel.sampleData[indexPath.row])
        return cell
    }
}

extension StoriesTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 58 * widthRatio
        let height = 72 * heightRatio
        return CGSize(width: width, height: height)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

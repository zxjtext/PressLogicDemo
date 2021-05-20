//
//  appItemHeadView.swift
//  Demo
//
//  Created by 张祥军 on 2021/5/18.
//

import UIKit

class appItemHeadView: UIView {
    
    @IBOutlet var appItemCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let contentView = (Bundle.main.loadNibNamed("appItemHeadView", owner: self, options: nil)?.last as! UIView)
        contentView.frame = frame
        addSubview(contentView)
        setUI()
        loadData()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension appItemHeadView:UICollectionViewDelegate,UICollectionViewDataSource{

    func setUI(){
        appItemCollectionView.register(UINib(nibName: "appItemHeadCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: NSStringFromClass(appItemHeadCollectionViewCell.self))
        appItemCollectionView.showsHorizontalScrollIndicator = false
        appItemCollectionView.showsVerticalScrollIndicator = false
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing=10
        layout.minimumInteritemSpacing=10
        layout.itemSize = CGSize(width:150, height:200)
        layout.scrollDirection = .horizontal
        layout.sectionInset =  UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        appItemCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:appItemHeadCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(appItemHeadCollectionViewCell.self), for: indexPath) as! appItemHeadCollectionViewCell
        return cell
    }
}

extension appItemHeadView{
    
    func loadData(){
        ViewModel.shared.fetchGrossingApplicationsData { (topGrossingApplicationsModelArray) in
            
            print(topGrossingApplicationsModelArray as Any)
            
        }
    }
}

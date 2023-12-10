//
//  CollectionViewTableViewCell.swift
//  Nomik_Netflix_Clone
//
//  Created by Pinocchio on 2023/12/10.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    
    // 定義靜態常數，作為 CollectionViewTableViewCell 的識別符
    static let identifier = "CollectionViewTableViewCell"
    
    // 建立用於顯示水平集合視圖的 UICollectionView
    private let collectionView: UICollectionView = {
        // 設定集合視圖的佈局，包括單元格尺寸、滾動方向等
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        
        // 建立 UICollectionView 實例，使用上述佈局
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // 註冊集合視圖使用的單元格類型
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    // 初始化方法
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 設定單元格內容區域的背景色
        contentView.backgroundColor = .systemPink
        // 添加 UICollectionView 到單元格內容區域
        contentView.addSubview(collectionView)
        
        // 設定 UICollectionView 的委託和數據源為當前單元格
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // 需要實作的初始化方法，但是因為我們不使用 Interface Builder（Storyboards 或 XIB）來建立此單元格，因此直接 fatalError 以避免報錯
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 在單元格大小變更時，調整 UICollectionView 的大小以填滿整個單元格
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}

// 實現 UICollectionViewDelegate 和 UICollectionViewDataSource 協定
extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 返回指定位置的集合視圖單元格
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 從重用佇列中獲取集合視圖單元格
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        // 設定集合視圖單元格的背景色
        cell.backgroundColor = .green
        return cell
    }
    
    // 返回集合視圖的項目數量
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}


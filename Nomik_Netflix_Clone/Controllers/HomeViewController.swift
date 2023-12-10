//
//  HomeViewController.swift
//  Nomik_Netflix_Clone
//
//  Created by Pinocchio on 2023/12/10.
//

import UIKit

class HomeViewController: UIViewController {
    
    // 建立用於顯示主頁面內容的 UITableView
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 設定視圖背景為系統預設背景色
        view.backgroundColor = .systemBackground
        // 將 UITableView 添加到視圖中
        view.addSubview(homeFeedTable)
        
        // 設定 UITableView 的委託和數據源為當前 ViewController
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        // 設定 UITableView 的表頭視圖為一個具有指定尺寸的空 UIView
        homeFeedTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 調整 UITableView 的尺寸以填滿整個視圖
        homeFeedTable.frame = view.bounds
    }
}

// 實現 UITableViewDelegate 和 UITableViewDataSource 協定
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 回傳 UITableView 的分組數量
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    // 回傳指定分組的行數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // 返回指定位置的單元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 從重用佇列中獲取 CollectionViewTableViewCell 實例
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            // 如果無法獲取單元格，返回一個空的 UITableViewCell
            return UITableViewCell()
        }
        
        // 返回配置好的單元格
        return cell
    }
    
    // 返回指定位置的單元格高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // 返回指定分組的區塊標題高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

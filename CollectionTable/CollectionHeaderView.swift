//
//  CollectionHeaderView.swift
//  CollectionTable
//
//  Created by ZhouYang on 16/5/9.
//  Copyright © 2016年 ZhouYang. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    let label = UILabel()
    let imgView = UIImageView()
    func initView() {
        label.frame = CGRectMake(0, 20, self.frame.size.width, self.frame.size.height-20)
        self.addSubview(label)
        label.text = "欢迎关注挨踢银老师"
        label.backgroundColor = UIColor(red: 69/255, green: 208/255, blue: 203/255, alpha: 1)
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
    }
}

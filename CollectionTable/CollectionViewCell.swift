//
//  CollectionViewCell.swift
//  CollectionTable
//
//  Created by ZhouYang on 16/5/9.
//  Copyright © 2016年 ZhouYang. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var photoImageView = UIImageView()
    var nameLabel = UILabel()
    //颜色
    var cellTextColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func cellInit(){
        //设置图片
        photoImageView.frame = CGRectMake(5, 5, self.frame.width-10, self.frame.height-1)
        photoImageView.image = UIImage(named:"yin")
        self.addSubview(photoImageView)

    }
}

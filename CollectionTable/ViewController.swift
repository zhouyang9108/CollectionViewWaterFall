//
//  ViewController.swift
//  CollectionTable
//
//  Created by ZhouYang on 16/5/9.
//  Copyright © 2016年 ZhouYang. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    var customLayout:UICollectionViewFlowLayout!
    var collectionView : UICollectionView!
    var heightArray = NSMutableArray()
    var imgArray:NSArray!
    var cellId = "collectionCell"
    var headerViewId = "headerView"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customLayout = UICollectionViewFlowLayout()
        customLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        customLayout.headerReferenceSize = CGSizeMake( self.view.frame.width, 60)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: customLayout)
        collectionView.backgroundColor = UIColor.whiteColor()
        //设置代理
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.view.addSubview(collectionView)
        //注册cell
        self.collectionView.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: self.cellId)
        //注册一个headView
        self.collectionView.registerClass(CollectionHeaderView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: headerViewId)
        
        //设置高度随机数组
        for i in 0 ..< 30 {
            let height = String(100+arc4random()%160)
            self.heightArray.addObject(height)
        }
        //设置随机图片数组
        imgArray = [UIImage(named:"yin1")!,UIImage(named:"yin2")!,UIImage(named:"yin3")!,UIImage(named:"yin4")!,UIImage(named:"yin5")!]
        imgArray = [UIImage(named:"1")!,UIImage(named:"2")!,UIImage(named:"3")!,UIImage(named:"4")!,UIImage(named:"5")!]
    }
    
/*pragma mark -- UICollectionViewDataSource*/
    //定义展示的UICollectionViewCell的个数
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30;
    }
    //定义展示的Section的个数
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let height = 100+arc4random()%160
        self.heightArray.addObject(String(height))
        return CGSizeMake(100, CGFloat(height));
    }
    //设置Cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let gapCount:CGFloat = CGFloat(indexPath.row%3)
        let currentRow = indexPath.row/3
        let height = CGFloat(heightArray[indexPath.row].floatValue)
        let originX = 110*gapCount+11*(gapCount+1)
        var originY:CGFloat = CGFloat((currentRow+1)*10)
        for var i=0;i<currentRow;i++ {
            let currentIndex = Int(gapCount)+i*3
            originY = originY+CGFloat(self.heightArray[currentIndex].floatValue)
        }
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.cellId, forIndexPath: indexPath) as! CollectionViewCell
        cell.frame = CGRectMake(originX, originY, 110, height)
        cell.cellInit()
        let randomImgIndex = Int(arc4random()%5)
        let image = imgArray[randomImgIndex] as! UIImage
        cell.photoImageView.image = image
        return cell
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


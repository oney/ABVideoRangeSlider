//
//  ABProgressIndicator.swift
//  Pods
//
//  Created by Oscar J. Irun on 2/12/16.
//
//

import UIKit

class ABProgressIndicator: UIView {
    
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bundle = Bundle(for: ABStartIndicator.self)
//        let image = UIImage(named: "ProgressIndicator", in: bundle, compatibleWith: nil)
        imageView.frame = self.bounds
//        imageView.image = image
        imageView.contentMode = UIViewContentMode.scaleToFill
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        adjustAlignment()
    }
    
    func adjustAlignment() {
        if let size = imageView.image?.size, size.width != 0 {
            imageView.backgroundColor = UIColor.clear
            let ratio = size.width/size.height
            let width = self.bounds.height * ratio
            let inset = (self.bounds.width - width) / 2
            imageView.frame = CGRect(x: inset, y: 0, width: width, height: self.frame.height)
        } else {
            imageView.backgroundColor = imageView.tintColor
            imageView.frame = CGRect(x: self.bounds.midX - 1, y: 0, width: 2, height: self.bounds.height)
        }
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let frame = CGRect(x: -self.frame.size.width / 2,
                           y: 0,
                           width: self.frame.size.width * 2,
                           height: self.frame.size.height)
        if frame.contains(point){
            return self
        }else{
            return nil
        }
    }
    

}

//
//  ABStartIndicator.swift
//  selfband
//
//  Created by Oscar J. Irun on 27/11/16.
//  Copyright © 2016 appsboulevard. All rights reserved.
//

import UIKit

class ABStartIndicator: UIView {
    
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        
        let bundle = Bundle(for: ABStartIndicator.self)
        let image = UIImage(named: "StartIndicator", in: bundle, compatibleWith: nil)
        
        imageView.frame = self.bounds
        imageView.image = image
        imageView.contentMode = UIViewContentMode.scaleToFill
        self.addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        adjustAlignment()
    }
    
    func adjustAlignment() {
        if let size = imageView.image?.size, size.width != 0 {
            let ratio = size.width/size.height
            let width = self.bounds.height * ratio
            let inset = self.bounds.width - width
            imageView.frame = CGRect(x: inset, y: 0, width: width, height: self.bounds.height)
        }
    }

}

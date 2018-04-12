//
//  AlertView.swift
//  Milo
//
//  Created by Eldon Chan on 4/12/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class AlertView: UIView {

    @IBOutlet weak var alertImage: UIImageView!
    @IBOutlet weak var alertLabel: UILabel!
   
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

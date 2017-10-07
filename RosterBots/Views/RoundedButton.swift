//
//  RoundedButton.swift
//  RosterBots
//
//  Created by Yashwanth on 10/6/17.
//  Copyright © 2017 Yashwanth. All rights reserved.
//

import UIKit
/// Custom UI Class Used to create Rounded Buttons.

@IBDesignable
    class RoundedButton: UIButton {
        @IBInspectable var cornerRadius: CGFloat = 3{
            didSet{
                self.layer.cornerRadius = cornerRadius
            }
        }
    }



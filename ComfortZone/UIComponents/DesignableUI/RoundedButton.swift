//
//  RoundedButton.swift
//  ComfortZone
//
//  Created by Aung Kyaw Phyo on 27/07/2024.
//

import UIKit

class RoundedButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
    
    func setupUI() {
        self.layer.cornerRadius = self.frame.height / 2
    }
    
}

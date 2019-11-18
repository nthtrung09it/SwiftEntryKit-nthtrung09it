//
//  L5SimpleMessageView.swift
//  SwiftEntryKitDemo
//
//  Created by Nguyễn Trần Hoài Trung on 11/18/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class L5SimpleMessageView: UIView {
    // MARK: Props
    
    var thumbImageView: UIImageView!
    public let messageContentView = L5MessageContentView()
    private let message: EKSimpleMessage
    
    // MARK: Setup
    
    init(with message: EKSimpleMessage) {
        self.message = message
        super.init(frame: UIScreen.main.bounds)
        setupThumbImageView(with: message.image)
        setupMessageContentView(with: message.title,
                                description: message.description)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupThumbImageView(with content: EKProperty.ImageContent?) {
        guard let content = content else {
            return
        }
        thumbImageView = UIImageView()
        addSubview(thumbImageView)
        thumbImageView.imageContent = content
    }
    
    private func setupMessageContentView(with title: EKProperty.LabelContent,
                                         description: EKProperty.LabelContent) {
        messageContentView.titleContent = title
        messageContentView.subtitleContent = description
        addSubview(messageContentView)
    }
    
    private func setupInterfaceStyle() {
        if let image = message.image {
            thumbImageView?.tintColor = image.tint?.color(
                for: traitCollection,
                mode: image.displayMode
            )
        }
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupInterfaceStyle()
    }
}

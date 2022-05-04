//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit
import SDWebImage

class ChatTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var messageView: UIView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    // MARK: - Helper Methods
    func setupViews() {
        self.messageView.layer.cornerRadius = 10
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.height / 2
    }
    
    func fillCell(message: Message) {
        headerLabel.text = message.username
        bodyLabel.text = message.text
        profileImageView.sd_setImage(with: message.avatarURL)
    }
}

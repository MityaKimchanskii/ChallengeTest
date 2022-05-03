//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit
import SDWebImage

class ChatTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var messageView: UIView!
    
    // MARK: - Properties
    var message: Message?
    
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
        header.text = message.username
        body.text = message.text
        profileImageView.sd_setImage(with: message.avatarURL)
    }
}

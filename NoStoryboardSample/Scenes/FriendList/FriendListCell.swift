//
//  FriendListCell.swift
//  NoStoryboardSample
//
//  Created by Inder Kumar Rathore on 11/08/18.
//  Copyright © 2018 Inder Kumar Rathore. All rights reserved.
//

import UIKit
import Kingfisher

class FriendListCell: UITableViewCell {
  
  var profilePicImageView: UIImageView!
  var nameLabel: UILabel!
  var emailLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    // Design cell, assume that cell height is 100
    // Create profile image view
    profilePicImageView = UIImageView(frame: .zero)
    profilePicImageView.translatesAutoresizingMaskIntoConstraints = false // <- never forget this line
    profilePicImageView.contentMode = .scaleAspectFill
    profilePicImageView.image = #imageLiteral(resourceName: "placeholder") //placeholder image
    contentView.addSubview(profilePicImageView) // Added as sub view
    // Set the constraints on image view
    NSLayoutConstraint.activate([
      profilePicImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      profilePicImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      profilePicImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
      profilePicImageView.widthAnchor.constraint(equalTo: profilePicImageView.heightAnchor)
      ])
    profilePicImageView.clipsToBounds = true
    
    // Name label for the cell
    nameLabel = UILabel(frame: .zero)
    nameLabel.translatesAutoresizingMaskIntoConstraints = false // no I don't want you to do it
    nameLabel.font = UIFont.systemFont(ofSize: 18)
    contentView.addSubview(nameLabel)
    //Set the constraints
    NSLayoutConstraint.activate([
      nameLabel.leadingAnchor.constraint(equalTo: profilePicImageView.trailingAnchor, constant: 10),
      nameLabel.topAnchor.constraint(equalTo: profilePicImageView.topAnchor, constant: 5)
      ])
    
    // Email label for the cell
    emailLabel = UILabel(frame: .zero)
    emailLabel.translatesAutoresizingMaskIntoConstraints = false // no I don't want you to do it
    emailLabel.font = UIFont.systemFont(ofSize: 16)
    emailLabel.textColor = .gray
    contentView.addSubview(emailLabel)
    //Set the constraints
    NSLayoutConstraint.activate([
      emailLabel.leadingAnchor.constraint(equalTo: profilePicImageView.trailingAnchor, constant: 10),
      emailLabel.bottomAnchor.constraint(equalTo: profilePicImageView.bottomAnchor, constant: -10)
      ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    // Add rounded corner for the image
    self.profilePicImageView.layer.cornerRadius = self.profilePicImageView.frame.width/2
  }
}


//
//  FriendListCell.swift
//  NoStoryboardSample
//
//  Created by Inder Kumar Rathore on 11/08/18.
//  Copyright © 2018 Inder Kumar Rathore. All rights reserved.
//

import UIKit

class FriendListCell: UITableViewCell {
  
  var profilePicImageview: UIImageView!
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
    profilePicImageview = UIImageView(frame: .zero)
    profilePicImageview.translatesAutoresizingMaskIntoConstraints = false // <- never forget this line
    profilePicImageview.image = #imageLiteral(resourceName: "placeholder") //placeholder image
    contentView.addSubview(profilePicImageview) // Added as sub view
    // Set the constraints on image view
    NSLayoutConstraint.activate([
      profilePicImageview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      profilePicImageview.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      profilePicImageview.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
      profilePicImageview.widthAnchor.constraint(equalTo: profilePicImageview.heightAnchor)
      ])
    profilePicImageview.clipsToBounds = true
    profilePicImageview.backgroundColor = .blue
    
    
    // Name label for the cell
    nameLabel = UILabel(frame: .zero)
    nameLabel.translatesAutoresizingMaskIntoConstraints = false // no I don't want you to do it
    nameLabel.font = UIFont.systemFont(ofSize: 18)
    contentView.addSubview(nameLabel)
    //Set the constraints
    NSLayoutConstraint.activate([
      nameLabel.leadingAnchor.constraint(equalTo: profilePicImageview.trailingAnchor, constant: 15),
      nameLabel.topAnchor.constraint(equalTo: profilePicImageview.topAnchor, constant: 5)
      ])
    nameLabel.text = "Hello world"
    
    // Email label for the cell
    emailLabel = UILabel(frame: .zero)
    emailLabel.translatesAutoresizingMaskIntoConstraints = false // no I don't want you to do it
    emailLabel.font = UIFont.systemFont(ofSize: 16)
    emailLabel.textColor = .gray
    contentView.addSubview(emailLabel)
    //Set the constraints
    NSLayoutConstraint.activate([
      emailLabel.leadingAnchor.constraint(equalTo: profilePicImageview.trailingAnchor, constant: 15),
      emailLabel.bottomAnchor.constraint(equalTo: profilePicImageview.bottomAnchor, constant: -10)
      ])
    
    emailLabel.text = "email@example.rld"
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    // Add rounded corner for the image
    self.profilePicImageview.layer.cornerRadius = self.profilePicImageview.frame.width/2
  }
}


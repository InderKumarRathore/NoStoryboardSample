//
//  FriendDetailVC.swift
//  NoStoryboardSample
//
//  Created by Inder Kumar Rathore on 13/08/18.
//  Copyright © 2018 Inder Kumar Rathore. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher

class FriendDetailVC: UIViewController {
  // Assign this var to show the details
  public var friendMO: FriendMO?
  
  private var profilePicImageView: UIImageView!
  private var nameLabel: UILabel!
  private var emailLabel: UILabel!
  private var mapView: MKMapView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Friend"
    // Set up UI for the friend detail
    setUpUI()
    
    // Set the friend data if any
    if let friend = friendMO {
      setFriendData(friend)
    }
  }
  
  func setUpUI() {
    // Change the color for the current view
    self.view.backgroundColor = .white
    // Create profile image view
    profilePicImageView = UIImageView(frame: .zero)
    profilePicImageView.translatesAutoresizingMaskIntoConstraints = false // <- never forget this line
    profilePicImageView.contentMode = .scaleAspectFill
    profilePicImageView.image = #imageLiteral(resourceName: "placeholder")
    self.view.addSubview(profilePicImageView) // Added as sub view
    // Set the constraints on image view
    let widthImgView: CGFloat = 120.0
    NSLayoutConstraint.activate([
      profilePicImageView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 10),
      profilePicImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      profilePicImageView.heightAnchor.constraint(equalToConstant: widthImgView),
      profilePicImageView.widthAnchor.constraint(equalTo: profilePicImageView.heightAnchor)
      ])
    // Round the image view
    profilePicImageView.layer.cornerRadius = widthImgView/2
    profilePicImageView.clipsToBounds = true
    
    
    // Name label
    nameLabel = UILabel(frame: .zero)
    nameLabel.translatesAutoresizingMaskIntoConstraints = false // no I don't want you to do it
    nameLabel.font = UIFont.systemFont(ofSize: 18)
    self.view.addSubview(nameLabel)
    //Set the constraints
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: profilePicImageView.bottomAnchor, constant: 15),
      nameLabel.centerXAnchor.constraint(equalTo: profilePicImageView.centerXAnchor)
      ])
    
    // Email label
    emailLabel = UILabel(frame: .zero)
    emailLabel.translatesAutoresizingMaskIntoConstraints = false // no I don't want you to do it
    emailLabel.font = UIFont.systemFont(ofSize: 16)
    emailLabel.textColor = .gray
    self.view.addSubview(emailLabel)
    //Set the constraints
    NSLayoutConstraint.activate([
      emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
      emailLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor)
      ])
    
    //Map view
    mapView = MKMapView(frame: .zero)
    mapView.translatesAutoresizingMaskIntoConstraints = false // don't need auto translation
    self.view.addSubview(mapView)
    // Set constraints
    NSLayoutConstraint.activate([
      mapView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
      mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
      mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
      mapView.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor)
      ])
  }
  
  private func setFriendData(_ friend: FriendMO) {
    if let url = friend.imgUrl {
      self.profilePicImageView.kf.setImage(with: URL(string: url))
    }
    
    self.nameLabel.text = friend.name
    self.emailLabel.text = friend.email
    
    if friend.latitude != 0.0 && friend.longitude != 0.0 {
      let annotation = MKPointAnnotation()
      let centerCoordinate = CLLocationCoordinate2D(latitude: friend.latitude, longitude:friend.longitude)
      annotation.coordinate = centerCoordinate
      annotation.title = friend.name
      let span = MKCoordinateSpanMake(0.5, 0.5)
      let region = MKCoordinateRegion(center: centerCoordinate, span: span)
      mapView.setRegion(region, animated: true)
      mapView.addAnnotation(annotation)
    }
  }
}

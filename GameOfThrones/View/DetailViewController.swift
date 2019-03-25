//
//  DetailViewController.swift
//  GameOfThrones
//
//  Created by Eduardo Santiz on 3/24/19.
//  Copyright © 2019 EduardoSantiz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var airTimeLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

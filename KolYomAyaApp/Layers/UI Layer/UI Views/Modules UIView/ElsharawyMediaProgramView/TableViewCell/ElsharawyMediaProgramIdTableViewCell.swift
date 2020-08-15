//
//  ElsharawyMediaProgramIdTableViewCell.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/26/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit

class ElsharawyMediaProgramIdTableViewCell: UITableViewCell {

    @IBOutlet weak var titleEpsiodeLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var imageEpsiode: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(viewModel: MediaList) {
        self.titleEpsiodeLbl.text = viewModel.title
        self.sourceLbl.text = viewModel.mediaListDescription
        self.imageEpsiode.imageFromURL(urlString: viewModel.videoCover!)
    }
}

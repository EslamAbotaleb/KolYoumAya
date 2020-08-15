//
//  DetailTafserBookSelectViewModel.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/24/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
import Moya

final class DetialTafserBookSelectViewModel {
    let detailTafserBookSelectService = MoyaProvider<ApiService>()
    var tafsirBookPageByPageNumber: TafsirBookPageByPageNumber?
    func detailtafserBookSelectApi(pageNumber: Int, bookId: Int,completionHandler: @escaping (TafsirBookPageByPageNumber) -> ()) {
        detailTafserBookSelectService.request(.tafserBookPageNumber(page: pageNumber, bookId: bookId)) { (result) in
            switch (result) {
            case .success(let response):
                DispatchQueue.main.async {
                    let detailTafsirBookPageByPageNumberModel = try! JSONDecoder().decode(TafsirBookPageByPageNumber.self, from: response.data)
                    self.tafsirBookPageByPageNumber = detailTafsirBookPageByPageNumberModel
                    completionHandler(self.tafsirBookPageByPageNumber!)
                }
                break
            case .failure(let error):
                print("error Description\(error)")
                break
            }
        }
    }
    func detailTafserBookBySurahAndAyah(bookId: Int, surahId: Int,ayah: Int, completionHandler: @escaping(TafsirBookPageByPageNumber) -> ()) {
        detailTafserBookSelectService.request(.tafserBookBySurahAndAyah(bookId: bookId, surahId: surahId, ayah: ayah)) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let detyailTafsirBookBySurahAndAyah = try!
                        JSONDecoder().decode(TafsirBookPageByPageNumber.self, from: response.data)
                    self.tafsirBookPageByPageNumber = detyailTafsirBookBySurahAndAyah
                    completionHandler(self.tafsirBookPageByPageNumber!)
                }
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}

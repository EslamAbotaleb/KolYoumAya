//
//  NameItemsSidemenu.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/21/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation

//"tafserBook" = "tafserBook"
//"tafserQuarn" = "tafserQuarn"
//"quaranread" = "القرآن الكريم(قراءه)"
//"quaranlisten" = "quaranlisten"
//"khwatarelsharawy" = "khwatarelsharawy"
//"previousAyat" = "previousAyat"
//"diractionElqbla" = "diractionElqbla"
//"supportApp" = "supportApp"
//"settings" = "settings"
//"TermsAndCondition" = "TermsAndCondition"
//"privacypolice" = "privacypolice"


var menuData: [[String: String]] = []

let itemtafserBook = ["name" :
    NSLocalizedString(LocalizationKeys.SideMenu.tafserBook, comment: ""), "image" : "books"]

let itemtafserQuarn = ["name":
    NSLocalizedString(LocalizationKeys.SideMenu.tafserQuarn, comment: ""), "image": "allah"]

let itemquaranread = ["name":
    NSLocalizedString(LocalizationKeys.SideMenu.quaranread, comment: ""), "image": "quran"]

let itemquaranlisten = ["name":
    NSLocalizedString(LocalizationKeys.SideMenu.quaranlisten, comment: ""), "image" : "music_icon"]

let itemkhwatarelsharawy = ["name":
    NSLocalizedString(LocalizationKeys.SideMenu.khwatarelsharawy, comment: ""), "image": "videos_icon"]

let itempreviousAyat = ["name":
    NSLocalizedString(LocalizationKeys.SideMenu.previousAyat, comment: ""), "image" : "history"]

let itemdiractionElqbla = ["name":
    NSLocalizedString(LocalizationKeys.SideMenu.diractionElqbla, comment: ""), "image" : "kaaba"]

let itemsupportApp = ["name":
    NSLocalizedString(LocalizationKeys.SideMenu.supportApp, comment: ""), "image": "payment"]

let itemsettings = ["name" :
    NSLocalizedString(LocalizationKeys.SideMenu.settings, comment: ""), "image": "settings_icon"]

let itemTermsAndCondition = ["name" :
    NSLocalizedString(LocalizationKeys.SideMenu.TermsAndCondition, comment: ""), "image": "terms_conditions"]

let itemprivacypolice = ["name" :
    NSLocalizedString(LocalizationKeys.SideMenu.privacypolice, comment: ""), "image" : "privacy_policy"]

func addItemsInSideMenu() {
    menuData.append(itemsettings)
    menuData.append(itemquaranread)
    menuData.append(itemsupportApp)
    menuData.append(itemtafserBook)
    menuData.append(itemtafserQuarn)
    menuData.append(itempreviousAyat)
    menuData.append(itemprivacypolice)
    menuData.append(itemquaranlisten)
    menuData.append(itemdiractionElqbla)
    menuData.append(itemTermsAndCondition)
    menuData.append(itemkhwatarelsharawy)
}

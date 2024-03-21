//
//  Constants.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 14.03.2024.
//

import UIKit

enum Constants {
//MARK: - Text
    enum Text {
//MARK: BaseViewController
        static let navtitleAuth = "Вход в личный кабинет"
//MARK: AuthController
        static let textLoginLabel = "Поиск работы"
        static let textNextButton = "Продолжить"
        
        static let textLoginButton = "Войти с паролем"
        static let textSearchLabel = "Поиск сотрудников"
        static let textSearchTitle = "Размещение вакансий и доступ к базе резюме"
        static let textSearchButton = "Я ищу сотрудников" 
//MARK: ValidateController
        static let testvalidateLabel = "Отправили код на"
        static let textConfirmationButton = "Подтвердить"
        static let textValidateTitle = "Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет"
        static let textValidateLabel = "Отправили код на"
//MARK: DetailViewController
        static let textLookingNumber = "человека сейчас смотрят"
        static let textLookingNumbers = "человек сейчас смотрят"
        static let textAppliedNumber = "человек уже откликнулись"
        static let textAppliedNumbers = "человек уже откликнулись"
        
        static let questionEmployerLabel = "Задайте вопрос работодателю"
        static let questionTitle = "Он получит его с откликом на вакансию"
        static let respond = "Oткликнуться"
        static let dutiesLabel = "Ваши задачи"
        static let watchingCount = "Сейчас просматривает"
        static let person = "человек"
        static let persons = "человекa"
    }
//MARK: - Constraints
    enum Constraints {
        static let gap_10: CGFloat = 10
        static let gap_15: CGFloat = 15
        static let gap_16: CGFloat = 16
        static let gap_20: CGFloat = 20
    }
//MARK: - CornerRadius
    enum CornerRadius {
        static let radius_10: CGFloat = 10
        static let radius_12: CGFloat = 12
        static let radius_15: CGFloat = 15
        static let radius_20: CGFloat = 20
        static let radius_32: CGFloat = 32
    }
    
    
    
    
    
    
    
}

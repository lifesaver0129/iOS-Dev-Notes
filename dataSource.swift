private var dataSource: [(shortcutType: SiriShortcutsType,
        activityType: String,
        label: String,
        phrase: String,
        locales: [String])] {
        get {
            return [(shortcutType: SiriShortcutsType.news, activityType: UserActivityType.news, label: localize(.siriShortcutsNewsLabel), phrase: localize(.siriShortcutsNewsPhrase), locales: ["en"]), (shortcutType: SiriShortcutsType.photo, activityType: UserActivityType.camera, label: localize(.siriShortcutsCameraLabel), phrase: localize(.siriShortcutsCameraPhase), locales: ["en"])].filter({ item in
                item.locales.contains(NSLocale.autoupdatingCurrent.languageCode?)
            })
        }
    }
import WidgetKit
import SwiftUI

// MARK: - Модель данных
struct PrayerEntry: TimelineEntry {
    let date: Date
    let prayers: [Prayer]
    let currentPrayerKey: String?
    
    struct Prayer {
        let nameKey: String  // Ключ для локализации (например, "fajr")
        let time: String
        let icon: String
        
        var localizedName: String {
            NSLocalizedString(nameKey, comment: "")
        }
    }
}

// MARK: - Провайдер
struct PrayerProvider: TimelineProvider {
    private let userDefaults = UserDefaults(suiteName: "group.jmapps.project.majmua")
    private let prayerKeys = ["fajr", "sunrise", "dhuhr", "asr", "maghrib", "isha"]
    
    func placeholder(in context: Context) -> PrayerEntry {
        defaultPrayerEntry()
    }
    
    func getSnapshot(in context: Context, completion: @escaping (PrayerEntry) -> Void) {
        completion(defaultPrayerEntry())
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<PrayerEntry>) -> Void) {
        let now = Date()

        let prayers = prayerKeys.map { key in
            PrayerEntry.Prayer(
                nameKey: key,
                time: userDefaults?.string(forKey: "prayer_\(key)") ?? "--:--",
                icon: iconForPrayer(key)
            )
        }

        let currentPrayerKey = userDefaults?.string(forKey: "current_prayer")?.lowercased()
        var entries: [PrayerEntry] = []

        let initialEntry = PrayerEntry(date: now, prayers: prayers, currentPrayerKey: currentPrayerKey)
        entries.append(initialEntry)

        if let nextPrayer = SmallPrayerView.getNextPrayer(from: initialEntry),
           let targetDate = PrayerUtils.calculateTargetDate(for: nextPrayer, relativeTo: initialEntry),
           targetDate > now {
            
            // Добавим entry на момент наступления следующей молитвы
            let nextEntry = PrayerEntry(date: targetDate, prayers: prayers, currentPrayerKey: currentPrayerKey)
            entries.append(nextEntry)
        }

        // Завершаем таймлайн: обновится только в нужный момент
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    private func defaultPrayerEntry() -> PrayerEntry {
        let defaultPrayers = [
            PrayerEntry.Prayer(nameKey: "fajr", time: "04:12", icon: "sparkles"),
            PrayerEntry.Prayer(nameKey: "sunrise", time: "05:45", icon: "sunrise.fill"),
            PrayerEntry.Prayer(nameKey: "dhuhr", time: "12:30", icon: "sun.max.fill"),
            PrayerEntry.Prayer(nameKey: "asr", time: "15:45", icon: "sun.min.fill"),
            PrayerEntry.Prayer(nameKey: "maghrib", time: "18:38", icon: "sunset.fill"),
            PrayerEntry.Prayer(nameKey: "isha", time: "20:10", icon: "moon.stars.fill")
        ]
        return PrayerEntry(date: Date(), prayers: defaultPrayers, currentPrayerKey: nil)
    }
    
    private func iconForPrayer(_ key: String) -> String {
        switch key {
        case "fajr": return "sparkles"
        case "sunrise": return "sunrise.fill"
        case "dhuhr": return "sun.max.fill"
        case "asr": return "sun.min.fill"
        case "maghrib": return "sunset.fill"
        case "isha": return "moon.stars.fill"
        default: return "clock.fill"
        }
    }
}

// MARK: - Виджет
struct PrayerTimeWidgetEntryView: View {
    var entry: PrayerProvider.Entry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        switch family {
        case .systemSmall:
            SmallPrayerView(entry: entry)
        case .systemMedium:
            MediumPrayerView(entry: entry)
        case .accessoryCircular:
            CirclePrayerView(entry: entry)
        default:
            EmptyView()
        }
    }
}

// MARK: - Средний виджет
struct MediumPrayerView: View {
    let entry: PrayerEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(entry.prayers.enumerated()), id: \.element.nameKey) { index, prayer in
                PrayerRow(prayer: prayer, entry: entry)
                
                if index < entry.prayers.count - 1 {
                    Divider().padding(.vertical, 4)
                }
            }
        }
        .padding(.vertical, 8)
        .widgetBackground(Color(.systemBackground))
    }
}

// MARK: - Ряд молитвы
struct PrayerRow: View {
    let prayer: PrayerEntry.Prayer
    let entry: PrayerEntry
    
    var body: some View {
        let isNextPrayer = prayer.nameKey == SmallPrayerView.getNextPrayer(from: entry)?.nameKey
        
        HStack(spacing: 0) {
            Image(systemName: prayer.icon)
                .foregroundColor(isNextPrayer ? .indigo : .secondary)
                .frame(width: 16, height: 16)
                .font(.system(size: 14))
            
            Text(prayer.localizedName)
                .bold()
                .font(.system(.caption, design: .rounded))
                .foregroundColor(isNextPrayer ? .indigo : .primary)
                .padding(.horizontal, 8)
            
            Spacer()
            
            HStack(spacing: 4) {
                if isNextPrayer,
                   let targetDate = PrayerUtils.calculateTargetDate(for: prayer, relativeTo: entry) {
                    Text("\(targetDate, style: .timer)")
                        .bold()
                        .font(.system(.caption2, design: .rounded))
                        .foregroundColor(.red.opacity(0.85))
                        .multilineTextAlignment(.trailing)
                        .monospacedDigit()
                }
                
                Text(PrayerUtils.formattedTime(prayer.time))
                    .bold()
                    .font(.system(.caption2, design: .rounded))
                    .foregroundColor(isNextPrayer ? .indigo : .primary)
            }
        }
    }
}

// MARK: - Маленький виджет
struct SmallPrayerView: View {
    let entry: PrayerEntry
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if let nextPrayer = SmallPrayerView.getNextPrayer(from: entry),
                   let targetDate = PrayerUtils.calculateTargetDate(for: nextPrayer, relativeTo: entry) {
                    
                    Circle()
                        .stroke(Color.indigo, style: StrokeStyle(lineWidth: 10))
                        .shadow(radius: 0.25)
                    
                    VStack {
                        Text("\(targetDate, style: .timer)")
                            .font(.system(.headline, design: .rounded))

                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .monospacedDigit()
                        
                        Text(nextPrayer.localizedName)
                            .font(.system(.title2, design: .rounded))
                            .bold()
                            .foregroundColor(.primary)
                            .lineLimit(1)
                            .multilineTextAlignment(.center)
                        
                        Text(PrayerUtils.formattedTime(nextPrayer.time))
                            .font(.system(.headline, design: .rounded))
                            .bold()
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    Text("--:--").foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        }
        .padding(0)
        .widgetBackground(Color(.systemBackground))
    }
    
    static func getNextPrayer(from entry: PrayerEntry) -> PrayerEntry.Prayer? {
        let now = Date()

        for prayer in entry.prayers {
            if let targetDate = PrayerUtils.calculateTargetDate(for: prayer, relativeTo: entry),
               targetDate > now {
                return prayer
            }
        }
        return nil
    }
}

// MARK: - Виджет экрана блокировки
struct CirclePrayerView: View {
    let entry: PrayerEntry
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if let nextPrayer = SmallPrayerView.getNextPrayer(from: entry),
                   let targetDate = PrayerUtils.calculateTargetDate(for: nextPrayer, relativeTo: entry) {
                    VStack {
                        Text("\(targetDate, style: .timer)")
                            .font(.system(.caption2, design: .rounded))
                            .bold()
                            .multilineTextAlignment(.center)
                            .monospacedDigit()
                        
                        Text(nextPrayer.localizedName)
                            .font(.system(.caption, design: .rounded))
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        Text(nextPrayer.time)
                            .font(.system(.caption, design: .rounded))
                            .bold()
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    Text("--:--").foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .widgetBackground(Color(.systemBackground))
    }
    
    static func getNextPrayer(from entry: PrayerEntry) -> PrayerEntry.Prayer? {
        let currentTime = PrayerUtils.dateFormatter.string(from: Date())
        
        if let currentKey = entry.currentPrayerKey,
           let currentIndex = entry.prayers.firstIndex(where: { $0.nameKey == currentKey }) {
            for prayer in entry.prayers[(currentIndex + 1)...] {
                if prayer.time > currentTime {
                    return prayer
                }
            }
        }
        
        return entry.prayers.first { $0.time > currentTime } ?? entry.prayers.first
    }
}

// MARK: - Утилиты
struct PrayerUtils {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    static func calculateTargetDate(for prayer: PrayerEntry.Prayer, relativeTo entry: PrayerEntry) -> Date? {
        let timeParts = prayer.time.split(separator: ":").compactMap { Int($0) }
        guard timeParts.count == 2 else { return nil }
        
        var components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        components.hour = timeParts[0]
        components.minute = timeParts[1]
        
        if prayer.nameKey == "fajr",
           let ishaPrayer = entry.prayers.first(where: { $0.nameKey == "isha" }) {
            let ishaParts = ishaPrayer.time.split(separator: ":").compactMap { Int($0) }
            if ishaParts.count == 2 {
                var ishaComponents = components
                ishaComponents.hour = ishaParts[0]
                ishaComponents.minute = ishaParts[1]
                
                if let ishaDate = Calendar.current.date(from: ishaComponents),
                   Date() > ishaDate {
                    components.day! += 1
                }
            }
        }
        
        return Calendar.current.date(from: components)
    }
    
    static func formattedTime(_ time: String) -> String {
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "HH:mm"
            inputFormatter.locale = Locale(identifier: "en_US_POSIX")

            guard let date = inputFormatter.date(from: time) else {
                return time
            }

            let outputFormatter = DateFormatter()
            outputFormatter.timeStyle = .short
            outputFormatter.locale = Locale.current

            return outputFormatter.string(from: date)
        }
}

// MARK: - Конфигурация
struct PrayerTimeWidget: Widget {
    let kind: String = "PrayerTimeWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: PrayerProvider()) { entry in
            PrayerTimeWidgetEntryView(entry: entry)
        }
        .configurationDisplayName(NSLocalizedString("prayer_times_display_name", comment: ""))
        .description(NSLocalizedString("prayer_times_display_description", comment: ""))
        .supportedFamilies([.systemSmall, .systemMedium, .accessoryCircular])
    }
}

extension View {
    /// Применяет кастомный фон для виджета (если не нужен системный)
    func widgetBackground(_ backgroundView: some View) -> some View {
        if #available(iOSApplicationExtension 17.0, *) {
            return containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            return background(backgroundView)
        }
    }
}

struct PrayerTimeWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PrayerTimeWidgetEntryView(entry: sampleEntry)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            PrayerTimeWidgetEntryView(entry: sampleEntry)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            PrayerTimeWidgetEntryView(entry: sampleEntry)
                .previewContext(WidgetPreviewContext(family: .accessoryCircular))
        }
    }

    static var sampleEntry: PrayerEntry {
        let prayers = [
            PrayerEntry.Prayer(nameKey: "fajr", time: "04:12", icon: "sparkles"),
            PrayerEntry.Prayer(nameKey: "sunrise", time: "05:45", icon: "sunrise.fill"),
            PrayerEntry.Prayer(nameKey: "dhuhr", time: "12:30", icon: "sun.max.fill"),
            PrayerEntry.Prayer(nameKey: "asr", time: "15:45", icon: "sun.min.fill"),
            PrayerEntry.Prayer(nameKey: "maghrib", time: "18:38", icon: "sunset.fill"),
            PrayerEntry.Prayer(nameKey: "isha", time: "20:10", icon: "moon.stars.fill")
        ]
        return PrayerEntry(date: Date(), prayers: prayers, currentPrayerKey: "asr")
    }
}

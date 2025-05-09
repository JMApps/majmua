import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
    let date: Date
    let fajr: String
    let sunrise: String
    let dhuhr: String
    let asr: String
    let maghrib: String
    let isha: String
    let countdownLabel: String?
    let countdownTarget: String?
}

struct Provider: TimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(
            date: Date(),
            fajr: "--:--",
            sunrise: "--:--",
            dhuhr: "--:--",
            asr: "--:--",
            maghrib: "--:--",
            isha: "--:--",
            countdownLabel: nil,
            countdownTarget: nil
        )
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        completion(loadEntry())
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        let now = Date()
        let calendar = Calendar.current
        let baseEntry = loadEntry()
        
        let prayers: [(name: String, time: String)] = [
            ("fajr", baseEntry.fajr),
            ("sunrise", baseEntry.sunrise),
            ("dhuhr", baseEntry.dhuhr),
            ("asr", baseEntry.asr),
            ("maghrib", baseEntry.maghrib),
            ("isha", baseEntry.isha),
        ]
        
        var countdownName: String? = nil
        var countdownStart: Date? = nil
        
        for (name, timeString) in prayers {
            let components = timeString.split(separator: ":")
            if components.count == 2,
               let hour = Int(components[0]),
               let minute = Int(components[1]) {
                var prayerDate = calendar.date(bySettingHour: hour, minute: minute, second: 0, of: now)!
                if prayerDate < now {
                    prayerDate = calendar.date(byAdding: .day, value: 1, to: prayerDate)!
                }
                let minutesUntil = Int(prayerDate.timeIntervalSince(now) / 60)
                if minutesUntil >= 0 && minutesUntil <= 60 {
                    countdownName = name
                    countdownStart = prayerDate
                    break
                }
            }
        }
        
        var entries: [SimpleEntry] = []
        
        for offset in 0..<60 {
            let date = calendar.date(byAdding: .minute, value: offset, to: now)!
            var countdownText: String? = nil
            if let start = countdownStart {
                let minutesLeft = Int(start.timeIntervalSince(date) / 60)
                if minutesLeft >= 0 {
                    countdownText = "-\(minutesLeft)"
                }
            }
            
            entries.append(SimpleEntry(
                date: date,
                fajr: baseEntry.fajr,
                sunrise: baseEntry.sunrise,
                dhuhr: baseEntry.dhuhr,
                asr: baseEntry.asr,
                maghrib: baseEntry.maghrib,
                isha: baseEntry.isha,
                countdownLabel: countdownText,
                countdownTarget: countdownName
            ))
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    private func loadEntry() -> SimpleEntry {
        let userDefaults = UserDefaults(suiteName: "group.jmapps.project.majmua")
        return SimpleEntry(
            date: Date(),
            fajr: userDefaults?.string(forKey: "prayer_fajr") ?? "--:--",
            sunrise: userDefaults?.string(forKey: "prayer_sunrise") ?? "--:--",
            dhuhr: userDefaults?.string(forKey: "prayer_dhuhr") ?? "--:--",
            asr: userDefaults?.string(forKey: "prayer_asr") ?? "--:--",
            maghrib: userDefaults?.string(forKey: "prayer_maghrib") ?? "--:--",
            isha: userDefaults?.string(forKey: "prayer_isha") ?? "--:--",
            countdownLabel: nil,
            countdownTarget: nil
        )
    }
}

struct PrayerTimeWidgetEntryView: View {
    var entry: Provider.Entry

    @ViewBuilder
    func prayerText(_ key: String, icon: String, time: String) -> some View {
        let isCountdownTarget = entry.countdownTarget == key
        let countdown = entry.countdownLabel

        HStack {
            Image(systemName: icon)
            // Левая часть: название молитвы (например, "Фаджр")
            Text(LocalizedStringKey(key))
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)

            // Правая часть: время молитвы (например, "04:02")
            Text(time)
                .frame(maxWidth: .infinity, alignment: .trailing)

            // Если это целевая молитва, показываем остаток времени
            if isCountdownTarget, let countdown = countdown {
                Text(countdown)
                    .font(.system(size: 12))
                    .foregroundColor(.red)
            }
        }
        .font(.caption)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            prayerText("fajr", icon: "sunrise", time: entry.fajr)
            prayerText("sunrise", icon: "sun.haze", time: entry.sunrise)
            prayerText("dhuhr", icon: "sun.max", time: entry.dhuhr)
            prayerText("asr", icon: "sun.min", time: entry.asr)
            prayerText("maghrib", icon: "sunset", time: entry.maghrib)
            prayerText("isha", icon: "moon.stars", time: entry.isha)
        }
        .font(.system(size: 12))
        .padding(.horizontal, 0)  // Меньше отступов
    }
}

struct PrayerTimeWidget: Widget {
    let kind: String = "PrayerTimeWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                PrayerTimeWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                PrayerTimeWidgetEntryView(entry: entry)
            }
        }
        .configurationDisplayName("Prayer Times")
        .description("Shows daily prayer times and countdown to the next prayer.")
    }
}

#Preview(as: .systemSmall) {
    PrayerTimeWidget()
} timeline: {
    SimpleEntry(
        date: .now,
        fajr: "04:15",
        sunrise: "05:45",
        dhuhr: "12:30",
        asr: "16:00",
        maghrib: "19:20",
        isha: "20:45",
        countdownLabel: "-59",
        countdownTarget: "dhuhr"
    )
}

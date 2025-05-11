package jmapps.project.majmua

import android.annotation.SuppressLint
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.view.View
import android.widget.RemoteViews
import java.time.Duration
import java.time.LocalTime
import java.time.format.DateTimeFormatter

class PrayerTimeWidget : AppWidgetProvider() {

    @SuppressLint("DefaultLocale")
    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray) {
        for (appWidgetId in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.prayer_time_widget)

            val prefs = context.getSharedPreferences("HomeWidgetPreferences", Context.MODE_PRIVATE)
            val formatter = DateTimeFormatter.ofPattern("HH:mm")

            val prayers = listOf("fajr", "sunrise", "dhuhr", "asr", "maghrib", "isha")
            val now = LocalTime.now()
            var nextPrayerName: String? = null
            var minutesRemaining: Long? = null

            for (name in prayers) {
                val timeStr = prefs.getString("prayer_$name", null)
                val viewId = context.resources.getIdentifier(name, "id", context.packageName)
                views.setTextViewText(viewId, timeStr)

                if (timeStr != null) {
                    val prayerTime = try {
                        LocalTime.parse(timeStr, formatter)
                    } catch (e: Exception) {
                        null
                    }

                    if (prayerTime != null) {
                        val diff = Duration.between(now, prayerTime).toMinutes()
                        if (diff >= 1 && (minutesRemaining == null || diff < minutesRemaining)) {
                            minutesRemaining = diff
                            nextPrayerName = name
                        }
                    }
                }
            }

            if (minutesRemaining != null && nextPrayerName != null) {
                val prayerLabelResId = context.resources.getIdentifier("prayer_$nextPrayerName", "string", context.packageName)
                val localizedName = if (prayerLabelResId != 0) context.getString(prayerLabelResId) else nextPrayerName

                val hours = minutesRemaining / 60
                val minutes = minutesRemaining % 60
                val timeLeftFormatted = String.format("%02d:%02d", hours, minutes)

                val text = context.getString(R.string.prayer_countdown, localizedName, timeLeftFormatted)
                views.setTextViewText(R.id.countdown, text)
                views.setViewVisibility(R.id.countdown, View.VISIBLE)
            } else {
                views.setViewVisibility(R.id.countdown, View.GONE)
            }

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}

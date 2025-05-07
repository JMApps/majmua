import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.view.View
import android.widget.RemoteViews
import jmapps.project.majmua.R
import java.time.LocalTime
import java.time.format.DateTimeFormatter

class PrayerTimeWidget : AppWidgetProvider() {

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
                        val diff = java.time.Duration.between(now, prayerTime).toMinutes()
                        if (diff in 1..59 && (minutesRemaining == null || diff < minutesRemaining)) {
                            minutesRemaining = diff
                            nextPrayerName = name
                        }
                    }
                }
            }

            if (minutesRemaining != null && nextPrayerName != null) {
                val text = "${nextPrayerName.replaceFirstChar { it.uppercase() }}: $minutesRemaining"
                views.setTextViewText(R.id.countdown, text)
                views.setViewVisibility(R.id.countdown, View.VISIBLE)
            } else {
                views.setViewVisibility(R.id.countdown, View.GONE)
            }

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}

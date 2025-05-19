package jmapps.project.majmua

import android.app.AlarmManager
import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.view.View
import android.widget.RemoteViews
import java.time.Duration
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.LocalTime
import java.time.format.DateTimeFormatter
import java.time.format.DateTimeParseException

class PrayerTimeWidget : AppWidgetProvider() {

    companion object {
        private const val UPDATE_INTERVAL_MS = 60_000L // 1 minute
        private const val PREFS_NAME = "HomeWidgetPreferences"
        private val PRAYER_NAMES = listOf("fajr", "sunrise", "dhuhr", "asr", "maghrib", "isha")
        private val TIME_FORMATTER = DateTimeFormatter.ofPattern("HH:mm")

        const val ACTION_UPDATE = "jmapps.project.majmua.ACTION_UPDATE_WIDGET"
        private const val REQUEST_CODE = 1001
    }

    override fun onEnabled(context: Context) {
        super.onEnabled(context)
        scheduleWidgetUpdates(context)
    }

    override fun onDisabled(context: Context) {
        super.onDisabled(context)
        cancelWidgetUpdates(context)
    }

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        appWidgetIds.forEach { widgetId ->
            updateWidget(context, appWidgetManager, widgetId)
        }
    }

    override fun onReceive(context: Context?, intent: Intent?) {
        super.onReceive(context, intent)
        if (intent?.action == ACTION_UPDATE && context != null) {
            val appWidgetManager = AppWidgetManager.getInstance(context)
            val componentName = ComponentName(context, PrayerTimeWidget::class.java)
            val appWidgetIds = appWidgetManager.getAppWidgetIds(componentName)

            for (widgetId in appWidgetIds) {
                updateWidget(context, appWidgetManager, widgetId)
            }
            // Снова ставим Alarm на обновление через минуту
            scheduleWidgetUpdates(context)
        }
    }

    fun scheduleWidgetUpdates(context: Context) {
        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val intent = Intent(context, javaClass).apply {
            action = ACTION_UPDATE
        }

        val pendingIntent = PendingIntent.getBroadcast(
            context,
            REQUEST_CODE,
            intent,
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT
        )

        val triggerTime = System.currentTimeMillis() + UPDATE_INTERVAL_MS
        alarmManager.setExactAndAllowWhileIdle(
            AlarmManager.RTC_WAKEUP,
            triggerTime,
            pendingIntent
        )
    }

    private fun cancelWidgetUpdates(context: Context) {
        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val intent = Intent(context, javaClass).apply {
            action = ACTION_UPDATE
        }

        val pendingIntent = PendingIntent.getBroadcast(
            context,
            REQUEST_CODE,
            intent,
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT
        )

        alarmManager.cancel(pendingIntent)
    }

    private fun updateWidget(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int
    ) {
        try {
            val views = RemoteViews(context.packageName, R.layout.prayer_time_widget)
            val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            val now = LocalDateTime.now()
            val today = LocalDate.now()

            var nextPrayer: NextPrayerInfo? = null
            val passedPrayers = mutableListOf<String>()

            // Process each prayer time
            PRAYER_NAMES.forEach { prayerName ->
                try {
                    val timeStr = prefs.getString("prayer_$prayerName", null) ?: return@forEach

                    // Update prayer time text
                    val viewId = context.resources.getIdentifier(prayerName, "id", context.packageName)
                    if (viewId != 0) {
                        views.setTextViewText(viewId, timeStr)
                    }

                    // Parse and calculate prayer time
                    val prayerTime = try {
                        LocalTime.parse(timeStr, TIME_FORMATTER)
                    } catch (e: DateTimeParseException) {
                        return@forEach
                    }

                    val prayerDateTime = LocalDateTime.of(today, prayerTime)

                    if (prayerDateTime.isBefore(now)) {
                        passedPrayers.add(prayerName)
                    } else {
                        val minutesRemaining = Duration.between(now, prayerDateTime).toMinutes()
                        if (nextPrayer == null || minutesRemaining < nextPrayer.minutesRemaining) {
                            nextPrayer = NextPrayerInfo(prayerName, prayerDateTime, minutesRemaining)
                        }
                    }
                } catch (e: Exception) {
                }
            }

            // If all prayers passed, show next day's fajr
            if (nextPrayer == null) {
                try {
                    val fajrStr = prefs.getString("prayer_fajr", null) ?: return
                    val fajrTime = try {
                        LocalTime.parse(fajrStr, TIME_FORMATTER)
                    } catch (e: DateTimeParseException) {
                        return
                    }

                    nextPrayer = NextPrayerInfo(
                        "fajr",
                        LocalDateTime.of(today.plusDays(1), fajrTime),
                        Duration.between(now, LocalDateTime.of(today.plusDays(1), fajrTime)).toMinutes()
                    )
                } catch (e: Exception) {
                }
            }

            // Update countdown display
            updateCountdownView(context, views, nextPrayer)

            // Finally update the widget
            appWidgetManager.updateAppWidget(appWidgetId, views)
        } catch (e: Exception) {
        }
    }

    private fun updateCountdownView(
        context: Context,
        views: RemoteViews,
        nextPrayer: NextPrayerInfo?
    ) {
        if (nextPrayer == null) {
            views.setViewVisibility(R.id.countdown, View.GONE)
            return
        }

        try {
            val prayerLabelResId = context.resources.getIdentifier(
                "prayer_${nextPrayer.name}", "string", context.packageName
            )
            val prayerName = if (prayerLabelResId != 0) {
                context.getString(prayerLabelResId)
            } else {
                nextPrayer.name
            }

            val totalSeconds = Duration.between(LocalDateTime.now(), nextPrayer.dateTime).seconds
            val hours = totalSeconds / 3600
            val minutes = (totalSeconds % 3600) / 60
            val timeLeft = String.format("%02d:%02d", hours, minutes)

            views.setTextViewText(
                R.id.countdown,
                context.getString(R.string.prayer_countdown, prayerName, timeLeft)
            )
            views.setViewVisibility(R.id.countdown, View.VISIBLE)
        } catch (e: Exception) {
            views.setViewVisibility(R.id.countdown, View.GONE)
        }
    }

    private data class NextPrayerInfo(
        val name: String,
        val dateTime: LocalDateTime,
        val minutesRemaining: Long
    )
}
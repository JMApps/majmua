package jmapps.project.majmua

import android.annotation.SuppressLint
import android.app.AlarmManager
import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.view.View
import android.widget.RemoteViews
import java.time.Duration
import java.time.LocalTime
import java.time.format.DateTimeFormatter

class PrayerTimeWidget : AppWidgetProvider() {

    override fun onEnabled(context: Context) {
        super.onEnabled(context)
        scheduleMinuteUpdate(context)
    }

    override fun onDisabled(context: Context) {
        super.onDisabled(context)
        cancelMinuteUpdate(context)
    }

    private fun scheduleMinuteUpdate(context: Context) {
        val intent = Intent(context, WidgetUpdateReceiver::class.java)
        val pendingIntent = PendingIntent.getBroadcast(
            context, 0, intent, PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT
        )

        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val triggerTime = System.currentTimeMillis() + 60_000
        alarmManager.setRepeating(
            AlarmManager.RTC_WAKEUP,
            triggerTime,
            60_000,
            pendingIntent
        )
    }

    private fun cancelMinuteUpdate(context: Context) {
        val intent = Intent(context, WidgetUpdateReceiver::class.java)
        val pendingIntent = PendingIntent.getBroadcast(
            context, 0, intent, PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT
        )

        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        alarmManager.cancel(pendingIntent)
    }

    @SuppressLint("DefaultLocale")
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.prayer_time_widget)

            val prefs = context.getSharedPreferences("HomeWidgetPreferences", Context.MODE_PRIVATE)
            val formatter = DateTimeFormatter.ofPattern("HH:mm")

            val prayers = listOf("fajr", "sunrise", "dhuhr", "asr", "maghrib", "isha")

            val nowDateTime = java.time.LocalDateTime.now()
            val today = nowDateTime.toLocalDate()

            var nextPrayerName: String? = null
            var nextPrayerDateTime: java.time.LocalDateTime? = null
            var minutesRemaining: Long? = null

            val passedPrayers = mutableListOf<String>()

            // 1. Пройтись по всем молитвам и сохранить ближайшую
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
                        val prayerDateTime = java.time.LocalDateTime.of(today, prayerTime)

                        if (prayerDateTime.isBefore(nowDateTime)) {
                            passedPrayers.add(name)
                        } else {
                            val diff = Duration.between(nowDateTime, prayerDateTime).toMinutes()
                            if (minutesRemaining == null || diff < minutesRemaining) {
                                minutesRemaining = diff
                                nextPrayerName = name
                                nextPrayerDateTime = prayerDateTime
                            }
                        }
                    }
                }
            }

            // 2. Если все молитвы уже прошли, показать следующий день фаджр
            if (nextPrayerName == null) {
                val fajrStr = prefs.getString("prayer_fajr", null)
                val fajrTime = try {
                    LocalTime.parse(fajrStr, formatter)
                } catch (e: Exception) {
                    null
                }

                if (fajrTime != null) {
                    nextPrayerName = "fajr"
                    nextPrayerDateTime = java.time.LocalDateTime.of(today.plusDays(1), fajrTime)
                    minutesRemaining = Duration.between(nowDateTime, nextPrayerDateTime).toMinutes()
                }
            }

            // Отметить прошедшие молитвы
            for (passedPrayer in passedPrayers) {
                val prayerLinearId = context.resources.getIdentifier(
                    "linear_$passedPrayer", "id", context.packageName
                )
                views.setInt(prayerLinearId, "setBackgroundResource", R.drawable.rounded_stroke)
            }

            // Показать таймер до следующей молитвы
            if (nextPrayerName != null && nextPrayerDateTime != null) {
                val prayerLabelResId = context.resources.getIdentifier(
                    "prayer_$nextPrayerName", "string", context.packageName
                )
                val localizedName =
                    if (prayerLabelResId != 0) context.getString(prayerLabelResId) else nextPrayerName

                val totalSeconds = Duration.between(nowDateTime, nextPrayerDateTime).seconds
                val hours = totalSeconds / 3600
                val minutes = (totalSeconds % 3600) / 60
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

package jmapps.project.majmua

import android.appwidget.AppWidgetManager
import android.content.BroadcastReceiver
import android.content.ComponentName
import android.content.Context
import android.content.Intent

class WidgetUpdateReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val appWidgetManager = AppWidgetManager.getInstance(context)
        val componentName = ComponentName(context, PrayerTimeWidget::class.java)
        val widgetIds = appWidgetManager.getAppWidgetIds(componentName)
        PrayerTimeWidget().onUpdate(context, appWidgetManager, widgetIds)
    }
}

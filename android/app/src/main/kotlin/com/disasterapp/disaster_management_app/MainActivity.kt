package com.disasterapp.disaster_management_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel

class MainActivity : FlutterActivity() {
    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)
    private lateinit var audioService: AudioService

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        audioService = AudioService(serviceScope)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            AudioService.METHOD_CHANNEL
        ).setMethodCallHandler(audioService)

        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            AudioService.EVENT_CHANNEL
        ).setStreamHandler(audioService)
    }

    override fun onDestroy() {
        audioService.dispose()
        serviceScope.cancel()
        super.onDestroy()
    }
}

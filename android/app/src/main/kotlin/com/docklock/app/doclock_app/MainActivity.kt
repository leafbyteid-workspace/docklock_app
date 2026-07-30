package com.docklock.app.doclock_app

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "doclock/open_file"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        handleIntent(intent, flutterEngine)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)

        setIntent(intent)

        flutterEngine?.let {
            handleIntent(intent, it)
        }
    }

    private fun handleIntent(
        intent: Intent?,
        flutterEngine: FlutterEngine
    ) {
        val uri = intent?.data?.toString()

        if (uri != null) {
            MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                CHANNEL
            ).invokeMethod(
                "openFile",
                uri
            )
        }
    }
}
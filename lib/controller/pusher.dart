import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:pusher_ayoub_test/constants/end_points.dart';
import 'package:pusher_ayoub_test/constants/keys.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../models/credentials.dart';

const String _cluster = 'eu';
const String _apiKey = '3ee12a696bda6e118eca';
const connected = 'CONNECTED';

class PusherChannelProvider {
  final _pusher = PusherChannelsFlutter.getInstance();
  final _endPoints = ApiEndPoints();

  Future<void> init(Credentials user) async {
    final authNotifications = baseUrl + _endPoints.authNotifications;

    log('hak ${user.token}');
    try {
      await _pusher.init(
        apiKey: _apiKey,
        cluster: _cluster,
        onEvent: (event) {
          log('Event : $event');
        },
        authEndpoint: authNotifications,
        logToConsole: true,
        onSubscriptionError: ((message, error) {
          log('ScriptionError $message \n Error :$error');
        }),
        authParams: {
          "headers": {
            "authorization": "Bearer ${user.token}",
          },
        },
        onError: (message, code, error) {
          log('messages $message');
        },
      );
    } catch (e) {
      log("ERROR: Makaynch error gha l icha3at $e");
    }
    await _subscribe(user.userId!);
    await _pusher.connect();
  }

  Future<void> _subscribe(String userId) async {
    final channelName = 'private-hire-me-notification-$userId';
    log('channel name to connect to $channelName');
    try {
      await _pusher.subscribe(
        channelName: channelName,
        onEvent: (event) {
          if (kDebugMode) {
            print("Event received: $event");
          }
        },
      );
    } catch (e) {
      log('error on subscripe $e');
    }
  }
}

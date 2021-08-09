import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semaphore_iot_client/src/app.dart';
import 'package:semaphore_iot_client/src/models/semaphore_model.dart';
import 'package:semaphore_iot_client/src/providers/countdown_provider.dart';
import 'package:semaphore_iot_client/src/providers/semaphore_provider.dart';

void main(){
  
  Provider.debugCheckInvalidValueType = null;

  runApp(
    MultiProvider(
      providers: [
        Provider<SemaphoreProvider>(create: (_) => SemaphoreProvider()),
        FutureProvider<Semaphore>(
          create: (_) => SemaphoreProvider().fetchSemaphoreStatus, 
          initialData: Semaphore(),
          catchError: (_, error) => throw error!,
        ),
        StreamProvider<int>(
          create: (_) => CountdownProvider(initialValue: 30).countdown, 
          initialData: 30,
          catchError: (_, error) => throw error!,
        )
      ],
      child: App(),
    ),
  );
}
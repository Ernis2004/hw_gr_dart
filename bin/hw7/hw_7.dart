import 'device.dart';
import 'smart_lamp.dart';
import 'smart_speaker.dart';
import 'smart_thermostat.dart';
import 'adjustable.dart';
import 'battery_powered.dart';

void main() {
  List<Device> devices = [
    SmartLamp('Philips'),
    SmartSpeaker('JBL'),
    SmartThermostat('Xiaomi'),
  ];

  for (var device in devices) {
    device.showInfo();
    device.turnOn();

    if (device is Adjustable) {
      device.increase();
    }

    if (device is BatteryPowered) {
      device.showBattery();
    }

    print('-------------------');
  }

  print('✅All devices processed.');
  print('End of program.');
  }

#include <bluefruit.h>

#if CFG_DEBUG
  // Blocking wait for connection when debug mode is enabled via IDE
  while ( !Serial ) yield();
#endif

// BLE Service
BLEUart bleuart; // UART over BLE

const int chunkSize = 240;

void setup() {
  Serial.begin(921600);

  Serial.println("Starting BLE Image Transfer example");

  // Setup the BLE LED to be enabled on CONNECT
  Bluefruit.autoConnLed(true);

  // Configure the peripheral connection with maximum bandwidth
  Bluefruit.configPrphBandwidth(BANDWIDTH_MAX);

  // Initialize Bluefruit
  Bluefruit.begin();
  Bluefruit.setTxPower(4); // Check bluefruit.h for supported values
  Bluefruit.setName("nRF52840 Image Transfer");
  
  // Set connection parameters
  Bluefruit.Periph.setConnInterval(12, 12); // 20ms interval (16 * 1.25ms)

  // Initialize BLE UART service
  bleuart.begin();

  // Start advertising
  startAdv();

  Serial.println("Advertising started; ready for connection");
}

void startAdv(void) {
  // Advertising packet
  Bluefruit.Advertising.addFlags(BLE_GAP_ADV_FLAGS_LE_ONLY_GENERAL_DISC_MODE);
  Bluefruit.Advertising.addTxPower();
  Bluefruit.Advertising.addService(bleuart);
  Bluefruit.ScanResponse.addName();

  // Start Advertising
  Bluefruit.Advertising.restartOnDisconnect(true);
  Bluefruit.Advertising.setInterval(32, 244); // in units of 0.625 ms
  Bluefruit.Advertising.setFastTimeout(30);   // number of seconds in fast mode
  Bluefruit.Advertising.start(0);             // 0 = Don't stop advertising after n seconds  
}

void loop() {
  static uint8_t buffer[chunkSize];
  int bytesRead;

  // Continuously send data when connected
  if (Bluefruit.connected() && bleuart.notifyEnabled()) {
    // Check if there is data to send
    do {
      memset(buffer, 0, sizeof(buffer)); // Clear the buffer before use
      bytesRead = Serial.readBytes(buffer, chunkSize);

      if (bytesRead > 0) {
        bleuart.write(buffer, bytesRead);

        // Convert the buffer to a hex string and send it back via serial
        /*for (int i = 0; i < bytesRead; i++) {
          if (buffer[i] < 16) Serial.print("0");
          Serial.print(buffer[i], HEX);
        }
        Serial.println();*/
      }
    } while (Serial.available() >= chunkSize && bytesRead != 0);
  }
}

// callback invoked when central connects
void connect_callback(uint16_t conn_handle) {
  BLEConnection* connection = Bluefruit.Connection(conn_handle);
  char central_name[32] = { 0 };
  connection->getPeerName(central_name, sizeof(central_name));
  Serial.print("Connected to ");
  Serial.println(central_name);
}

// callback invoked when a connection is dropped
void disconnect_callback(uint16_t conn_handle, uint8_t reason) {
  Serial.print("Disconnected, reason = 0x");
  Serial.println(reason, HEX);
}
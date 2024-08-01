#include <bluefruit.h>

#if CFG_DEBUG
  // Blocking wait for connection when debug mode is enabled via IDE
  while ( !Serial ) yield();
#endif

// BLE Service
BLEService customService = BLEService(0x1234);
BLECharacteristic char1 = BLECharacteristic(0x2345);
BLECharacteristic char2 = BLECharacteristic(0x3456);
BLECharacteristic char3 = BLECharacteristic(0x4567);

const int chunkSize = 185; // Adjusted to 185 bytes to fit within MTU limitations

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
  Bluefruit.Periph.setConnInterval(12, 12); // 15ms interval (12 * 1.25ms)

  // Initialize BLE service and characteristics
  customService.begin();

  char1.setProperties(CHR_PROPS_WRITE_WO_RESP | CHR_PROPS_NOTIFY);
  char1.setPermission(SECMODE_OPEN, SECMODE_OPEN);
  char1.setFixedLen(chunkSize);
  char1.begin();

  char2.setProperties(CHR_PROPS_WRITE_WO_RESP | CHR_PROPS_NOTIFY);
  char2.setPermission(SECMODE_OPEN, SECMODE_OPEN);
  char2.setFixedLen(chunkSize);
  char2.begin();

  char3.setProperties(CHR_PROPS_WRITE_WO_RESP | CHR_PROPS_NOTIFY);
  char3.setPermission(SECMODE_OPEN, SECMODE_OPEN);
  char3.setFixedLen(chunkSize);
  char3.begin();

  // Start advertising
  startAdv();

  Serial.println("Advertising started; ready for connection");
}

void startAdv(void) {
  // Advertising packet
  Bluefruit.Advertising.addFlags(BLE_GAP_ADV_FLAGS_LE_ONLY_GENERAL_DISC_MODE);
  Bluefruit.Advertising.addTxPower();
  Bluefruit.Advertising.addService(customService);
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
  static int charIndex = 0;

  // Continuously send data when connected
  if (Bluefruit.connected() && (char1.notifyEnabled() || char2.notifyEnabled() || char3.notifyEnabled())) {
    // Check if there is data to send
    do {
      memset(buffer, 0, sizeof(buffer)); // Clear the buffer before use
      bytesRead = Serial.readBytes(buffer, chunkSize);

      if (bytesRead > 0) {
        if (charIndex == 0) {
          char1.write(buffer, bytesRead);
        } else if (charIndex == 1) {
          char2.write(buffer, bytesRead);
        } else {
          char3.write(buffer, bytesRead);
        }
        charIndex = (charIndex + 1) % 3; // Rotate between characteristics
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

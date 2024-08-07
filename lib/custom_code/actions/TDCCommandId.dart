class TDCCommandID {
    static const int WriteParameter = 0x12;

    static const int DeviceSystemInfo = 0x13;

    static const int SerialNumber = 0x14;

    static const int WriteDateTime = 0x1C;

    static const int SystemInfo = 0x27;

    static const int RequestReset = 0x92;

    static const int ResetFactory = 0xFF;//Reset to factory defaults

    static const int MPPTData = 0xCC;//Power acquisition
    static const int PowerMonitor = 0xCD;//Power acquisition Power Monitor Data Send

    static const int GPSDataMagnetometer = 0xE0;

    static const int GPS = 0xE6;//Send GPS command
    static const int GPSCommand = 0xDF;//Receiving GPS

    static const int DownloadData = 0xBC;


    static const int Ack = 0x98;









}
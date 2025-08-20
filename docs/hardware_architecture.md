# Hardware Architecture

```mermaid
flowchart TB
    subgraph "BeagleBone System"
        direction TB
        
        subgraph "Main Hardware"
            BB[BeagleBone Black/Green\nMain Controller]
            I2C2[I2C2 Bus\nCommunication Interface]
            UART4[UART4\nSerial Interface]
            UART1[UART1\nSerial Interface]
            GPIO[GPIO Control]
            
            BB --> I2C2
            BB --> UART4
            BB --> UART1
            BB --> GPIO
        end
        
        subgraph "I2C Peripherals"
            direction TB
            RTC[DS3231 RTC\nAddress: 0x68\nHigh Precision\nReal Time Clock]
            MPU[MPU6050\nAddress: 0x69\nMotion Tracking\n6-Axis Sensor]
            EEPROM[AT24C256\nAddress: 0x50\n256Kb Storage\nBoard Configuration]
            
            I2C2 --> RTC
            I2C2 --> MPU
            I2C2 --> EEPROM
        end

        subgraph "UART Devices"
            direction TB
            LIDAR[YD-LiDAR X4\nUART4\n360 Scanning\n5-12m Range]
            GPS[NEO-6M\nUART1\nGPS Module]
            UART4 --> LIDAR
            UART1 --> GPS
        end

        subgraph "Motor Control"
            direction TB
            MOTOR[Motor Enable\nGPIO1_28\nPin: GPMC_BEN1]
            GPIO --> MOTOR
        end
        
        subgraph "Board Configuration Storage"
            direction TB
            BoardID[Board Identification\nHardware Version\nBuild Information]
            Config[System Configuration\nPeriph Settings\nCalibration Data]
            Parameters[Operating Parameters\nSystem Settings\nFeature Flags]
            
            EEPROM --> BoardID
            EEPROM --> Config
            EEPROM --> Parameters
        end
    end
    
    style BB fill:#f96,stroke:#c63,stroke-width:3px,color:#000,font-weight:bold
    style I2C2 fill:#9cf,stroke:#36a,stroke-width:2px,color:#000,font-weight:bold
    style UART4 fill:#9cf,stroke:#36a,stroke-width:2px,color:#000,font-weight:bold
    style UART1 fill:#9cf,stroke:#36a,stroke-width:2px,color:#000,font-weight:bold
    style GPIO fill:#9cf,stroke:#36a,stroke-width:2px,color:#000,font-weight:bold
    style RTC fill:#9f9,stroke:#393,stroke-width:2px,color:#000,font-weight:bold
    style MPU fill:#9f9,stroke:#393,stroke-width:2px,color:#000,font-weight:bold
    style EEPROM fill:#ff9,stroke:#cc6,stroke-width:2px,color:#000,font-weight:bold
    style LIDAR fill:#f99,stroke:#933,stroke-width:2px,color:#000,font-weight:bold
    style GPS fill:#f99,stroke:#933,stroke-width:2px,color:#000,font-weight:bold
    style MOTOR fill:#f99,stroke:#933,stroke-width:2px,color:#000,font-weight:bold
    style BoardID fill:#fcf,stroke:#939,stroke-width:2px,color:#000,font-weight:bold
    style Config fill:#fcf,stroke:#939,stroke-width:2px,color:#000,font-weight:bold
    style Parameters fill:#fcf,stroke:#939,stroke-width:2px,color:#000,font-weight:bold

```

## Hardware Details

### Main Controller
- **BeagleBone Black/Green**
  - ARM Cortex-A8 processor
  - Multiple I2C, SPI, and UART interfaces
  - PRU real-time units
  - Supports multiple board variants

### Communication Interfaces

#### 1. I2C2 Bus
- Multiple I2C devices
- Standard mode operation
- Shared bus with multiple peripherals

#### 2. UART4
- LIDAR scanner interface
- Serial communication
- Distance measurement data

#### 3. UART1
- GPS module interface
- Serial communication
- Positioning data

#### 4. GPIO Control
- Motor enable pin (GPIO1_28/GPMC_BEN1)
- Output mode with pull-down
- Motor activation control

### I2C Peripherals

#### 1. DS3231 RTC Module
- **I2C Address**: 0x68
- **Features**:
  - High-precision real-time clock
  - Temperature-compensated crystal oscillator
  - ±2ppm accuracy
  - Battery backup
  - Temperature sensor

#### 2. MPU6050 Motion Sensor
- **I2C Address**: 0x69
- **Features**:
  - 6-axis motion tracking
  - 3-axis accelerometer
  - 3-axis gyroscope
  - Digital Motion Processor

#### 3. AT24C256 EEPROM
- **I2C Address**: 0x50
- **Specifications**:
  - 256Kb (32KB) storage capacity
  - Write protect support
  - 1 million write cycles
  - 100 years data retention
- **Usage**:
  - Board variant identification
  - System configuration storage
  - Calibration data
  - Feature flags

### Motor Control System
- **Enable Pin**: GPIO1_28 (GPMC_BEN1)
- **Configuration**:
  - Output mode
  - Pull-down enabled
  - Default state: off
- **Features**:
  - Motor activation control
  - Software-controlled enable/disable
  - Status monitoring

### LIDAR System
- **Interface**: UART4
- **Features**:
  - Distance measurement
  - Scanning capability
  - Real-time data acquisition
- **Integration**:
  - Connected via serial interface
  - Motor control for scanning
  - Data processing through main processor

### GPS Module
- **Interface**: UART1
- **Features**:
  - Standard NMEA data output
  - Serial communication
  - Built-in antenna
  - Power-saving modes

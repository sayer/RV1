//
//  BaseDG.swift
//  RV1
//
//  Created by Stephen Ayers on 7/31/19.
//  Copyright © 2019 Stephen Ayers. All rights reserved.
//

import Foundation


let GENERIC_INDICATOR_STATUS =  "1FED7"
let GENERIC_CONFIGURATION_STATUS =  "1FED8"
let GENERIC_INDICATOR_COMMAND =  "1FED9"
let DC_DIMMER_STATUS_3 =  "1FEDA"
let DC_DIMMER_COMMAND_3 =  "1FEDB"
let DC_LOAD_STATUS_2 =  "1FEDC"
let AC_LOAD_STATUS_2 =  "1FEDD"
let WINDOW_SHADE_CONTROL_STATUS =  "1FEDE"
let WINDOW_SHADE_CONTROL_COMMAND =  "1FEDF"
let DC_MOTOR_CONTROL_STATUS =  "1FEE0"
let DC_MOTOR_CONTROL_COMMAND =  "1FEE1"
let WINDOW_COMMAND =  "1FEE2"
let WINDOW_STATUS =  "1FEE3"
let LOCK_COMMAND =  "1FEE4"
let LOCK_STATUS =  "1FEE5"
let GENERATOR_DEMAND_CONFIGURATION_COMMAND =  "1FEE6"
let GENERATOR_DEMAND_CONFIGURATION_STATUS =  "1FEE7"
let INVERTER_DC_STATUS =  "1FEE8"
let TIRE_ID_COMMAND =  "1FEE9"
let TIRE_ID_STATUS =  "1FEEA"
let TIRE_TEMPERATURE_CONFIGURATION_COMMAND =  "1FEEB"
let TIRE_PRESSURE_CONFIGURATION_COMMAND =  "1FEEC"
let TIRE_PRESSURE_CONFIGURATION_STATUS =  "1FEED"
let TIRE_TEMPERATURE_CONFIGURATION_STATUS =  "1FEEE"
let TIRE_SLOW_LEAK_ALARM =  "1FEEF"
let TIRE_STATUS =  "1FEF0"
let TIRE_RAW_STATUS =  "1FEF1"
let AWNING_COMMAND =  "1FEF2"
let AWNING_STATUS =  "1FEF3"
let THERMOSTAT_SCHEDULE_COMMAND_2 =  "1FEF4"
let THERMOSTAT_SCHEDULE_COMMAND_1 =  "1FEF5"
let THERMOSTAT_SCHEDULE_STATUS_2 =  "1FEF6"
let THERMOSTAT_SCHEDULE_STATUS_1 =  "1FEF7"
let THERMOSTAT_COMMAND_2 =  "1FEF8"
let THERMOSTAT_COMMAND_1 =  "1FEF9"
let THERMOSTAT_STATUS_2 =  "1FEFA"
let FLOOR_HEAT_COMMAND =  "1FEFB"
let FLOOR_HEAT_STATUS =  "1FEFC"
let AGS_CRITERION_COMMAND =  "1FEFD"
let AGS_CRITERION_STATUS =  "1FEFE"
let GENERATOR_DEMAND_COMMAND =  "1FEFF"
let GENERATOR_DEMAND_STATUS =  "1FF80"
let ATS_ACFAULT_CONFIGURATION_COMMAND_2 =  "1FF81"
let ATS_ACFAULT_CONFIGURATION_COMMAND_1 =  "1FF82"
let ATS_ACFAULT_CONFIGURATION_STATUS_2 =  "1FF83"
let ATS_ACFAULT_CONFIGURATION_STATUS_1 =  "1FF84"
let ATS_AC_STATUS_4 =  "1FF85"
let CHARGER_ACFAULT_CONFIGURATION_COMMAND_2 =  "1FF86"
let CHARGER_ACFAULT_CONFIGURATION_COMMAND_1 =  "1FF87"
let CHARGER_ACFAULT_CONFIGURATION_STATUS_2 =  "1FF88"
let CHARGER_ACFAULT_CONFIGURATION_STATUS_1 =  "1FF89"
let CHARGER_AC_STATUS_4 =  "1FF8A"
let INVERTER_ACFAULT_CONFIGURATION_COMMAND_2 =  "1FF8B"
let INVERTER_ACFAULT_CONFIGURATION_COMMAND_1 =  "1FF8C"
let INVERTER_ACFAULT_CONFIGURATION_STATUS_2 =  "1FF8D"
let INVERTER_ACFAULT_CONFIGURATION_STATUS_1 =  "1FF8E"
let INVERTER_AC_STATUS_4 =  "1FF8F"
let GENERATOR_ACFAULT_CONFIGURATION_COMMAND_2 =  "1FF90"
let GENERATOR_ACFAULT_CONFIGURATION_COMMAND_1 =  "1FF91"
let GENERATOR_ACFAULT_CONFIGURATION_STATUS_2 =  "1FF92"
let GENERATOR_ACFAULT_CONFIGURATION_STATUS_1 =  "1FF93"
let GENERATOR_AC_STATUS_4 =  "1FF94"
let CHARGER_CONFIGURATION_COMMAND_2 =  "1FF95"
let CHARGER_CONFIGURATION_STATUS_2 =  "1FF96"
let CHARGER_EQUALIZATION_CONFIGURATION_COMMAND =  "1FF97"
let CHARGER_EQUALIZATION_CONFIGURATION_STATUS =  "1FF98"
let CHARGER_EQUALIZATION_STATUS =  "1FF99"
let HEAT_PUMP_COMMAND =  "1FF9A"
let HEAT_PUMP_STATUS =  "1FF9B"
let THERMOSTAT_AMBIENT_STATUS =  "1FF9C"
let BRIDGE_PGN_LIST =  "1FF9D"
let BRIDGE_COMMAND =  "1FF9E"
let COMPASS_CALIBRATE_COMMAND =  "1FF9F"
let COMPASS_BEARING_STATUS =  "1FFA0"
let WEATHER_CALIBRATE_COMMAND =  "1FFA1"
let ALTIMETER_COMMAND =  "1FFA2"
let ALTIMETER_STATUS =  "1FFA3"
let WEATHER_STATUS_2 =  "1FFA4"
let WEATHER_STATUS_1 =  "1FFA5"
let ATS_COMMAND =  "1FFA9"
let ATS_STATUS =  "1FFAA"
let ATS_AC_STATUS_3 =  "1FFAB"
let ATS_AC_STATUS_2 =  "1FFAC"
let ATS_AC_STATUS_1 =  "1FFAD"
let WASTEDUMP_COMMAND =  "1FFAE"
let WASTEDUMP_STATUS =  "1FFAF"
let AUTOFILL_COMMAND =  "1FFB0"
let AUTOFILL_STATUS =  "1FFB1"
let WATER_PUMP_COMMAND =  "1FFB2"
let WATER_PUMP_STATUS =  "1FFB3"
let TANK_GEOMETRY_COMMAND =  "1FFB4"
let TANK_GEOMETRY_STATUS =  "1FFB5"
let TANK_CALIBRATION_COMMAND =  "1FFB6"
let TANK_STATUS =  "1FFB7"
let DIGITAL_INPUT_STATUS =  "1FFB8"
let DC_DIMMER_COMMAND =  "1FFB9"
let DC_DIMMER_STATUS_2 =  "1FFBA"
let DC_DIMMER_STATUS_1 =  "1FFBB"
let DC_LOAD_COMMAND =  "1FFBC"
let DC_LOAD_STATUS =  "1FFBD"
let AC_LOAD_COMMAND =  "1FFBE"
let AC_LOAD_STATUS =  "1FFBF"
let CHARGER_OPS_STATUS =  "1FFC0"
let CHARGER_DCBUS_STATUS =  "1FFC1"
let CHARGER_APS_STATUS =  "1FFC2"
let CHARGER_STATISTICS_STATUS =  "1FFC3"
let CHARGER_CONFIGURATION_COMMAND =  "1FFC4"
let CHARGER_COMMAND =  "1FFC5"
let CHARGER_CONFIGURATION_STATUS =  "1FFC6"
let CHARGER_STATUS =  "1FFC7"
let CHARGER_AC_STATUS_3 =  "1FFC8"
let CHARGER_AC_STATUS_2 =  "1FFC9"
let CHARGER_AC_STATUS_1 =  "1FFCA"
let INVERTER_OPS_STATUS =  "1FFCB"
let INVERTER_DCBUS_STATUS =  "1FFCC"
let INVERTER_APS_STATUS =  "1FFCD"
let INVERTER_STATISTICS_STATUS =  "1FFCE"
let INVERTER_CONFIGURATION_COMMAND_2 =  "1FFCF"
let INVERTER_CONFIGURATION_COMMAND_1 =  "1FFD0"
let INVERTER_CONFIGURATION_STATUS_2 =  "1FFD1"
let INVERTER_CONFIGURATION_STATUS_1 =  "1FFD2"
let INVERTER_COMMAND =  "1FFD3"
let INVERTER_STATUS =  "1FFD4"
let INVERTER_AC_STATUS_3 =  "1FFD5"
let INVERTER_AC_STATUS_2 =  "1FFD6"
let INVERTER_AC_STATUS_1 =  "1FFD7"
let GENERATOR_START_CONFIG_COMMAND =  "1FFD8"
let GENERATOR_START_CONFIG_STATUS =  "1FFD9"
let GENERATOR_COMMAND =  "1FFDA"
let GENERATOR_STATUS_2 =  "1FFDB"
let GENERATOR_STATUS_1 =  "1FFDC"
let GENERATOR_AC_STATUS_3 =  "1FFDD"
let GENERATOR_AC_STATUS_2 =  "1FFDE"
let GENERATOR_AC_STATUS_1 =  "1FFDF"
let AIR_CONDITIONER_COMMAND =  "1FFE0"
let AIR_CONDITIONER_STATUS =  "1FFE1"
let THERMOSTAT_STATUS_1 =  "1FFE2"
let FURNACE_COMMAND =  "1FFE3"
let FURNACE_STATUS =  "1FFE4"
let SLIDE_MOTOR_STATUS =  "1FFE5"
let SLIDE_SENSOR_STATUS =  "1FFE6"
let SLIDE_COMMAND =  "1FFE7"
let SLIDE_STATUS =  "1FFE8"
let LEVELING_AIR_STATUS =  "1FFE9"
let HYDRAULIC_PUMP_STATUS =  "1FFEA"
let LEVELING_SENSOR_STATUS =  "1FFEB"
let LEVELING_JACK_STATUS =  "1FFEC"
let LEVELING_CONTROL_STATUS =  "1FFED"
let LEVELING_CONTROL_COMMAND =  "1FFEE"
let AAS_SENSOR_STATUS =  "1FFEF"
let AAS_STATUS =  "1FFF0"
let AAS_CONFIG_COMMAND =  "1FFF1"
let AAS_CONFIG_STATUS =  "1FFF2"
let CHASSIS_MOBILITY_COMMAND =  "1FFF3"
let CHASSIS_MOBILITY_STATUS =  "1FFF4"
let GAS_SENSOR_STATUS =  "1FFF5"
let WATERHEATER_COMMAND =  "1FFF6"
let WATERHEATER_STATUS =  "1FFF7"
let COMMUNICATION_STATUS_3 =  "1FFF8"
let COMMUNICATION_STATUS_2 =  "1FFF9"
let COMMUNICATION_STATUS_1 =  "1FFFA"
let DC_SOURCE_STATUS_3 =  "1FFFB"
let DC_SOURCE_STATUS_2 =  "1FFFC"
let DC_SOURCE_STATUS_1 =  "1FFFD"
let SET_DATE_TIME_COMMAND =  "1FFFE"
let DATE_TIME_STATUS =  "1FFFF"

struct BaseDG {
    let message: String
    let timeStamp: Date
    let location: CLongLong
    let payLoadStart = 9
    
    var payload: String {
        get {
            return payloadRange(start: payLoadStart, count: 16)
        }
    }
    
    func payloadInt8(start: Int) -> Int
    {
        let hexValue = payloadRange(start: payLoadStart+start, count:2)
        return Int(hexValue, radix:16)!
    }
    
    func payloadInt16(start: Int) -> Int
    {
        let hexValueHigh = payloadRange(start: payLoadStart+start+2, count:2)
        let hexValueLow = payloadRange(start: payLoadStart+start, count:2)
        let orderedHex = hexValueHigh + hexValueLow
        return Int(orderedHex, radix:16)!
    }
    
    var event: String
    {
        get {
        return String(payloadRange(start: 4, count:5 ))
        }
    }
    
    var source: Int
    {
        get {
        let sourceString = payloadRange(start: 1, count:2 )
        print(sourceString)
        return Int(sourceString, radix: 16)!;
        }
    }
    
    var instance: Int
    {
        get {
            return payloadInt8(start: 0)
        }
    }
    
  
    func describe() -> String
    {
        return "DG: \(event) Source: \(source) instance: \(instance) - \(DGNTable[event] ?? " * Missing") "
    }
    
    func payloadRange(start: Int, count: Int) -> String
    {
        return stringRange(string: message, start: start, count: count)
    }
    
    
    
    
    var tankSize: Int
      {
          get {
              return Int(Double(payloadInt16(start: 10))*Double(0.26))
          }
      }
      
    var tankLevel: Int
      {
          get {
              return Int(Double(payloadInt16(start: 6))*Double(0.26))
          }
      }
    
    var tankLevelPercent: Int
      {
          get {
            return Int(Double(tankLevel)/Double(tankSize)*100.0)
          }
      }
    
    var doorLocked: Bool
    {
        get {
            return payloadInt8(start: 2) != 0
        }
    }
    
}


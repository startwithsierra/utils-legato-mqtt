# SWS :: Legato MQTT Client

[![](https://img.shields.io/badge/legato-17.06-blue.svg)](http://legato.io/) [![](https://img.shields.io/badge/mangoh-WP8548-green.svg)](http://legato.io/)

> :book: This application is the MQTT Client derived from the C client provided by the Eclipse Paho project.

## <a name='TOC'>Summary</a>

- [Overview](#overview)
- [Good to know](#good2know)
- [Application Skeleton](#application-skeleton)
- [Compilation](#compilation)
- [Installation](#installation)
- [Verification](#verification)
- [Next](#next)
- [Credits](#credits)

## <a name='overview'>Overview</a>

We'll build, install and run the application with the open source Linux-based embedded
platform **Legato** toolchain + installation command line.

## <a name='good2know'>Good to know</a>

You must build, install and run the application on your board before running any application using **MQTT** protocol.<br />
You can find more informations about **MQTT** [here](https://en.wikipedia.org/wiki/MQTT)

## <a name='application-skeleton'>Application skeleton</a>

```sh
~/mhirba/sws/utils-legato-mqtt ❯❯❯ tree .
.
├── Makefile
├── ReadMe.md
├── mqtt.api
├── mqttService.adef
└── mqttComponent
    ├── Component.cdef
    ├── inc
    │   ├── json
    │   │   └── swir_json.h
    │   ├── mqtt
    │   │   ├── StackTrace.h
    │   │   ├── mqttConnect.h
    │   │   ├── mqttFormat.h
    │   │   ├── mqttPacket.h
    │   │   ├── mqttPublish.h
    │   │   ├── mqttSubscribe.h
    │   │   └── mqttUnsubscribe.h
    │   └── mqttClient.h
    ├── main.c
    └── src
        ├── json
        │   └── swir_json.c
        ├── mqtt
        │   ├── mqttConnectClient.c
        │   ├── mqttConnectServer.c
        │   ├── mqttDeserializePublish.c
        │   ├── mqttFormat.c
        │   ├── mqttPacket.c
        │   ├── mqttSerializePublish.c
        │   ├── mqttSubscribeClient.c
        │   ├── mqttSubscribeServer.c
        │   ├── mqttUnsubscribeClient.c
        │   └── mqttUnsubscribeServer.c
        └── mqttClient.c

7 directories, 27 files
```

> Credits go to [**github.com/mangOH**](https://github.com/mangoh) developers who created the base of this **MQTT** client application

## <a name='compilation'>Compilation</a>

Just using `Makefile` with the specific target [ in our case `wp85` ]

```sh
~/mhirba/sws/utils-legato-mqtt ❯❯❯ make wp85
export TARGET=wp85 ; \
mkapp -v -t wp85 \
	  -i /legato/interfaces/dataConnectionService \
	  -i /legato/interfaces/modemServices \
	  -i mqttComponent/inc \
	  -i mqttComponent/inc/mqtt \
	  mqttService.adef
    ...

~/mhirba/sws/utils-legato-mqtt ❯❯❯ ls
Makefile  ReadMe.md  _build_mqttClient	mqtt.api  mqttService.adef  mqttService.wp85.update  mqttComponent
```

## <a name='installation'>Installation</a>

Just using `app install` command with our application binary and the board IP address.

```sh
~/mhirba/sws/utils-legato-mqtt ❯❯❯ app install mqttService.wp85.update 192.168.2.2
Applying update from file 'mqttService.wp85.update' to device at address '192.168.2.2'.
The authenticity of host '192.168.2.2 (192.168.2.2)' can't be established.
RSA key fingerprint is c0:6f:59:10:20:e0:df:20:16:f8:fc:a0:89:70:16:7d.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '192.168.2.2' (RSA) to the list of known hosts.
root@192.168.2.2's password:
Unpacking package: 100% ++++++++++++++++++++++++++++++++++++++++++++++++++
Applying update: 100% ++++++++++++++++++++++++++++++++++++++++++++++++++
SUCCESS
Done
```

## <a name='verification'>Verification</a>

```sh
~/mhirba/sws/utils-legato-mqtt ❯❯❯ ssh root@192.168.2.2
root@192.168.2.2's password: *****

root@swi-mdm9x15:~# app status
[running] atClient
[running] atServer
[running] avcService
[running] dataConnectionService
...
[running] mqttService
root@swi-mdm9x15:~# logread | grep swsMqttClient
...
Jul 25 09:20:15 swi-mdm9x15 user.info Legato:  INFO | swsMqttClient[1467]/mqttComponent T=main | main.c _mqttComponent_COMPONENT_INIT() 255 | ** INIT MQTT SERVICE **
...
```

## <a name='next'>Next</a>

Well, that's it. Easy right? 😎<br />
Take a look at our other samples using the **MQTT protocol** through specific usecases like Google Cloud IoT, AWS IoT providers, etc.

## <a name='credits'>Credits</a>

Develop with :heart: by [**Majdi Toumi**](http://majditoumi.com)|[**Mhirba**](http://mhirba.com) in **Paris** for [**Sierra Wireless**](https://www.sierrawireless.com/).

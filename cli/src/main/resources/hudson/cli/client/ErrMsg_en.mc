;/***************************************************************************************
;  ©Copyright Monitrax Ltd 2000. All rights reserved.
;****************************************************************************************
;
; Project:       Wigan
; Component:     Error Message DLL
; Author:        Andrew Stickler
; Create Date:   05/Feb/2001
; Description:   The source file for Wigan error messages.
;
;****************************************************************************************
;
; Source Code Control Information (do not change this section)
;
; Filename:      $Archive: /wigan/include/FileHeader.h $
; Revision:      $Revision: 31 $
; Modified by:   $Author: Plasnier $
; Modified date: $Modtime: 1-02-01 10:26 $
;
;****************************************************************************************
;
; Compiled with MC compiler.
;
; WIGAN_FACILITY
; Each component has its own range of message codes, given below:
;
;	0x0000 - Infrastructure COM layer codes
;	0x0100 - WgnEvent status codes
;	0x0200 - ***!!!*** GENERIC status codes
;	0x0300 - Generic event store status codes
;	0x0320 - Text extractor status codes
;	0x0400 - IE Filter status codes
;	0x0500 - EMO status codes
;	0x0600 - E-mail Filter status codes
;	0x0700 - Web event store status codes
;	0x0800 - E-mail event store status codes
;   0x0840 - Instant Messaging status codes
;	0x0900 - Document/Policy Store status codes
;	0x0A00 - User Data Store/Server error codes
;	0x0B00 - GUI errors
;	0x0C00 - Bloomberg client status codes
;	0x0D00 - Event import status codes
;	0x0E00 - Content Proxy status codes
;	0x0F00 - Attribute Lookup status codes
;	0x1000 - Content Indexer status and log codes
;	0x1100 - Appmon status codes
;	0x1200 - Remote Data Manager status codes
;	0x1300 - Policy Engine status codes
;	0x1400 - SMTP Sink status codes - !!! WARNING Put log message codes in 0x1B00
;	0x1500 - Directory Lookup codes
;	0x1580 - Content Manager Interface codes.
;   0x1600 - Performance Lookup codes
;   0x1700 - Distributor / Distributor Agent status codes
;   0x1800 - Distributor / Distributor Agent log status codes
;   0x1900 - Web Console status codes
;   0x1A00 - Policy Engine Hub status codes
;	0x1B00 - SMTP Sink Log Codes - !!! WARNING Put status codes in 0x1400
;	0x1C00 - SMTP Utilities Codes
;   0x1C80 - MIME Processor status codes
;	0x1D00 - Quarantine Manager Codes
;	0x1E00 - Universal Adapter
;	0x1F00 - Domino Server Agent
;	0x2000 - Universal Adapter Status codes
;	0x2100 - SEV Integration codes
;	0x2180 - SEVDD integration codes
;	0x2200 - IRM Integration codes
;	0x2300 - EMail Helper Status codes
;	0x2400 - EMail Helper Log codes
;	0x24F0 - EMail Helper CSLD Log codes
;	0x2500 - Task Manager / Scheduler
;	0x2600 - Universal Extractor
;	0x2700 - XML Parser Log Codes 
;   0x2800 - Credentials Codes
;   0x2880 - Policy Tools Codes
;   0x2900 - RDI Log Codes
;	0x2A00 - cnv2email codes
;	0x2B00 - RDI Status Codes
;	0x2C00 - Socket Agent
;	0x2D00 - Socket Agent Log
;   0x2E00 - File Scanning Agent Log Codes
;	0x2F00 - Exchange Server Agent status codes
;	0x2F80 - Exchange Server Agent log codes
;	0x3000 - ***!!!*** GENERIC log codes
;   0x3100 - File Event Store Status Codes
;   0x3200 - WgnTask Report Module
;   0x3300 - Milter MTA Agent
;   0x3400 - FileNet integration codes
;	0x3500 - Remote Socket Agent
;	0x3600 - Policy on Print
;	0x3700 - Policy on Save 
;	0x3800 - Policy on Print/Save Common
;	0x3900 - FileChangeHandler (includes kernel filter)
;	0x3A00 - Socket Utils status codes
;	0x3B00 - Socket Utils log messages
;	0x3C00 - Proxy UI
;	0x3D00 - Client Notifications Messages
;	0x3E00 - ICAP Agent status codes
;	0x3F00 - ICAP Agent log codes
;	0x4000 - Client File Scanning Agent status codes
;	0x4100 - Client File Scanning Agent log codes
;	0x4200 - Database Scanner status codes
;	0x4300 - Database Scanner log codes
;	0x4400 - FSA Job Persistence status codes
;	0x4500 - EMC SourceOne integration
;	0x4600 - PRC Algorithm
;	0x4700 - PRC Engine
;	0x4800 - PRC Indexer
;	0x4900 - Encryption Utility status codes 
;	0x4A00 - CCS status codes
;	0x4A80 - CCS log codes
;	0x4B00 - Content Indexing Services (CIS) Content Connector status codes
;	0x4B80 - IDOL Content Provider log codes (UNDER REVIEW - MAY BE REMOVED)
;	0x4C00 - CCS Pre-scan status codes
;	0x4C80 - CCS Pre-scan log codes
;	0x4D00 - CCS Web Service API status codes
;   0x4E00 - CCS Cache Exception codes
;	0x4F00 - CCS Cache Log codes
;	0x5000 - WgnSNMP Errors.
;   0x5100 - Automatic Document Protection codes
;   0x5200 - FSRM FCI Plugin log codes
;   0x5300 - Appmon status codes
;   0x5400 - NEXT AVAILABLE
;	0xF000 - Java Exception status codes
;	0xF100 - Java Infrastructure Base errors 
;	0xF200 - Java Connection errors
;	0xF300 - Java Policy errors
;	0xF400 - Java Database errors
;	0xF500 - Java Machine Services errors
;	0xF600 - Java User Services errors
;	0xF700 - Java Logging errors
;	0xF800 - Java Messaging Services errors
;	0xF900 - Java Replication errors
;	0xFA00 - Java Database Schema errors
;	0xFB00 - Java Statistics errors
;	0xFC00 - Java File System errors
;	0xFD00 - Java Directory Services errors
;	0xFE00 - Java Data Lookup errors
;	0xFF00 - Java Provisioning Service errors

;
; WIGAN_NOTES_FACILITY
; This is used exclusively to report codes from Lotus Notes or the Wigan components of
;   Lotus Notes.
;	0x3300 - Wigan components if Lotus Notes status codes
;
; WIGAN_MAPI_ITF_FACILITY
; This is used exclusively to map FACILITY_ITF interface-specific status codes from MAPI APIs.
;   The message IDs map exactly, only the facility value changes.
;
;***************************************************************************************/


MessageIdTypedef=HRESULT

SeverityNames=(Success=0x0
               Informational=0x1
               Warning=0x2 
               Error=0x3
              )

FacilityNames=(Wigan=0x563:WIGAN_FACILITY
               Notes=0x564:WIGAN_NOTES_FACILITY
               Mapi=0x565:WIGAN_MAPI_ITF_FACILITY
              )

LanguageNames=(English=0x0409:MSG00409:1252)

;
;// Infrastructure General Error Codes
;
MessageId=0x0001
Severity=Success
Facility=Wigan
SymbolicName=WGN_SERVICE_STARTED_DEPRECATED
Language=English
Service started successfully.
.
MessageId=0x0002
Severity=Success
Facility=Wigan
SymbolicName=WGN_SERVICE_STOPPED_DEPRECATED
Language=English
Service stopped.
.
MessageId=0x0003
Severity=Error
Facility=Wigan
SymbolicName=WGN_SERVICE_BAD_REQUEST_DEPRECATED
Language=English
Bad service request.
.
MessageId=0x0004
Severity=Error
Facility=Wigan
SymbolicName=WGN_SERVICE_NOT_INSTALLED_DEPRECATED
Language=English
Handler not installed.
.
MessageId=0x0005
Severity=Error
Facility=Wigan
SymbolicName=WGN_LOGON_CANCELLED
Language=English
Login attempt canceled by user.
.
MessageId=0x0006
Severity=Error
Facility=Wigan
SymbolicName=WGN_SERVICE_FAILED_TO_START_DEPRECATED
Language=English
Service failed to start - check previous event messages for details.
.
MessageId=0x0007
Severity=Informational
Facility=Wigan
SymbolicName=WGN_SERVICE_DISABLED
Language=English
Full operation has been disabled by the Big Red Button.
.
MessageId=0x0008
Severity=Informational
Facility=Wigan
SymbolicName=WGN_COMTEST_INFO
Language=English
Created session to %1 when using comtest with %2!d! arguments.
.
MessageId=0x0009
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_UNEXPECTED_EXIT
Language=English
The infrastructure has ended unexpectedly due to the Java Virtual Machine calling exit().
.
MessageId=0x000A
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_UNEXPECTED_ABORT
Language=English
The infrastructure has ended unexpectedly due to the Java Virtual Machine calling abort().
.
MessageId=0x000B
Severity=Success
Facility=Wigan
SymbolicName=WGN_SERVICE_STARTED
Language=English
%1 started successfully.
.
MessageId=0x000C
Severity=Success
Facility=Wigan
SymbolicName=WGN_SERVICE_STOPPED
Language=English
%1 stopped.
.
MessageId=0x000D
Severity=Error
Facility=Wigan
SymbolicName=WGN_SERVICE_BAD_REQUEST
Language=English
Bad service request for %1.
.
MessageId=0x000E
Severity=Error
Facility=Wigan
SymbolicName=WGN_SERVICE_NOT_INSTALLED
Language=English
Handler not installed for %1.
.
MessageId=0x000F
Severity=Error
Facility=Wigan
SymbolicName=WGN_SERVICE_FAILED_TO_START
Language=English
%1 failed to start - check previous event messages for details.
.
MessageId=0x0010
Severity=Informational
Facility=Wigan
SymbolicName=WGN_SERVICE_RDM_SERVER_STARTED_DEPRECATED
Language=English
Remote Data Manager Server has started.
.
MessageId=0x0011
Severity=Error
Facility=Wigan
SymbolicName=WGN_SERVICE_RDM_SERVER_FAILED_DEPRECATED
Language=English
Remote Data Manager Server failed to start: %1.
.
MessageId=0x0012
Severity=Error
Facility=Wigan
SymbolicName=WGN_INFRA_NOT_RUNNING_LOCAL
Language=English
The local infrastructure has not started.
.
MessageId=0x0013
Severity=Error
Facility=Wigan
SymbolicName=WGN_INFRA_NOT_RUNNING_REMOTE
Language=English
The remote infrastructure has not started.
.
MessageId=0x0014
Severity=Error
Facility=Wigan
SymbolicName=WGN_SERVICE_FAILED_TO_INITIALISE
Language=English
%1 failed to initialize - check previous event messages for details.
.
MessageId=0x0015
Severity=Success
Facility=Wigan
SymbolicName=WGN_SERVICE_PAUSED
Language=English
%1 paused.
.
MessageId=0x0016
Severity=Success
Facility=Wigan
SymbolicName=WGN_SERVICE_RESUMED
Language=English
%1 resumed.
.
MessageId=0x0017
Severity=Error
Facility=Wigan
SymbolicName=WGN_SERVICE_EXTERNAL_ERROR
Language=English
External error code: %1.
.
MessageId=0x0018
Severity=Warning
Facility=Wigan
SymbolicName=WGN_LOG_LOGON_CANCELLED
Language=English
A user canceled the login to %1!ls!.
.
MessageId=0x0019
Severity=Error
Facility=Wigan
SymbolicName=WGN_SERVICE_EXCEPTION
Language=English
%1 raised an unhandled exception and will terminate.
.
MessageId=0x001A
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_INVALID_LOG_PATH
Language=English
The log module "%1" has defined a log path of "%2" which is invalid - will not log until fixed.  Error is "%3".
.
MessageId=0x001B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOGFILE_OPEN_FAILED
Language=English
The log module "%1" has failed to open its log file "%2".  Error is "%3".
.
;
;// Infrastructure JVM Error Codes
;

MessageId=0x0080
Severity=Error
Facility=Wigan
SymbolicName=WGN_JVM_FAIL_ATTACH_THREAD
Language=English
Failed to attach to a Java thread.
.

MessageId=0x0081
Severity=Error
Facility=Wigan
SymbolicName=WGN_JVM_FAIL_FIND_CLASS
Language=English
Failed to find a Java class.
.

MessageId=0x0082
Severity=Error
Facility=Wigan
SymbolicName=WGN_JVM_FAIL_FIND_METHOD
Language=English
Failed to find a Java method.
.

MessageId=0x0083
Severity=Success
Facility=Wigan
SymbolicName=WGN_JVM_FAIL_REDIR_OUTPUT
Language=English
Unable to redirect the Java output.
.

MessageId=0x0084
Severity=Error
Facility=Wigan
SymbolicName=WGN_JVM_FAIL_CREATE_JVM
Language=English
Failed to create the JVM.
.

MessageId=0x0085
Severity=Error
Facility=Wigan
SymbolicName=WGN_JVM_FAIL_FIND_ENTRY
Language=English
Failed to find the JVM entry point.
.
MessageId=0x0086
Severity=Error
Facility=Wigan
SymbolicName=WGN_JVM_NOT_INSTALLED
Language=English
The JVM is not installed.
.
MessageId=0x0087
Severity=Error
Facility=Wigan
SymbolicName=WGN_JVM_CLASS_LOAD_ERROR
Language=English
Failed to load a Java class.
.
MessageId=0x0088
Severity=Error
Facility=Wigan
SymbolicName=WGN_JVM_UNKNOWN_EXCEPTION
Language=English
A Java runtime error occurred.
.
MessageId=0x0089
Severity=Error
Facility=Wigan
SymbolicName=WGN_JVM_NO_CONSTRUCTOR
Language=English
An attempt was made to create a Java object without a constructor.
.
MessageId=0x008A
Severity=Error
Facility=Wigan
SymbolicName=WGN_JVM_SECOND_CHANCE_EXCEPTION
Language=English
A Java runtime second-chance exception occurred.
.
MessageId=0x008B
Severity=Error
Facility=Wigan
SymbolicName=WGN_JVM_FAILED_TO_START
Language=English
%1 failed to start because the Java Virtual Machine could not be started.
.
MessageId=0x008C
Severity=Error
Facility=Wigan
SymbolicName=WGN_JVM_NO_SUCH_OBJECT_EXCEPTION
Language=English
A request to the server failed because the server has removed its reference to the information. This can be caused by the server losing its network connection, having its system clock changed or going into a stand-by state. A re-start of the server will usually resolve the issue.
.
MessageId=0x008D
Severity=Error
Facility=Wigan
SymbolicName=WGN_JVM_CONNECTION_EXCEPTION
Language=English
The connection to the server cannot be made. There may be a network connectivity problem.
.
MessageId=0x008E
Severity=Error
Facility=Wigan
SymbolicName=WGN_JVM_UNMARSHALL_EXCEPTION
Language=English
A request to the remote server failed because there was a communication problem.  This can be caused by the loss of the network connection or by the remote server's Infrastructure being stopped.
.
;
;// WgnEvent coclass implementation of IWgnEvent.
;
MessageId=0x0100
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EVENT_ALREADY_LOADED
Language=English
Data associated with this event has already been loaded.
.
MessageId=0x0101
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_EVENT_STORE
Language=English
No captured data has been associated with this event.
.
MessageId=0x0102
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_STORE
Language=English
The data in the event store is incomplete or invalid or is not an event store.
.
MessageId=0x0103
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNSUPPORTED_STORE_TYPE
Language=English
The type of the event store is unknown or unsupported.
.
;
;// Quite Generic codes (0x200 - 0x2FF)
;//
;//*******************************************************************
;// WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;//
;// ONLY PUT GENERIC STATUS CODES IN THIS SECTION - NO SPECIFIC CODES!
;// ONLY PUT STATUS CODES IN THIS SECTION - NO LOG CODES!
;//
;// WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;//*******************************************************************
;
MessageId=0x0200
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOCKED
Language=English
The operation failed on the object because it is locked, and waiting is not an option.
.
MessageId=0x0201
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_DATA
Language=English
The actual data is invalid.
.
MessageId=0x0202
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DATA_UNDERFLOW
Language=English
Less data is available than expected or required, especially on reading.
.
MessageId=0x0203
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DATA_OVERFLOW
Language=English
Too much data is available, especially on writing.
.
MessageId=0x0204
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALREADY_EXISTS
Language=English
Already exists.
.
MessageId=0x0205
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_OUT_OF_RESOURCES
Language=English
No more resources can be allocated.
.
MessageId=0x0206
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOCK_FAILED
Language=English
The lock failed to be acquired (within the specified timeout).
.
MessageId=0x0207
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NODATA
Language=English
There is no data.
.
MessageId=0x0208
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DATA_CONFLICT
Language=English
Some data cannot be read or written because there is already some data in its destination.
.
MessageId=0x0209
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_STREAM
Language=English
The stream object is bad, invalid or corrupted.
.
MessageId=0x020A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOT_INITIALISED
Language=English
Not initialized.
.
MessageId=0x020B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALREADY_INITIALISED
Language=English
Already initialized.
.
MessageId=0x020C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_DATA_TYPE
Language=English
The type of some data is invalid.
.
MessageId=0x020D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_DATA_FORMAT
Language=English
The format of some data is invalid.
.
MessageId=0x020E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNKNOWN_IDHANDLE
Language=English
An ID or handle is unknown.
.
MessageId=0x020F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_SOME_ATTRIBUTES_UNKNOWN
Language=English
Some attributes are unknown.
.
MessageId=0x0210
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_VERSION
Language=English
The version is invalid.
.
MessageId=0x0211
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_NO_DATA
Language=English
There is no data. This is not an error.
.
MessageId=0x0212
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TOO_MANY_FAILURES
Language=English
An operation failed and was retried too many times.
.
MessageId=0x0213
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_API_OUTPUT
Language=English
The output of an API call is invalid.
.
MessageId=0x0214
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_ARRAY_INDEX
Language=English
An invalid array index was provided, that would have indexed memory outside of the valid array bounds.
.
MessageId=0x0215
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOURCE_DATA_ERROR
Language=English
The source data is inaccessible, invalid, incomplete or unknown.
.
MessageId=0x0216
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NULL_PARAM
Language=English
Expecting a value and found a NULL parameter.
.
MessageId=0x0217
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DIAG_1
Language=English
Error Diagnostic Code #1. This error is not real. It is a fake used for debugging purpose.
.
MessageId=0x0218
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DIAG_2
Language=English
Error Diagnostic Code #2. This error is not real. It is a fake used for debugging purpose.
.
MessageId=0x0219
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_DIAG_1
Language=English
Info Diagnostic Code #1. This info code is not real. It is a fake used for debugging purpose.
.
MessageId=0x021A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_DIAG_2
Language=English
Info Diagnostic Code #2. This info code is not real. It is a fake used for debugging purpose.
.
MessageId=0x021B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BUFFER_TOO_SMALL
Language=English
The output buffer is too small.
.
MessageId=0x021C
Severity=Success
Facility=Wigan
SymbolicName=WGN_W_BUFFER_TOO_SMALL
Language=English
The output buffer is too small. It was filled to capacity and more data is still available.
.
MessageId=0x021D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_WAIT_ON_EVENT
Language=English
Waiting on an Event returned an unexpected result.
.
MessageId=0x021E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CAUGHT_UNKNOWN_EXCEPTION
Language=English
Caught an unknown exception type.
.
MessageId=0x021F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SYNCHRONIZATION_OBJECT_ABANDONED
Language=English
A synchronization object has been abandoned.
.
MessageId=0x0220
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_CAST
Language=English
A type cast failed.
.
MessageId=0x0221
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_PERFMON_OBJECT
Language=English
Failed to initialize a performance monitor counter or object.
.
MessageId=0x0222
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_COULD_NOT_PARSE_STRING_TREE
Language=English
Failed to parse a string into a string tree structure.
.
;
;// WGN_E_FAILED_TO_CREATE_SYNCHRONIZATION_OBJECT shouldn't be here - it's a log message.
MessageId=0x0223
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_CREATE_SYNCHRONIZATION_OBJECT
Language=English
Failed to create a synchronization object in '%1'. Extended error was '%2'.
.
;
;// WGN_E_FAILED_TO_DELETE_SYNCHRONIZATION_OBJECT shouldn't be here - it's a log message.
MessageId=0x0224
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_DELETE_SYNCHRONIZATION_OBJECT
Language=English
Failed to delete a synchronization object in '%1'. Extended error was '%2'.
.
;
;// WGN_E_UNEXPECTED_WAIT_RESULT shouldn't be here - it's a log message.
MessageId=0x0225
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNEXPECTED_WAIT_RESULT
Language=English
Failed to wait for a synchronization object in '%1'. Wait returned and unexpected result.
.
;
;// WGN_E_FAILED_TO_OPEN_SYNCHRONIZATION_OBJECT shouldn't be here - it's a log message.
MessageId=0x0226
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_OPEN_SYNCHRONIZATION_OBJECT
Language=English
Failed to open a synchronization object '%1' in '%2'. Extended error was '%3'.
.
MessageId=0x0227
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOTIMPL_ANYMORE
Language=English
This API is no longer implemented. It might have been superseded.
.
MessageId=0x0228
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_HRES_FILTER_FAILED
Language=English
The HRESULT filter failed. More info available from GetErrorInfo.
.
MessageId=0x229
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_REGISTRY_TYPE
Language=English
The expected data type of a registry value is invalid.
.
MessageId=0x22A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_REGISTRY_DATA
Language=English
The data within the registry value is invalid.
.
MessageId=0x22B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOT_FOUND
Language=English
Not found.
.
;// WGN_E_NOTES_PASSWORD_NOT_FOUND shouldn't be here - it's not generic; it's specific to Lotus Notes.
MessageId=0x22C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOTES_PASSWORD_NOT_FOUND
Language=English
Unable to obtain the Lotus Notes password.
.
;// WGN_E_BAD_USER_MESSAGE shouldn't be here - it's not generic; it's specific to a Wigan policy.
MessageId=0x022D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_USER_MESSAGE
Language=English
Syntax error in 'Message to Users' setting.
.
MessageId=0x022E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNKNOWN_COMMAND
Language=English
Unknown command.
.
MessageId=0x022F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TOO_BIG
Language=English
Value or data size is too big.
.
MessageId=0x0230
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_PENDING
Language=English
The operation that was requested is pending completion.
.
MessageId=0x0231
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_REJECTED
Language=English
The operation was rejected.
.
MessageId=0x0232
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SHUTDOWN
Language=English
Terminated or shut down.
.
MessageId=0x0233
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_CONFIG
Language=English
Invalid settings or configuration.
.
MessageId=0x0234
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNKNOWN_CONFIG_PARM
Language=English
Unknown or unsupported setting or configuration parameter.
.
MessageId=0x0235
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MISSING_CONFIG_PARM
Language=English
Missing setting or configuration parameter.
.
MessageId=0x0236
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_CONFIG_PARM_VALUE
Language=English
Invalid or unsupported value of a setting or configuration parameter.
.
;// Use WGN_W_PARTIAL_SUCCESS (rather than WGN_W_SOME_ERRORS) to report partial success when you don't know in
;//  advance (or at the end) how much 'success' to expect.
;//  For instance, we got some results from a search, but there may be more and we couldn't get them.
MessageId=0x0237
Severity=Success
Facility=Wigan
SymbolicName=WGN_W_PARTIAL_SUCCESS
Language=English
The operation was only partially successful. Some results may be missing.
.
;// Use WGN_W_SOME_ERRORS (rather than WGN_W_PARTIAL_SUCCESS) to report partial success when you know in advance
;//  how much should be done or returned, and some of that failed.
;//  For instance, 10 files deleted out of a list of 20; 5 properties queried successfully in a table of 7.
MessageId=0x0238
Severity=Success
Facility=Wigan
SymbolicName=WGN_W_SOME_ERRORS
Language=English
The operation was only partially successful. Some parts of it failed.
.
MessageId=0x0239
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TIMEOUT
Language=English
The operation timed out.
.
MessageId=0x023A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DELAY
Language=English
Some delay occurred.
.
MessageId=0x023B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_OBJECT_CHANGED
Language=English
The object or data has changed outside of the process currently manipulating it.
.
MessageId=0x023C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOT_SUPPORTED
Language=English
The requested feature or function is not supported.
.
;//*******************************************************************
;// WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;//
;// ONLY PUT GENERIC STATUS CODES IN THE SECTION ^ABOVE^ - NO SPECIFIC CODES!
;// ONLY PUT STATUS CODES IN THE SECTION ^ABOVE^ - NO LOG CODES!
;//
;// WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;//*******************************************************************

;
;// Generic event store codes (0x300 - )
;
MessageId=0x0300
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MISSING_ATTRIBUTE
Language=English
An item header (or another attribute container) is invalid because at least one compulsory attribute is missing.
.
MessageId=0x0301
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNRECOGNISED_ITEM_TYPE
Language=English
An event store failed to load because the chosen loader didn't recognize an item type (possible wrong loader).
.
MessageId=0x0302
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_NOT_ALL_ITEMS_LOADED
Language=English
The event store loader refused to load some items. The loading succeeded overall.
.
MessageId=0x0303
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_NOT_ALL_ITEMS_SAVED
Language=English
The event store loader refused to save some items. The saving succeeded overall.
.
MessageId=0x0304
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_NOT_ALL_MARKED
Language=English
One or more individual bit in the Mark() bitmask failed when marking or unmarking. The marking succeeded overall.
.
;
;// Codes used for info status reporting (part of Generic event store codes)
;
MessageId=0x0305
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_UNKNOWN_STATUS
Language=English
The status is unknown.
.
MessageId=0x0306
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_NOT_SAVED
Language=English
It was not necessary to save the data.
.
MessageId=0x0307
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_SAVED_NO_DATA
Language=English
The data was saved, but it was empty.
.

;// (WGN_W_SAVED_NOT_POPULATED) The data was marked but not populated.
MessageId=0x0308
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_SAVED_NOT_POPULATED
Language=English
The data was not saved.
.

;// (WGN_W_SAVED_NOT_COMPLETE) Only individual items (flag, string) of the data which are not empty or zero can be relied upon.
;// Refer to secondary error code(s).
MessageId=0x0309
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_SAVED_NOT_COMPLETE
Language=English
The data may not be complete.
.
MessageId=0x030A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ERROR_SAVED_NO_DATA
Language=English
The data could not be saved.
.

;// (WGN_E_ERROR_SAVED_SOME_DATA) An error prevented some of the data from being saved
MessageId=0x030B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ERROR_SAVED_SOME_DATA
Language=English
The data could be only partially saved.
.
MessageId=0x030C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_SECURITY_NOT_DETERMINED
Language=English
The security information for the email could not be determined.
.
;
;// Codes used for the text extractor
;
MessageId=0x0320
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNRECOGNISED_DOC_TYPE
Language=English
The type of the document cannot be determined, and as a result no text extractor can handle the document.
.
MessageId=0x0321
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_DOC_TYPE_HANDLER
Language=English
The type of the document was determined, but there is no text extractor available for it.
.
MessageId=0x0322
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNSUPPORTED_DOC_TYPE_FORMAT
Language=English
The type of the document was determined, but its version or format is not supported.
.
MessageId=0x0323
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_UNRELIABLE_DOC_TYPE
Language=English
The type of the document could not be positively determined.
The text extracted might not be real text, or might be of poor quality.
.
MessageId=0x0324
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_SUMMARY_INFO_ONLY
Language=English
The type of the document could not be positively determined, or its version or format is not supported.
Only the summary information is available.
.
MessageId=0x0325
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNSUPPORTED_DOC_SOURCE
Language=English
The interface passed to a textor as the source of a document, was not supported by the textor.
.
MessageId=0x0326
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SUSPECT_NO_TEXT_IN_DOC
Language=English
The type of the document indicates that it is unlikely to contain text.
.
MessageId=0x0327
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MULTITEXTOR_UNAVAILABLE
Language=English
The Stellent Text extractor is not installed.
.
MessageId=0x0328
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_STAT_INFO_ONLY
Language=English
STAT information only is available for the document.
.
MessageId=0x0329
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EXTERNAL_API_TIMEOUT
Language=English
Timeout occurred while extracting text from file.
.
MessageId=0x032a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TIMEOUT_WHILE_TEXT_STRIPPING
Language=English
Timeout occurred while extracting text from file %1.
.
MessageId=0x032b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EXTERNAL_API_EXCEPTION
Language=English
An exception occurred while extracting text from a file.
.
MessageId=0x032c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DOCUMENT_CONTENT_PROTECTED
Language=English
The content could not be retrieved from a document because the document was protected.
.
MessageId=0x032d
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DOCUMENT_CONTENT_UNAVAILABLE
Language=English
Document content could not be retrieved.
.
MessageId=0x032e
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SUB_DOCUMENT_PROTECTED
Language=English
A sub document could not be retrieved from an archive file because the archive was protected.
.
MessageId=0x032f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DODGY_PLAIN_TEXT
Language=English
Stellent says the document is plain text, but it may well not be. Dropping through to our textors.
.
MessageId=0x0330
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_TEXT_STRIP_ERROR_LOG
Language=English
Failed to strip text from file. Event title: '%1', Filename: '%2', Error: %3.
.
MessageId=0x0331
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TEXT_RPC_TIMEOUT_ERROR
Language=English
RPC call failed. Probable timeout.
.
MessageId=0x0332
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_STELLENT_INIT
Language=English
Failed to initialize Stellent text extractor.
.
MessageId=0x0333
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_TEXT_STRIP_ERROR
Language=English
Failed to strip text from file.
.
MessageId=0x0334
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_POPULATE_ATTACHMENT_ERROR
Language=English
Failed to populate attachment. Event title: '%1', Filename: '%2', Error: %3.
.
MessageId=0x0335
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WGNMULTI_CALL_CANCELLED
Language=English
Timed out RPC call to Stellent text extractor.
.
MessageId=0x0336
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_KEYVIEW_INIT
Language=English
Failed to initialize keyview.
.
MessageId=0x0337
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_KEYVIEW_EXTRACT
Language=English
Failed to initialize keyview archive extractor.
.
MessageId=0x0338
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_KEYVIEW_REDIRECT_INPUT_STREAM
Language=English
Failed to open document using redirected IO.
.
MessageId=0x0339
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_KEYVIEW_DLLS_NOT_FOUND
Language=English
Failed to initialize keyview. Keyview dlls not found.
.
MessageId=0x033A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UBT_INIT
Language=English
Failed to initialize Binary Text Extractor.
.
MessageId=0x033B
Severity=Warning
Facility=Wigan
SymbolicName=WGN_E_UBT_PARTIAL_INIT
Language=English
Initialized Binary Text Extractor but some configuration elements contained errors.
.
MessageId=0x033C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UBT_CONFIG_FILE
Language=English
Failed to open Binary Text Extractor config file.
.
MessageId=0x033D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CONFIG_FILE_UNMODIFIED
Language=English
The Binary Text Extractor config file has not been modified since it was last loaded.
.
MessageId=0x033E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WFS_ABSOLUTE_PATH
Language=English
The Infrastructure File System path is not absolute.
.
MessageId=0x033F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WFS_FILESYTEM_NOT_INITIALISED
Language=English
The Infrastructure File System has not been initialized.
.
MessageId=0x0340
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WFS_INVALID_FILEPATH
Language=English
The Infrastructure File System file path is invalid.
.
MessageId=0x0341
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WFS_CREATE_ICOMBOSTREAM
Language=English
An error occurred creating an instance of a Combo Stream.
.
;
;// IE Filter status codes.
;
MessageId=0x0400
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_ATTACH_STATUSBAR
Language=English
Failed to attach to the status bar.
.
MessageId=0x0401
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_GET_MIME_TYPE
Language=English
Failed to determine the mime type of an entry in the IE cache.
.
MessageId=0x0402
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_TOPMOST_FRAME
Language=English
The event being loaded has no HTML frame to display.
.

;
;// EMO status codes.
;
MessageId=0x0500
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MISSING_EVENT_FILTER
Language=English
A required trigger cannot be generated by the available installed filters.
.
MessageId=0x0501
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLIENT_NOT_REGISTERED
Language=English
A method on the Sequence Manager interface was made before the client had registered.
.
MessageId=0x0502
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMO_FAILED
Language=English
An undefined failure occurred in the Event Manager.
.
MessageId=0x0503
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SM_FAILED
Language=English
An undefined failure occurred in the Sequence Manager.
.
MessageId=0x0504
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CM_FAILED
Language=English
An undefined failure occurred in the Collection Manager.
.
MessageId=0x0505
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FURL_FAILED
Language=English
An undefined failure occurred in the URL Filter.
.
MessageId=0x0506
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_DUPLICATE_TRIGGER_NOT_CREATED
Language=English
A duplicate instance of an existing trigger was not created - This trigger type cannot have multiple instances.
.
MessageId=0x0507
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FILTER_FAILED
Language=English
An undefined failure occurred in a Filter.
.
MessageId=0x0508
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FHEUR_FAILED
Language=English
An undefined failure occurred in the Heuristic Filter.
.
MessageId=0x0509
Severity=Error
Facility=Wigan
SymbolicName=WGN_W_CLIENT_ACTION_REQUIRED
Language=English
Event analysis requires the Client to perform additional actions, (these must be obtained from the event).
.
MessageId=0x050a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_EVENT_TYPE
Language=English
The event type is invalid for the operation.
.
MessageId=0x050b
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DO_NOT_SAVE
Language=English
The event or sequence must not be saved.
.
MessageId=0x050c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EVENT_IDENTITY_CORRUPTED
Language=English
The identity of an event has been changed illegally.
.
MessageId=0x050d
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CLOSING_DOWN
Language=English
The Sequence Manager has been closed down, and no more calls may be made.
.
MessageId=0x050e
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_USER_CANCEL
Language=English
The User canceled an operation.
.
MessageId=0x050f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_RECIPIENTS
Language=English
A transmitted email contained zero recipients.
.
MessageId=0x0510
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CONFIGEXISTS
Language=English
The specified configuration already exists in the extractor.
.
MessageId=0x0511
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ERRORINCONFIG
Language=English
An error occurred while parsing the configuration file. Use the debug interface to get a full report.
.
MessageId=0x0512
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CONFIGDOESNOTEXIST
Language=English
The specified configuration could not be found.
.
MessageId=0x0513
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WAIT_FOR_THREAD_TIMEOUT
Language=English
A timeout occurred while waiting for a worker thread to complete.
.
MessageId=0x0514
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WAIT_IN_THREAD_TIMEOUT
Language=English
A timeout occurred in a worker thread while waiting to be told to complete.
.
MessageId=0x0515
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FILTER_DOES_NOT_SUPPORT_CLIENT
Language=English
The filter does not support events from the given client.
.
MessageId=0x0516
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_ARCHIVE_STATE_TRANSITION
Language=English
Archiving a sequence (in the Collection Manager) caused an invalid transition in the archive state of the sequence.
.
MessageId=0x0517
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_ARCHIVE_STATE
Language=English
A sequence is in an invalid archive state in the Collection Manager.
.
MessageId=0x0518
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_END_OF_STREAM
Language=English
The end of a stream was reached.
.
MessageId=0x0519
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_START_OF_STREAM
Language=English
The start of a stream was reached.
.
MessageId=0x051a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DUPLICATE_MAP_ENTRY
Language=English
A map entry could not be added as an entry with the same key already exists.
.
MessageId=0x051b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_MATCHING_STATE
Language=English
No state transition existed for the given input.
.
MessageId=0x051c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_PARSER
Language=English
No token parser has been initialized.
.
MessageId=0x051d
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_PDF_OBJECT_FORMAT
Language=English
An object extracted from a PDF did not have the correct format.
.
MessageId=0x051e
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_STREAM_BUFFER_PEEK_FAILED
Language=English
Could not get the next char from a stream buffer
.
MessageId=0x051f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MISSING_MAP_ENTRY
Language=English
A map entry does not contain a valid value
.
MessageId=0x0520
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MISSING_TRAILER
Language=English
The PDF trailer has not been initialized
.
MessageId=0x0521
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_STREAM_OPERATION
Language=English
An invalid operation was performed on a stream.
.
MessageId=0x0522
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNSUPPORTED_FILTER_TYPE
Language=English
The filter type is not currently supported.
.
MessageId=0x0523
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CORRUPT_SEQUENCE
Language=English
The sequence contains corrupted event data
.
MessageId=0x0524
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_NOT_AVAILABLE;
Language=English
The Policy Store interface has not been successfully initialized
.
MessageId=0x0525
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CM_TERMINATED_UNEXPECTEDLY;
Language=English
The Collection Manager process terminated unexpectedly.
.
MessageId=0x0526
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CM_REQUIRED_RESTART;
Language=English
The Collection Manager process (wgncm.exe) required a restart after terminating unexpectedly.
.
MessageId=0x0527
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INFRASTRUCTURE_SUSPENDED;
Language=English
The infrastructure is currently suspended.
.
MessageId=0x0528
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_EVENT_CLIENT_TYPE;
Language=English
The supplied event contained an invalid client type.
.
MessageId=0x0529
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_NOT_A_USER;
Language=English
The supplied user does not have a valid login.
.
MessageId=0x052A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CLIENT_NOT_ENABLED;
Language=English
There are no enabled triggers for the specified client - No further processing of the event will occur.
.
MessageId=0x052B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SM_ABORTED_REENTRANT_CALL;
Language=English
An attempt to capture an event was aborted in the Sequence Manager because an outstanding event had not completed processing.
.
MessageId=0x052C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DATA_TYPES_CONFLICT;
Language=English
The type of data passed in does not match the existing data.
.
MessageId=0x052D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_DATA_IN_FACTORY;
Language=English
There is no data in the factory to match against.
.
MessageId=0x052E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_MATCH_LISTS_SET;
Language=English
There are no match lists set in the matcher.
.
MessageId=0x052F
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_CACHED_VALUE_RETURNED;
Language=English
The match has returned a cached value
.
MessageId=0x0530
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INDEX_OUT_OF_BOUNDS;
Language=English
The array index is out of bounds
.
MessageId=0x0531
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_KEYSTRING_SYNTAX_ERROR_LOG;
Language=English
Policy ID '%1': Keystring syntax error in trigger '%2' : Error '%3' in expression '%4'.
.
MessageId=0x0532
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLASSIFIER_KEYSTRING_SYNTAX_ERROR;
Language=English
Policy ID '%1': Keystring syntax error in Classifier '%2', parameter %3 : Error '%4' in expression '%5'.
.
MessageId=0x0533
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLASSIFIER_SYNTAX_ERROR_LOG;
Language=English
Policy ID '%1': Syntax error in Classifier '%2' : Error '%3' at line '%4'.
.
MessageId=0x0534
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CONTENT_AGENT_SYNTAX_ERROR_LOG;
Language=English
Policy ID '%1': Syntax error in Content Agent '%2', error '%3'.
.
MessageId=0x0535
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QUARANTINE_ACTION_NOT_CREATED;
Language=English
Quarantine action from trigger '%1' could not be performed for email with subject '%2'.  Quarantine is not allowed for the email client type.
.
MessageId=0x0536
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLIENT_TYPE_SERIAL_MISMATCH;
Language=English
The supplied event contained a client type which does not match the processing mode (serial/asynchronous) of the registered client type.
.
MessageId=0x0537
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_KEYSTRING_SYNTAX_ERROR;
Language=English
Syntax error in keystring.
.
MessageId=0x0538
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLASSIFIER_SYNTAX_ERROR;
Language=English
Syntax error in Classifier.
.
MessageId=0x0539
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CONTENT_AGENT_SYNTAX_ERROR;
Language=English
Syntax error in Content Agent.
.
MessageId=0x053A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAIL_DIRECTION_NOT_SET;
Language=English
The direction of the email in the factory has not been set.
.
MessageId=0x053B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INCOMING_MAIL_HAS_NO_SENDER;
Language=English
The email is incoming but it has no sender.
.
MessageId=0x053C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_OUTGOING_MAIL_HAS_NO_RECIPS
Language=English
The email is outgoing, but has no recipients.
.
MessageId=0x053D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_TOP_LEVEL_URL_IN_FACTORY
Language=English
There is no top-level URL in the matcher factory.
.
MessageId=0x053E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INCORRECT_FACTORY_TYPE
Language=English
The factory has been initialized with the incorrect data type for this operation.
.
MessageId=0x053F
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_TRIGGER_NOT_CREATED_BY_RANDOM_SAMPLING
Language=English
An instance of a trigger was not created because random sampling was enabled in policy.
.
;// Message used for reporting - not a processing error code
MessageId=0x0540
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PARTICIPANT_IS_ANONYMOUS
Language=English
An event with subject '%1' contained an anonymous participant (missing email address and display name).
.
;// Message used for reporting - not a processing error code
MessageId=0x0541
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PARTICIPANT_HAS_DISPLAY_NAME_ONLY
Language=English
An event with subject '%1' contained a participant with a missing email address. The display name was '%2'.
.
;// Message used for reporting - not a processing error code
MessageId=0x0542
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_SAVE_EVENT_LOG
Language=English
An event with subject '%1' could not be saved. See the following message for more details...
.
;// Message used for reporting - not a processing error code
MessageId=0x0543
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EVENT_SAVING_GENERAL_ERROR
Language=English
Event saving failed with error '%1'.
.
;// Message used for reporting - not a processing error code
MessageId=0x0544
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_INIT_LONG_DOMAIN_ENDINGS
Language=English
Failed to initialize the list of long domain endings.
.
;// Message used for reporting - not a processing error code
MessageId=0x0545
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_LONG_DOMAIN_ENDING
Language=English
Failed to initialize the list of long domain endings. The long domain ending '%1' is invalid.
.
;// Message used for reporting - not a processing error code
MessageId=0x0546
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PREVIOUS_EVENT_NOT_COMPLETED
Language=English
The previous event was not completed - it will be discarded.
.
MessageId=0x0547
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DEFERRED_COMPLETION_NOT_POSSIBLE
Language=English
Second pass processing was invoked illegally.
.
MessageId=0x0548
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CANNOT_ABORT_SEQUENCE
Language=English
Event processing is not could not be aborted in the current client.
.
MessageId=0x0549
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PENDING_COMPLETION
Language=English
Event processing succeeded, pending completion.
.
MessageId=0x054A
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_NEXT_TOKEN_FROM_STREAM
Language=English
The next token must be obtained from the stream
.
MessageId=0x054B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ITEM_NOT_BEING_TRACKED
Language=English
Could not track the state of an item - the item is not known.
.
MessageId=0x054C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ITEM_ALREADY_BEING_TRACKED
Language=English
Could not track the state of a new item - the item is already being tracked.
.
MessageId=0x054D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XHEADER_PROC_LOG
Language=English
Syntax error in Embedded Message Identification setting: '%1'.
.
MessageId=0x054E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XHEADER_PROC_ERR
Language=English
Syntax error in Embedded Message Identification setting.
.
MessageId=0x054F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MATCHER_FACTORY_NOT_INITIALISED
Language=English
A call to the Matcher Factory was made before it was initialized.
.
MessageId=0x0550
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CANNOT_MOVE_EXTERNAL_RECIPIENTS
Language=English
Policy was configured to 'Move External recipients to BCC' but there is no definition of 'Internal Emails' in policy.
.
MessageId=0x0551
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LEGALHOLD_ACTION_WRONG_CLIENT;
Language=English
Trigger '%1' was not created for an email with subject '%2'. The associated legal hold action is not allowed for this client type.
.
MessageId=0x0552
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LEGALHOLD_ACTION_NOT_ENABLED;
Language=English
Trigger '%1' was not created for an email with subject '%2'. The associated legal hold action is not enabled.
.
MessageId=0x0553
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CANNOT_RESOLVE_LOOKUP_EARLY;
Language=English
The lookup could not be performed 'fast' as requested, and should be retried later on.
.
;// Message used for reporting - not a processing error code
MessageId=0x0554
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MISMATCHING_CATEGORIES;
Language=English
Policy configuration error detected: The label for an existing category '%1' has conflicting definitions '%2' & '%3'.
.
;// Message used for reporting - not a processing error code
MessageId=0x0555
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_PARSE_CATEGORIES;
Language=English
Policy configuration error detected: The categories defined in trigger '%1' could not be parsed.  Error was '%2'.
.
;// Message used for reporting - not a processing error code
MessageId=0x0556
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_EXTERNAL_MAIL_ID_TOO_LONG
Language=English
An event with subject '%1' contained an 'External ID' that was too long. The ID will therefore not be stored.  The ID was '%2'.
.
;// Message used for reporting - not a processing error code
MessageId=0x0557
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_PARSE_CATEGORY_SCORE;
Language=English
The score for the following category is badly configured:. %1( %2 ). All categories for this trigger will be ignored until this issue is rectified.
.
MessageId=0x0558
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_SEVERITY_VALUE
Language=English
The severity specified for trigger '%1' uses invalid characters or is outside the allowed range.
.
MessageId=0x0559
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FILE_ACTION_REQUIRES_WRITE_ACCESS
Language=English
Could not create a delete or replace client action for trigger '%1' while analysing a file with name '%2'. The action requires write access to the file, which was not granted.
.
MessageId=0x055A
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FILE_IMPORT_POLICY_NOT_ENABLED
Language=English
A file could not be analysed because Import Policy for files is not licensed.
.
MessageId=0x055B
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_EMAIL_IMPORT_POLICY_NOT_ENABLED
Language=English
An email could not be analysed because Import Policy for emails is not licensed.
.
MessageId=0x055C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_COULD_NOT_CREATE_DIALOG
Language=English
A control dialog could not be created - This can be caused by the Policy Engine running as a named user.
.
MessageId=0x055D
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FILE_SMART_TAG_ACTION_REQUIRES_WRITE_ACCESS
Language=English
Could not add smart tags specified in trigger '%1' while analysing a file with name '%2'. The action requires write access to the file, which was not granted.
.
MessageId=0x055E
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_BLOCK_WITH_NOTIFICATION_NOT_SUPPORTED_LOG
Language=English
Could not generate a notification for the 'block with notification' action specified in trigger '%1' while analysing an email with subject '%2'. The client does not support notification messages.
.
MessageId=0x055F
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_WARN_NOT_SUPPORTED_LOG
Language=English
Could not generate a notification for the 'warn' action specified in trigger '%1' while analysing an email with subject '%2'. The client does not support notification messages.
.
MessageId=0x0560
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_INFORM_NOT_SUPPORTED_LOG
Language=English
Could not generate a notification for the 'inform' action specified in trigger '%1' while analysing an email with subject '%2'. The client does not support notification messages.
.
MessageId=0x0561
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FILTER_PROCESSING_ERROR_LOG
Language=English
Failed to analyze event with title '%1'. Error '%2'.
.
MessageId=0x0562
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FILE_REPLACE_ACTION_NOT_SUPPORTED_CAN_DELETE
Language=English
Could not create a 'replace' action for trigger '%1' while processing event '%2' of type '%3' as the event type does not support it.   The file will be deleted instead.
.
MessageId=0x0563
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CANNOT_CREATE_EXTERNAL_MAIL_ID
Language=English
Failed to generate an 'External ID' for the event with subject '%1' due to '%2'. The ID will therefore not be stored. 
.
MessageId=0x0564
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FILE_DELETE_ACTION_NOT_SUPPORTED
Language=English
Could not create a 'delete' action for trigger '%1' while processing event '%2' of type '%3'.   The event type does not support being deleted.
.
MessageId=0x0565
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FILE_REPLACE_ACTION_NOT_SUPPORTED_NO_DELETE
Language=English
Could not create a 'replace' action for trigger '%1' while processing event '%2' of type '%3' as the event type does not support it.   No control action will be taken.
.
MessageId=0x0566
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QUARANTINE_ACTION_NOT_CREATED_NOT_RELEASABLE;
Language=English
Quarantine action from trigger '%1' could not be performed for email with subject '%2'.  The email format cannot be released from quarantine.
.
MessageId=0x0567
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ENCRYPT_ACTION_NOT_CREATED;
Language=English
Encrypt action from trigger '%1' could not be performed for file '%2'.  Encryption is not possible for the Print or Network Boundary agents.
.
MessageId=0x0568
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ENCRYPT_ACTION_NOT_CREATED_FOR_NETWORK_DRIVE;
Language=English
Encrypt action from trigger '%1' could not be performed for file '%2'.  Encryption is not possible for files copied to network drives.
.
MessageId=0x0569
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DIAGNOSTIC_STAGE_STATE_BAD;
Language=English
This function cannot be performed as the current stage is in an unexpected state.
.
MessageId=0x056A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DIAGNOSTIC_GOAL_STATE_BAD;
Language=English
This function cannot be performed as the goal is in an unexpected state.
.
MessageId=0x056B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DIAGNOSTIC_GOAL_NOTFOUND;
Language=English
The specified goal was not found.
.
MessageId=0x056C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DIAGNOSTIC_GOAL_INVALID_ID;
Language=English
The specified goal ID is invalid and possibly belongs to a different stage.
.
MessageId=0x056D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DIAGNOSTIC_NODELEVEL_UNEXPECTED;
Language=English
The current node level was unexpected. Aborting operation.
.
MessageId=0x056E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DIAGNOSTIC_FILECREATE_FAILED;
Language=English
Failed to create the diagnostic file.
.
MessageId=0x056F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DIAGNOSTIC_FILEWRITE_FAILED;
Language=English
Failed to write to the diagnostic file.
.
;
;// E-mail Filter status codes.
;
MessageId=0x0600
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_SEQUENCE_MANAGER_SESSION
Language=English
The operation failed because we failed to register with the Sequence Manager.
.
MessageId=0x0601
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_OFFICE_NOT_INSTALLED
Language=English
Could not find the locations of the Microsoft Office add-ins directories.
This is probably because no version of Microsoft Office or Outlook is installed.
.
MessageId=0x0602
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DISTLIST_EXPANSION_FAILED
Language=English
A recipient which is a distribution list could not be fully recursively expanded into its individual members.
.
MessageId=0x0603
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INSTALL_FAILED_AND_OLD_INSTALL_DESTROYED
Language=English
The installation of the email agent failed and we had to remove the previous installation.
.
MessageId=0x0604
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_RECIPIENT
Language=English
The recipient's name is empty, invalid, or ambiguous.
.
MessageId=0x0605
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOTES_NOT_INSTALLED
Language=English
Could not find the locations of the Lotus Notes directories.
This is probably because no version of Lotus Notes is installed.
.
MessageId=0x0606
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_GAL_UNREACHABLE
Language=English
There is no global address directory or list available, or it could not be reached.
.
MessageId=0x0607
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DISTLIST_TOO_BIG
Language=English
A recipient which is a distribution list is too large to be fully expanded into its individual members.
.
MessageId=0x0608
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMBEDDED_MSG_ATTACH_NOT_IMPL
Language=English
This attachment (or an attachment in this event) is an embedded message. This event doesn't support embedded message attachments.
.
MessageId=0x0609
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_EMBEDDED_MSG_ATTACH_NOT_DIRECTIONAL_EMAIL
Language=English
The attachment is an embedded message which is not an incoming or outgoing email, e.g. a task. It was not captured.
.
MessageId=0x060A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_OUTLOOK_DISABLED_PLUGIN
Language=English
Microsoft Outlook has disabled the %1 Outlook Extension (%2).
.
MessageId=0x060B
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_LOG_OUTLOOK_DISABLED_PLUGIN_REPAIRED
Language=English
Microsoft Outlook has disabled the %1 Outlook Extension (%2), but %3 has re-enabled it.
.
MessageId=0x060C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_LOG_OUTLOOK_REENABLED_PLUGIN
Language=English
The %1 Outlook Extension (%2) has been re-enabled.
.
MessageId=0x060D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_LOAD_RICHED20
Language=English
Failed to load RichEd20.dll.
.
MessageId=0x060E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NUM_EXPANDED_RECIPIENTS_LIMIT_REACHED
Language=English
The maximum number of recipients to collect from expanding distribution lists has been reached - expanding has stopped.
.
MessageId=0x060F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PLUGIN_DISABLED
Language=English
The email agent is disabled.
.
MessageId=0x0610
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_EMBEDDED_MSG_ATTACH_CAPTURE_ALL_WARNING
Language=English
The embedded message attachment was captured but might be incomplete. It might also not be an actual email message (e.g. a task).
.
MessageId=0x0611
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EJ_PARSING_SYNTAX_ERROR
Language=English
Syntax error while parsing the body of the envelope journaling email: List of P1 recipients might be incomplete.
.
MessageId=0x0612
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_OUTLOOK_BAD_REG
Language=English
The %1 Outlook extension is active, but is not installed correctly.
Internal info: %2.
.
MessageId=0x0613
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_LOG_OUTLOOK_UNSUPPORTED_VERSION
Language=English
The %1 Outlook extension does not recognize the current version of Outlook.
Internal info: %2.
.
MessageId=0x0614
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_LOG_OUTLOOK_BAD_REG_PICKUP_FIXED
Language=English
The %1 Outlook extension was not correctly registered with Outlook. This is now corrected but will not take effect until Outlook is restarted.
Internal info: %2.
.
MessageId=0x0615
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_LOG_OUTLOOK_BAD_REG_PICKUP
Language=English
The %1 Outlook extension was not correctly registered with Outlook. This could not be corrected.
Internal info: %2.
.
MessageId=0x0616
Severity=Warning
Facility=Wigan
SymbolicName=WGN_E_LOG_OUTLOOK_BAD_ADDRESS_BOOK
Language=English
The %1 Outlook extension was unable to fully access the Outlook address book. This may affect application of policy for the rest of this Outlook session.
.
MessageId=0x0617
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MOVE_RECIPIENTS_ACTION
Language=English
The email will not be sent because the 'move recipients to BCC' action failed.
.
;
;// Web event store status codes.
;
MessageId=0x0700
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WS_MULTIPLE_WRITERS_UNSUPPORTED
Language=English
An attempt was made to modify a section of an event that is currently being modified.
.
MessageId=0x0701
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WS_LOAD_FULL_UNSUPPORTED
Language=English
The web event store needs to reference its input stream whilst active.
.
;
;// E-mail event store status codes.
;
MessageId=0x0800
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CANNOT_CHANGE_BODY_FORMAT
Language=English
Once set, the format of a body item cannot be changed.
.
MessageId=0x0801
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INCOMPLETE_EMAIL_ADDRESS
Language=English
An incorrectly initialized email address was used.
.
;
;// Instant Messaging status codes.
;
MessageId=0x0840
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_XML_PARSE
Language=English
XML syntax error while parsing IM conversation.
.
MessageId=0x0841
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_XML_SCHEMA
Language=English
The XML file is a bad format.
.
MessageId=0x0842
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_NO_MESSAGES
Language=English
The import file did not contain any messages.
.
MessageId=0x0843
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_BAD_USER
Language=English
The user specified in the message is invalid.
.
MessageId=0x0844
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_FACETIME_ID_CONVERSION_EXPRESSION
Language=English
Invalid Facetime ID Conversion Expression.
.
MessageId=0x0845
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_MINDALIGN_ID_CONVERSION_EXPRESSION
Language=English
Invalid MindAlign ID Conversion Expression.
.
MessageId=0x0846
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_XML_PARSER
Language=English
Failed to create the XML parser.
.
MessageId=0x0847
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IMMANAGER_ID_CONVERSION_EXPRESSION
Language=English
Invalid IM Manager ID Conversion Expression.
.
MessageId=0x0848
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_ATTACHMENT_TOO_BIG
Language=English
Attachment too big.
.
MessageId=0x0849
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IB_XML_INVAILD_SCHEMA
Language=English
Unsupported Instant Bloomberg XML schema.
.
MessageId=0x084a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IB_XML_NO_MESSAGES
Language=English
No messages found in Instant Bloomberg XML log.
.
MessageId=0x084b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_XML_INVAILD_SCHEMA
Language=English
Unsupported Bloomberg Email XML schema.
.
MessageId=0x084c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_XML_NO_MESSAGES
Language=English
No messages found in Bloomberg Email XML log.
.
MessageId=0x084d
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_XML_NO_END_MESSAGE
Language=English
End of message not found in XML log. Try increasing view size.
.
MessageId=0x084e
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_NO_EST_TIMEZONE
Language=English
EST Timezone not available from registry. Cannot convert timestamps to UTC.
.
MessageId=0x0850
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_TITLE
Language=English
Instant Messaging file parser %1.%2.%3.%4.
.
MessageId=0x0851
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_UNDERLINE
Language=English
-----------------------------------------
.
MessageId=0x0852
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMFRONTEND_WINDOWS_VERSION
Language=English
The application is not supported on this version of Microsoft Windows.
.
MessageId=0x0853
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMFRONTEND_MOVE_FAILED_FILE
Language=English
Unable to move failed file "%1" to "%2" - %3.
.
MessageId=0x0854
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IMFRONTEND_CMDLINE_PARMS
Language=English
Warning: All command line parameters are ignored.
.
MessageId=0x0855
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMFRONTEND_DESTINATION_DIR
Language=English
Final destination directory %1 does not exist.
.
MessageId=0x0856
Severity=Error
Facility=Wigan
SymbolicName=WGN_W_IMFRONTEND_OPTION_NOT_SUPPORTED
Language=English
Warning: Option "%1" is no longer supported.
Please refer to the documentation for details.
.
MessageId=0x0857
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMFRONTEND_INIT_COM
Language=English
Unable to initialize COM library - %1. Shell link resolution will not be available.
.
MessageId=0x0858
Severity=Error
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_NOTHING_TO_DO
Language=English
Nothing to do.
.
MessageId=0x0859
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_TERMINATING
Language=English
Process terminating.
.
MessageId=0x085A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_SHORTCUT_FILE
Language=English
Found a shortcut file "%1"
.
MessageId=0x085B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMFRONTEND_SHORTCUT_FILE
Language=English
The shortcut could not be resolved.
.
MessageId=0x085C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_SHORTCUT_RESOLVED
Language=English
Shortcut has been resolved to "%1"
.
MessageId=0x085D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMFRONTEND_OPENFILE
Language=English
Failed to open file "%1" - %2
.
MessageId=0x085F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_PROCESSFILE
Language=English
Processing file "%1"
.
MessageId=0x0860
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_VIEWSIZE
Language=English
View size is set to %1 bytes
.
MessageId=0x0862
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IMFRONTEND_NOATTACHDIR
Language=English
Attachment directory doesn't exist: "%1"
.
MessageId=0x0863
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IMFRONTEND_NOATTACHDIRSPEC
Language=English
Attachment directory is not specified.
.
MessageId=0x0864
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_ATTACHDIR
Language=English
Using attachment directory "%1"
.
MessageId=0x0865
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMFRONTEND_NOUNICODEXML
Language=English
Unicode XML files are not supported.
.
MessageId=0x0866
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_RENAME_DEST
Language=English
Renaming "%1" to "%2"
.
MessageId=0x0867
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_PROCESSING_FAILED
Language=English
Processing has failed.
.
MessageId=0x0868
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_HOLDINGDIR_KEEP
Language=English
The holding directory will not be removed (See %1 setting in the configuration file.)
.
MessageId=0x0869
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_DIRCLEANUP
Language=English
Cleaning up "%1".
.
MessageId=0x086A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_FILE_COMPLETE
Language=English
File complete - "%1".
.
MessageId=0x086B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_PROCESSING_FAIL
Language=English
Processing failed - %1
.
MessageId=0x086C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMFRONTEND_DELETE_FAIL
Language=English
Failed to delete the file after processing - %1.
.
MessageId=0x086D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_DIRCONFIG_FORMAT
Language=English
The directory is configured to contain files in "%1" format.
.
MessageId=0x086E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMFRONTEND_REGDIRCHANGENOIFY
Language=English
Failed to register directory change notification for "%1!hs!"
.
MessageId=0x086F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_ERRORTEXT
Language=English
Error: %1.
.
MessageId=0x0870
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_PROCESSING_DIR
Language=English
Processing Directory "%1".
.
MessageId=0x0871
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_FILE_WAIT
Language=English
Waiting for new files ...
.
MessageId=0x0872
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_CTRLC
Language=English
User pressed Ctrl+C
.
MessageId=0x0873
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMFRONTEND_REGCHANGEDIR_NEXT
Language=English
Failed to register the next directory change notification for "%1"
.
MessageId=0x0874
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_THREADTERM 
Language=English
Thread terminating.
.
MessageId=0x0875
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IMFRONTEND_DIR_INVALID
Language=English
Invalid directory specified: "%1".
.
MessageId=0x0876
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_PROCESSING_PATH
Language=English
Processing: "%1"
.
MessageId=0x0877
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMFRONTEND_FILES_NONE
Language=English
No files found.
.
MessageId=0x0878
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMFRONTEND_THREAD_START
Language=English
Unable to begin processing "%1" - %2.
.
MessageId=0x0879
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_MINDALIGN_LOG_CONVERSION_EXPRESSION
Language=English
Invalid MindAlign ID Conversion Expression: "%1" Error: %2.
.
MessageId=0x087A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_FACETIME_LOG_CONVERSION_EXPRESSION
Language=English
Invalid Facetime ID Conversion Expression: "%1" Error: %2.
.
MessageId=0x087B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IMMANAGER_LOG_CONVERSION_EXPRESSION
Language=English
Invalid IM Manager ID Conversion Expression: "%1" Error: %2.
.
MessageId=0x087C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_FACETIME_LOG_XMLPARSE
Language=English
Error %1!u! while parsing XML file: %2!ls! at line: %3!u! byte offset: %4!u!.
.
MessageId=0x087D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_XML_LOG_MESSAGES
Language=English
%1!u! log file messages processed.
.
MessageId=0x087E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_XML_LOG_PARSE
Language=English
Error %1!u! while parsing XML file: %2.
.
MessageId=0x087F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_XML_LOG_PARSEEND
Language=English
Error %1!u! past end of events in the XML file: %2.
.
MessageId=0x0880
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_XML_LOG_SCHEMA
Language=English
An error occurred: %1!hs!.
.
MessageId=0x0881
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_XML_LOG_LAST_SUCCESS
Language=English
----> Last successful message has a timestamp of %1.
.
MessageId=0x0882
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_FILE_LINE_ERROR
Language=English
An error occurred while processing line %1:
.
MessageId=0x0883
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_FILE_LINE_TEXT
Language=English
   %1
.
MessageId=0x0884
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_INSTBB_UNKNOWN_DATA
Language=English
Unknown data at line %1:
.
MessageId=0x0886
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_XML_LOG_PROGRESS
Language=English
Progress: Message number %1!lu! at timestamp %2.
.
MessageId=0x0887
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IM_BBBODY_NOUSER
Language=English
Warning: In message %1!u!, at line %2!u!, a statement has no user name.
.
MessageId=0x0888
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IM_BBBODY_ATTRIB_USER
Language=English
The statement attributed to the user '%1!hs!.
.
MessageId=0x0889
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IM_BBBODY_STATEMENT
Language=English
The statement text was: %1!hs!
.
MessageId=0x088A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_BBMAIL_LOG_XML_NODE
Language=English
Error in Bloomberg Email XML file: "%1!hs!" Unexpected node: "%2!ls!" at line %3!u!.
.
MessageId=0x088B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_BBMAIL_FILE_VERSION
Language=English
Unexpected file version in Bloomberg Email XML log: "%1" in file %2!hs!.
.
MessageId=0x088C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_BBMAIL_CANCELING
Language=English
Cancelling the import.
.
MessageId=0x088D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_BBMAIL_APPEND_ATTACH
Language=English
Failed to append attachment data for file %1.
.
MessageId=0x088E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_BBMAIL_ERROR_TEXT
Language=English
Error %1.
.
MessageId=0x088F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_BBMAIL_ERROR_MORE_INFO
Language=English
More info: %1.
.
MessageId=0x0890
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IM_BBCOMN_TIME_24
Language=English
Warning: A time contains an hour of 24, '00' is assumed.
.
MessageId=0x0891
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IM_BBCOMN_TIME_CONV
Language=English
Converted '%1' to '%2' (local time).
.
MessageId=0x0892
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_BBCOMN_LOCALTIME_CONV
Language=English
Converted local time '%1!hs!' to %2!u!/%3!u!/%4!u! %5!u!:%6!u!:%7!u! (UTC).
.
MessageId=0x0894
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_BBCOMN_LOG_MESSAGES
Language=English
%1!u! log file messages processed.
.
MessageId=0x0895
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_BBCOMN_OUTOFMEMORY
Language=English
Out of memory at line %1!u!.
.
MessageId=0x0896
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_BBCOMN_BAD_TIMESTAMP
Language=English
Bad timestamp format in message , %1!u! at line %1!u!:
.
MessageId=0x0897
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_BBCOMN_LINE_TEXT
Language=English
  %1!hs!
.
MessageId=0x0898
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_BBCOMN_CANCELING
Language=English
Cancelling the import.
.
MessageId=0x0899
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_BBCOMN_PROGRESS
Language=English
Progress: Message number %1!u! at line %2!u!.
.
MessageId=0x089A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IMCOMN_ATTACH_FILENAME
Language=English
Failed to extract attachment filename.
.
MessageId=0x089B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IMCOMN_ATTACHMENT_DATA
Language=English
Failed to append attachment data for file %1!hs!.
.
MessageId=0x089C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_IMCOMN_ERROR_TEXT
Language=English
Error %1.
.
MessageId=0x089D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_IMCOMN_ERROR_MORE_INFO
Language=English
More info: %1.
.
MessageId=0x089E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IMCOMN_ATTACHMENT_NOT_FOUND
Language=English
Attachment file "%1!ls!" was not found.
.
MessageId=0x089F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IMCOMN_ATTACHMENT_READ
Language=English
Failed to read attachment file "%1" - %2.
.
MessageId=0x08A0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IBXML_DELETE_FAIL
Language=English
Failed to delete attachment: %1 Error: %2.
.
MessageId=0x08A1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IBXML_FILE_VERSION
Language=English
Unexpected file version in Instant Bloomberg XML log: "%1".
.
MessageId=0x08A2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IBXML_XML_NODE
Language=English
Error in Instant Bloomberg XML file: "%1" Unexpected node: "%s" at line %3!u!.
.
MessageId=0x08A3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IBXML_ATTACHMENT_DATA
Language=English
Failed to append attachment data for file %1.
.
MessageId=0x08A4
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_IBXML_ERROR_TEXT
Language=English
Error: %1.
.
MessageId=0x08A5
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_IBXML_ERROR_MORE_INFO
Language=English
More info: %1.
.
MessageId=0x08A6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IBXML_ATTACHMENT_NOT_FOUND
Language=English
Failed to find attachment "%1" referenced in file "%2!hs!".
.
MessageId=0x08A7
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_IBXML_CANCELING
Language=English
Cancelling the import.
.
MessageId=0x08A8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IBXML_XML_LOG
Language=English
XML Error in Instant Bloomberg XML Log: "%1!hs" Error: %2!hs! at line %3!u!.
.
MessageId=0x08A9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IBUNIF_BAD_FROM_FORMAT
Language=English
Bad 'From' field format at line %1!u!.
.
MessageId=0x08AA
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IBUNIF_BAD_TO_FORMAT
Language=English
Bad 'To' field format at line %1!u!.
.
MessageId=0x08AB
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_IBUNIF_OUTOFMEMORY
Language=English
Out of memory at line %1!u!.
.
MessageId=0x08AC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IBBLOOM_BAD_FROM_FORMAT
Language=English
Bad 'From' field format at line %1!u!.
.
MessageId=0x08AD
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IBBLOOM_BAD_TO_FORMAT
Language=English
Bad 'To' field format at line %1!u!.
.
MessageId=0x08AE
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_IBBLOOM_OUTOFMEMORY
Language=English
Out of memory at line %1!u!.
.
MessageId=0x08AF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IBBLOOM_MISSING_SURNAME
Language=English
Missing surname in the Display Name field.
.
MessageId=0x08b0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_IBBLOOM_DISPLAY_NAME
Language=English
Display name field is too short.
.
MessageId=0x08B1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_BBMAIL_ATTACHMENT_NOT_FOUND
Language=English
Failed to find attachment: %1 referenced in file %2.
.
MessageId=0x08B2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_BBMAIL_DELETE_FAIL
Language=English
Failed to delete attachment: %1 Error: %2.
.
MessageId=0x08B3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IM_BBMAIL_XML_ERROR
Language=English
XML Error in Bloomberg Email XML Log: "%1" Error: %2 at line %3!u!.
.
MessageId=0x08B4
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_FACETIME_LOG_PROGRESS
Language=English
Progress: Message number %1!lu! at timestamp %2.
.
MessageId=0x08B5
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IM_INSTBB_LINE_TEXT
Language=English
  %1!hs!
.

;
;// Document/Policy Store status codes 0x0900-0x09FF
;
MessageId=0x0900
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WRONG_DATA_TYPE_FROM_INFRASTRUCTURE
Language=English
The infrastructure returned an unexpected data type for a policy node.
.
MessageId=0x0901
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_DOCUMENT_TYPE
Language=English
The document type cannot be matched.
.
MessageId=0x0902
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_COULD_NOT_BUILD_INCLUDE_EXCLUDE_LIST
Language=English
The same trigger action pair was found twice during the construction of the include exclude list.
.
MessageId=0x0903
Severity=Error
Facility=Wigan
SymbolicName=E_POLICY_DOES_NOT_EXIST
Language=English
The policy requested does not exist in the server.
.
MessageId=0x0904
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DOC_STORE_POLICY_NOT_INITIALISED
Language=English
The DocStorePolicy is not initialized.
.
MessageId=0x0905
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_SVR_POLICY_MANAGER
Language=English
The Doc Store Policy Manager is invalid.
.
MessageId=0x0906
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_SESSION
Language=English
The Session to be used for obtaining policies has not yet been provided.
.
MessageId=0x0907
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_VISITOR_FAILED
Language=English
The hierarchy visitor failed to find value.
.
MessageId=0x0908
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_HIERARCHY_OPERATION
Language=English
Something inappropriate was tried in the hierarchy.
.
MessageId=0x0909
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CREATING_URL_RESULTS
Language=English
An error occurred while comparing URL values during the creation of a result map.
.
MessageId=0x090A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_SHARED_ACCESS_INITIALISATION
Language=English
A SharedAccessLock did not initialize correctly.
.
MessageId=0x090B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_CLIENT_TYPE
Language=English
Could not determine the type of client that connecting.
.
MessageId=0x090C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ALREADY_EXISTS
Language=English
Trying to create a policy that already exists.
.
MessageId=0x090D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_DOES_NOT_EXIST
Language=English
Trying obtain a policy that does not exist.
.
MessageId=0x090E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_IN_BAD_STATE
Language=English
The policy is in a bad state. It is not initialized or awaiting and update.
.
MessageId=0x090F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_EXPECTED_VALUE_TYPE
Language=English
Trying to set a default value, on a value with no expected type.
.
MessageId=0x0910
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_MACHINE_POLICY
Language=English
Failed to obtain the machine policy.
.
MessageId=0x0911
Severity=Error
Facility=Wigan
SymbolicName=FREE0911
Language=English
No Longer Used
.
MessageId=0x0912
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_ACTION
Language=English
Could not get action from doc store server.
.
MessageId=0x0913
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_TRIGGER
Language=English
Could not get trigger from doc store server.
.
MessageId=0x0914
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_COL_CONF
Language=English
Bad Collection Config Requested.
.
MessageId=0x0915
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_USER_SETTINGS_CONF
Language=English
Bad User Settings Requested.
.
MessageId=0x0916
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_APP_GUI_CONF
Language=English
Bad Application GUI Settings Requested.
.
MessageId=0x0917
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_POLICY_VERSION
Language=English
Loaded policy '%1', version %2.
.
MessageId=0x0918
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_BAD_MAJOR_TRIGGER_TYPE
Language=English
Did not recognize the trigger's major type.
.
MessageId=0x0919
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_BAD_IFACE_FROM_GIT
Language=English
Failed to get Doc Store interface from the GIT
.
MessageId=0x091A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_BAD_USER_CLASSIFIER_SETTING
Language=English
Failed to get Doc Store interface from the GIT
.
MessageId=0x091B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_USER_DELETED
Language=English
User id %1 has been deleted. Policy will not be loaded.
.
MessageId=0x091C
Severity=Error
Facility=Wigan
SymbolicName=WGN_I_BAD_MAJ_POL_VER
Language=English
Expected policy schema version is %2, but the assigned policy schema version is %1. Policy will not be loaded.
.
MessageId=0x091D
Severity=Warning
Facility=Wigan
SymbolicName=WGN_I_BAD_MAJ_UPDATE_POL_VER
Language=English
Expected policy schema version is %2, but the assigned policy schema version is %1. Continuing with existing policy.
.
MessageId=0x091E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BAD_MIN_POL_VER
Language=English
Expected policy schema version is %2, but the assigned policy schema version is %1. Some functionality may not be available.
.
MessageId=0x091F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_USERS_DOCUMENTS
Language=English
The user's data (documents) has not been initialized.
.
MessageId=0x0920
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_USES_ACTIONS
Language=English
The user's data (actions) has not been initialized.
.
MessageId=0x0921
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_USES_TRIGGERS
Language=English
The user's data (triggers) has not been initialized.
.
MessageId=0x0922
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_POL_DEL_UPDATE
Language=English
The user's policy has been deleted. Continuing with cached policy.
.
MessageId=0x0923
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_USERS_FILES
Language=English
The user's data files have not been initialized.
.
MessageId=0x0924
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MISSING_FILE
Language=English
A file referenced in the user's policy does not exist. The file is called %1.
.
MessageId=0x0925
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MISSING_FILE_UPDATE
Language=English
Cannot update file in the Document Store. It does not exist there.
.
MessageId=0x0926
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_COULD_NOT_REGISTER_CALLBACK
Language=English
Could not register file update callback.
.
MessageId=0x0927
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_CALLBACK_TO_UNREGISTER
Language=English
Cannot find file update callback to unregister.
.
MessageId=0x0928
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SERVER_EXCEPTION_LOADING_POLICY
Language=English
The server failed during initialization/policy update. Exception was '%1!hs!'.
.
MessageId=0x0929
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_PUT_STREAM_IN_GIT
Language=English
Failed putting the file stream into the Global Interface Table
.
MessageId=0x092A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SERVER_AWAITING_POLICY_UPDATE
Language=English
The server failed during initialization/policy update and is awaiting policy/file update.
.
MessageId=0x092B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SERVER_NOT_CONNECTED
Language=English
The server failed to connect to the infrastructure.
.
MessageId=0x092C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SERVER_CONNECTED_BUT_NOT_INITIALISED
Language=English
The server has connect to the infrastructure, but not initialized.
.
MessageId=0x092D
Severity=Warning
Facility=Wigan
SymbolicName=WGN_I_MISSING_FILE
Language=English
'%1' is not available. Triggers that use it will be ignored.
.
MessageId=0x092E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_MIN_POL_VER
Language=English
Expected policy schema version is %2, but the assigned policy schema version is %1.  Policy will not be loaded.
.
MessageId=0x092F
Severity=Warning
Facility=Wigan
SymbolicName=WGN_E_BAD_MIN_UPDATE_POL_VER
Language=English
Expected policy schema version is %2, but the assigned policy schema version is %1. Continuing with existing policy.
.
MessageId=0x0930
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_POLICY_ALREADY_INITIALISED
Language=English
The policy has already been initialized.
.
MessageId=0x0931
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_DOC_STORE_CAUGHT_STRUCTURED_EXCEPTION
Language=English
The Doc Store Server caught a structured exception while processing the request.
.
MessageId=0x0932
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_DOC_STORE_CAUGHT_A_STANDARD_EXCEPTION
Language=English
The Doc Store Server caught a standard exception while processing the request.
.
MessageId=0x0933
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_DOC_STORE_CAUGHT_AN_UNKNOWN_EXCEPTION
Language=English
The Doc Store Server caught an unknown exception while processing the request.
.
MessageId=0x0934
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_POLICY_STORE_CAUGHT_STRUCTURED_EXCEPTION
Language=English
The Policy Store caught a structured exception while processing the request.
.
MessageId=0x0935
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_POLICY_STORE_CAUGHT_A_STANDARD_EXCEPTION
Language=English
The Policy Store caught a standard exception while processing the request.
.
MessageId=0x0936
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_POLICY_STORE_CAUGHT_AN_UNKNOWN_EXCEPTION
Language=English
The Policy Store an unknown exception while processing the request.
.
MessageId=0x0937
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_POLICY_STORE_UNRECOVERABLE_ERROR
Language=English
The Policy Store has experienced an unrecoverable error. Subsequent calls may deadlock.
.
MessageId=0x0938
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_DOC_STORE_UNRECOVERABLE_ERROR
Language=English
The Document Store has experienced an unrecoverable error. Subsequent calls may deadlock.
.
MessageId=0x0939
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_POLICY_CAUGHT_WGN_EXCEPTION
Language=English
The Policy Store's Policy caught a WgnException in '%1'. The exception description is '%2!hs!'.
.
MessageId=0x094A
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_POLICY_CAUGHT_STD_EXCEPTION
Language=English
The Policy Store's Policy caught a STD exception in '%1'. The exception description is '%2!hs!'.
.
MessageId=0x094B
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_POLICY_IN_EXCEPTION_STATE
Language=English
An exception occurred when initializing or using this policy.
.
MessageId=0x094C
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_COULD_NOT_FIND_ACTION
Language=English
An action has been requested that is not held by the policy store.
.
MessageId=0x094D
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_FS_FAILED_POLICY_ELEMENT
Language=English
Failed to obtain a policy element value for node '%1'.
.
MessageId=0x094E
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_FS_FAILED_POLICY_ELEMENT_TYPE
Language=English
The data obtained for policy node '%1' is of unexpected type.
.
MessageId=0x094F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNEXPECTED_POLICY_ELEMENT_TYPE
Language=English
A policy setting was obtained from the infrastructure but had an unexpected data type.
.
MessageId=0x0950
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_GET_POLICY_ELEMENT
Language=English
Failed to obtain a policy element from the infrastructure.
.
MessageId=0x0951
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ERROR_IN_MACHINE_POLICY
Language=English
An error occured in the machine policy wrapper class. Error code and description are available.
.
MessageId=0x0952
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_INITIALISING_MACHINE_POLICY
Language=English
Failed to connect to the infrastructure and obtain the machine policy.
.
MessageId=0x0953
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_LOG_MACHINE_POLICY_LOAD_FAILURE
Language=English
Warning:  Machine policy setting unavailable. Using default value. Error was '%1'. Error Description was '%2'.
.
MessageId=0x0954
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_USER_DEF_REP_STRS
Language=English
Failed to obtain the User Defined Replacement Strings.
.
MessageId=0x0955
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_IS_DISABLED
Language=English
The policy requested has been disabled. The user may have been deleted.
.
MessageId=0x0956
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_EMAIL_ENCRYPTION_SETTINGS
Language=English
The Email Encryption Settings are not avalilable.
.
MessageId=0x0956
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_EVENT_PROCESSING_TIME_LOG
Language=English
ProcessingTime(ms): %1, Event: '%2','%3', Policy: '%4','%5'
.
;
;// User Data Store/Server error codes 0x0A00-0x0AFF
;
MessageId=0x0A01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_UD_SERVER
Language=English
The user data store has invalid reference to the user data server.
.
MessageId=0x0A02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SERVER_NOT_INITIALISED
Language=English
The user data server has been asked for data, before the data store is initialized.
.
MessageId=0x0A03
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_FIND_POLICY_SETTING_STRING
Language=English
Failed to find the string that identifies the node in policy at which a setting should live.
.
MessageId=0x0A04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_USER_DEF_CYCLIC_LOOP
Language=English
Cyclic loop detected in User Definition: '%1'.
.
MessageId=0x0A05
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_USER_DEF_DUPLICATE
Language=English
Duplicate User Definition: '%1'.
.
MessageId=0x0A06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_USER_DEF_INVALID_NAME
Language=English
Invalid User Definition name: '%1'.
.
;
;// GUI errors 0x0B00-0x0BFF
;
MessageId=0x0B00
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_ERR_COLLECTION_IN_USE
Language=English
The collection is in use and cannot be deleted.
.

MessageId=0x0B01
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_ERR_DUPLICATE_CMS_GROUP
Language=English
A CMS group with the given name already exists. Duplicates are not allowed.
.

MessageId=0x0B02
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_ERR_DUPLICATE_CMS
Language=English
A CMS with the given name already exists. Duplicates names are not allowed.
.

MessageId=0x0B03
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_ERR_FAILED_TO_CREATE_DATASTORESERVICE
Language=English
The datastore service could not be created.
.

MessageId=0x0B04
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_ERR_FAILED_TO_GET_SESSION
Language=English
Unable to establish a connection.
.

MessageId=0x0B05
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_ERR_ACCESS_DENIED
Language=English
You do not have permission to perform this operation.
.

MessageId=0x0B06
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_ERR_EVENT_DELETED
Language=English
The event has been deleted.
.

MessageId=0x0B07
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_ERR_REPORT_HAS_NO_USERID_FIELD
Language=English
The report has no user id field defined. Such reports are incompatible with the current software.
.

MessageId=0x0B08
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_ERR_USER_NEEDS_MANAGEMENT_GROUP_FOR_REPORTS
Language=English
You cannot run a report as you do not have a management group set.
.

MessageId=0x0B09
Severity=Warning
Facility=Wigan
SymbolicName=WGN_GUI_WARN_LOGFILE_MESSAGE_FORMAT
Language=English
Console error for %1: '%2' Details: '%3'.
.

MessageId=0x0B0A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_LOGFILE_MESSAGE_FORMAT
Language=English
Console message for %1: '%2' Details: '%3'.
.

MessageId=0x0B0B
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_ERR_FAILED_TO_CREATE_FILESYSTEMSERVICE
Language=English
The file system service could not be created.
.

MessageId=0x0B0C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_NO_FURTHER_DETAILS
Language=English
No further information is available.
.

MessageId=0x0B0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_APP_CLOSING
Language=English
The application is closing.
.

MessageId=0x0B0E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_STAT_RESET_GROUP_MESSAGE_FORMAT
Language=English
The statistic '%1' was reset for group '%2'.
.

MessageId=0x0B0F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_STAT_RESET_USER_MESSAGE_FORMAT
Language=English
The statistic '%1' was reset for user '%2'.
.

MessageId=0x0B10
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_AGENT_PUBLISHED
Language=English
Published content agent '%1'.
.

MessageId=0x0B11
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_AGENT_UNPUBLISHED
Language=English
Unpublished content agent '%1'.
.

MessageId=0x0B12
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_ERR_INVALID_BLOB_FILE
Language=English
The file is not a valid event file.
.

MessageId=0x0B13
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_ERR_FAILED_TO_CREATE_DIRECTORYSERVICE
Language=English
The directory service could not be created.
.

MessageId=0x0B14
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_PST_ALL_EXPORT_START
Language=English
Exporting entire results set to PST.
.

MessageId=0x0B15
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_PST_ALL_EXPORT_END
Language=English
Entire results set was exported to PST.
.

MessageId=0x0B16
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_EXPORT_END_1
Language=English
%1!d! Events were in the results set.
.

MessageId=0x0B17
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_EXPORT_END_2
Language=English
%1!d! Events were successfully exported.
.

MessageId=0x0B18
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_EXPORT_END_3
Language=English
%1!d! Events were not exported because they were not email events.
.

MessageId=0x0B19
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_EXPORT_END_4
Language=English
%1!d! Events were not exported because they had no captured data attached.
.

MessageId=0x0B1A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_EXPORT_END_5
Language=English
%1!d! Events were not exported because of failure.
.

MessageId=0x0B1B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_EXPORT_END_6
Language=English
%1!d! Events were not exported because they were not email or IM events.
.

MessageId=0x0B1C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_PST_SELECT_EXPORT_START
Language=English
Exporting selected results set to PST.
.

MessageId=0x0B1D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_PST_SELECT_EXPORT_END
Language=English
Selected results set was exported to PST.
.

MessageId=0x0B1E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_HTML_ALL_EXPORT_START
Language=English
Exporting entire results set to Virtual Web Site.
.

MessageId=0x0B1F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_HTML_ALL_EXPORT_END
Language=English
Entire results set was exported to Virtual Web Site.
.

MessageId=0x0B20
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_HTML_SELECT_EXPORT_START
Language=English
Exporting selected results set to Virtual Web Site.
.

MessageId=0x0B21
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_HTML_SELECT_EXPORT_END
Language=English
Selected results set was exported to Virtual Web Site.
.
MessageId=0x0B22
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_ERR_PUT_ISSUE_RETURNED_ISSUE_ID_ZERO
Language=English
The audit state could not be updated (an invalid issue id was returned).
.
;/* Obsolete Message 
;MessageId=0x0B23
;Severity=Informational
;Facility=Wigan
;SymbolicName=WGN_GUI_INFO_PRIVILEGE_GRANTED
;Language=English
;Modified user '%1'. Privilege '%2' granted.
;.*/
;/* Obsolete Message 
;MessageId=0x0B24
;Severity=Informational
;Facility=Wigan
;SymbolicName=WGN_GUI_INFO_PRIVILEGE_REMOVED
;Language=English
;Modified user '%1'. Privilege '%2' removed.
;.*/
;/* Obsolete Message 
;MessageId=0x0B25
;Severity=Informational
;Facility=Wigan
;SymbolicName=WGN_GUI_INFO_MANAGEMENT_GROUP_REMOVED
;Language=English
;Modified user '%1'. Management group '%2' removed.
;.*/
;/* Obsolete Message 
;MessageId=0x0B26
;Severity=Informational
;Facility=Wigan
;SymbolicName=WGN_GUI_INFO_MANAGEMENT_GROUP_ADDED
;Language=English
;Modified user '%1'. Management group '%2' added.
;.*/
MessageId=0x0B27
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_NSF_SELECT_EXPORT_START
Language=English
Exporting selected results set to NSF.
.
MessageId=0x0B28
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_NSF_SELECT_EXPORT_END
Language=English
Selected results set was exported to NSF.
.
MessageId=0x0B29
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_EXPORT_END_7
Language=English
%1!d! Events were not exported because they were not Notes emails.
.
MessageId=0x0B2A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_NSF_ALL_EXPORT_START
Language=English
Exporting entire results set to NSF.
.
MessageId=0x0B2B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_NSF_ALL_EXPORT_END
Language=English
Entire results set was exported to NSF.
.
;/* Obsolete Message 
;MessageId=0x0B2C
;Severity=Informational
;Facility=Wigan
;SymbolicName=WGN_GUI_INFO_ADDRESS_REMOVED
;Language=English
;Modified user '%1'. Address '%2' was deleted.
;.*/
MessageId=0x0B2D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_EXPORT_END_8
Language=English
%1!d! Events were not exported because they were not Exchange emails.
.
MessageId=0x0B2E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_AUDIT_DEFAULTS_NOT_CONFIGURED
Language=English
The default audit strings have not been configured for this CMS.
.
MessageId=0x0B2F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_EXPORT_END_9
Language=English
'%1' (%2).
.

MessageId=0x0B30
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_EXPORT_END_10
Language=English
%1!d! Events were processed.
.

MessageId=0x0B31
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_EXPORT_INCORRECT_CONTENT_TYPE
Language=English
The email was not exported because it was not a valid content type for the destination.
.

MessageId=0x0B32
Severity=Warning
Facility=Wigan
SymbolicName=WGN_GUI_WARN_EXPORT_END_11
Language=English
No Events were exported.
.

MessageId=0x0B33
Severity=Warning
Facility=Wigan
SymbolicName=WGN_GUI_WARN_EXPORT_END_12
Language=English
%1!d! Events were exported before the operation aborted.
.

MessageId=0x0B34
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_SYSDEF_FILE_INSTALLED  
Language=English
The system definition file '%1' was successfully installed.
.

MessageId=0x0B35
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_POLICY_COPY
Language=English
The policy '%1' version %2 was successfully copied to '%3' version %4.
.
MessageId=0x0B36
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_ERR_FSA_SERVICE_NOT_INSTALLED
Language=English
The File Scanner Agent service is not installed on this machine.
.
MessageId=0x0B37
Severity=Error
Facility=Wigan
SymbolicName=WGN_GUI_ERR_FSA_SERVICE_NOT_RUNNING
Language=English
The File Scanner Agent service is not running on this machine.
.

MessageId=0x0B38
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_PRC_AGENT_STARTED  
Language=English
Index build for content registration agent '%1' was started on '%2'.
.

MessageId=0x0B39
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_PRC_AGENT_STOPPED  
Language=English
Index build for content registration agent '%1' was stopped on '%2'.
.

MessageId=0x0B3A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_PRC_AGENT_DELETED  
Language=English
Content registration agent '%1' was deleted.
.

MessageId=0x0B3B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_PRC_AGENT_PURGED  
Language=English
Indexes for content registration agent '%1' were purged on '%2'.
.

MessageId=0x0B3C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_PRC_AGENT_PUBLISH_STARTED  
Language=English
Publish started for content registration agent '%1'.
.

MessageId=0x0B3D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_PRC_AGENT_PUBLISHED_INDEX  
Language=English
Index file '%1' published for content registration agent '%2'.
.

MessageId=0x0B3E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_PRC_AGENT_PUBLISH_FINISHED  
Language=English
Publish finished for content registration agent '%1'.
.

MessageId=0x0B3F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_PRC_AGENT_CREATED  
Language=English
Content registration agent '%1' created, index build machine is '%2', index type is '%3'.
.

MessageId=0x0B40
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_PRC_AGENT_LOCATION_ADDED  
Language=English
Items added to protected files and folders list for content registration agent '%1'
.

MessageId=0x0B41
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_PRC_AGENT_LOCATION_REMOVED  
Language=English
Items removed from protected files and folders list for content registration agent '%1'
.

MessageId=0x0B42
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_PRC_AGENT_MODIFIED_ADVANCED_PROPERTIES  
Language=English
Advanced properties modified for content registration agent '%1'
.

MessageId=0x0B43
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_FEXP_ADMIN_STARTED  
Language=English
System file administration - started in edit mode.
.

MessageId=0x0B44
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_FEXP_FOLDER_CREATED  
Language=English
System file administration - system folder '%1' created.
.

MessageId=0x0B45
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_FEXP_FILE_CREATED  
Language=English
System file administration - system file '%1' created.
.

MessageId=0x0B46
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_FEXP_FOLDER_DELETED  
Language=English
System file administration - system folder '%1' deleted.
.

MessageId=0x0B47
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_FEXP_FILE_DELETED  
Language=English
System file administration - system file '%1' deleted.
.

MessageId=0x0B48
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_FEXP_FILE_IMPORTED  
Language=English
System file administration - system file '%1' imported content from '%2'.
.

MessageId=0x0B49
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_FEXP_FILE_PASTED  
Language=English
System file administration - system file '%1' pasted from clipboard.
.

MessageId=0x0B4A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_FEXP_FILE_EDITED  
Language=English
System file administration - system file '%1' properties edited.
.

MessageId=0x0B4B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_FEXP_FOLDER_EDITED  
Language=English
System file administration - system folder '%1' properties edited.
.

MessageId=0x0B4C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_FEXP_FILE_EXPORTED  
Language=English
System file administration - system file '%1' exported content to '%2'.
.

MessageId=0x0B4D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_FEXP_FILE_RENAMED  
Language=English
System file administration - system file '%1' renamed to '%2'.
.

MessageId=0x0B4E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_FEXP_FILE_COPIED  
Language=English
System file administration - system file '%1' copied to clipboard.
.

MessageId=0x0B4F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_FEXP_FILE_CUT  
Language=English
System file administration - system file '%1' cut to clipboard.
.

MessageId=0x0B50
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_FEXP_FILE_DROPPED  
Language=English
System file administration - system file '%1' created by drag and drop operation.
.

MessageId=0x0B51
Severity=Informational
Facility=Wigan
SymbolicName=WGN_GUI_INFO_FEXP_FOLDER_RENAMED  
Language=English
System file administration - system folder '%1' renamed to '%2'.
.


;
;// Bloomberg client errors 0x0C00-0x0CFF
;// This client is no longer being shipped.
;
MessageId=0x0C00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BLP_SEND_EMAIL_DURING_SHUTDOWN
Language=English
An attempt was made to send an email after the plug-in server had been shut down.
.

;
; // Event import status codes 0x0D00 - 0x0DFF
;
MessageId=0x0D00
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_ERROR_PROCESSING_EVENT
Language=English
An error occurred whilst processing an import event.
.
MessageId=0x0D01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMPORTER_CRITICAL_ERROR
Language=English
A fatal error occurred in the event importer.
.
MessageId=0x0D02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_CONFIG_PARAMETER
Language=English
The configuration file or program arguments are inconsistent, or parameters are missing.
.
MessageId=0x0D03
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CANNOT_OBTAIN_OR_CREATE_USER
Language=English
Cannot create or obtain an account for a user.
.
MessageId=0x0D04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CANNOT_CREATE_LOG_FILE
Language=English
Cannot create the log file.
.
MessageId=0x0D05
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_IGNORE_EVENT
Language=English
The current event being imported should be silently ignored.
.
MessageId=0x0D06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PATH_TOO_LONG
Language=English
The log file path supplied was too long.
.
MessageId=0x0D07
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_EXCH_ADDRESS
Language=English
Could not derive a username from the supplied email address.
.
MessageId=0x0D08
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNINITIALISED_BROKER_THREAD
Language=English
The broker thread has not been initialized.
.
MessageId=0x0D09
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EAS_FILE_COMPRESSED
Language=English
The file being imported may be a compressed EAS file. It needs to be uncompressed prior to importing.
.
MessageId=0x0D0A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_EAS_FILE
Language=English
The file being imported cannot be recognized as a compressed or uncompressed EAS file.
.
MessageId=0x0D0B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_COULD_NOT_MATCH_OR_CREATE_WIGAN_USER
Language=English
Could not match or create a user against which to store an imported event.
.
MessageId=0x0D0C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_STUCTURED_STORAGE_STREAM
Language=English
The contents of the data stream are unknown or invalid.
.
MessageId=0x0D0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_COULD_NOT_SET_OR_RESET_THE_SUSPENED_EVENT
Language=English
Failed to control the infrastructure suspended event.
.
MessageId=0x0D0E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_USER_ID
Language=English
Cannot obtain a User ID for a user.
.
MessageId=0x0D0F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_THROTTLING_LIMITS
Language=English
The maximum throttling limit was less than the minimum throttling limit.
.
MessageId=0x0D10
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CANT_MATCH_USER_ATTRIBUTE
Language=English
An error occurred trying to find a user by user attribute.
.
MessageId=0x0D11
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAPI_USER_CANCEL
Language=English
A password was required, but the user canceled the password entry dialog.
.
MessageId=0x0D12
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAPI_INCORRECT_PASSWORD
Language=English
The supplied password was incorrect and prompting the user was not permitted.
.
MessageId=0x0D13
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_USER_ATTRIBUTE_STRING
Language=English
The value of the UserAttributeNameLookup parameter is invalid.
.
MessageId=0x0D14
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INSUFFICIENT_PRIVILEGE
Language=English
Insufficient privileges to undertake import.
.
MessageId=0x0D15
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMPSVC_GENERIC
Language=English
%1
.
MessageId=0x0D16
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMPLOG_GENERIC
Language=English
%1
.
MessageId=0x0D17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_REMOTE_DATA_INFO
Language=English
The remote data information is invalid.
.
MessageId=0x0D18
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_DISK_SPACE_LOW
Language=English
An email event could not be created because the available disk space was less than the configured threshold.
.
MessageId=0x0D19
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_ALREADY_IMPORTED
Language=English
An email event was not created as it had already been processed.
.
MessageId=0x0D1A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_UNKNOWN_EXCEPTION
Language=English
Caught an unknown exception while processing imported email event.
.
MessageId=0x0D1B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CREATE_USER_ATT_NAME_SET
Language=English
The CreateUser and UserAttributeNameLookup parameters are both set. This is not allowed.
.
MessageId=0x0D1C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_EXCH_EXPRESSION
Language=English
The syntax of the expression to convert a MS Exchange email address to a user name is invalid.
.
MessageId=0x0D1D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_CONFIG_COMBINATION
Language=English
An invalid combination of configuration parameters has been detected.
.
MessageId=0x0D1E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INFRASTRUCTURE_SHUTTING_DOWN
Language=English
The importer cannot continue as the infrastructure is shutting down.
.
MessageId=0x0D1F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMPORTER_PAUSED
Language=English
System Info. The importer has been paused.
.
MessageId=0x0D20
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMPORTER_RESUMED
Language=English
System Info. The importer has been resumed.
.
MessageId=0x0D21
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_GET_EVENT
Language=English
Failed to get an event from an event queue.
.
MessageId=0x0D22
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_GET_DEFAULT_GROUP_ID
Language=English
Failed to get the default group ID. Could not obtain the 'WellKnown' interface from the DataStoreServices.
.
MessageId=0x0D23
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNKNOWN_USER_OR_PASSWORD
Language=English
Unknown user or incorrect password.
.
MessageId=0x0D24
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DUPLICATE_MAILBOX_IMPORT
Language=English
A mailbox has been configured to be imported more than once.
.
MessageId=0x0D25
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAPI_UNKNOWN_PROVIDER
Language=English
A MAPI message provider has been found that is not configured for import.
.
MessageId=0x0D26
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNCONFIGURED_MAILBOX
Language=English
Failed to configure a mailbox for import. It may not exist, or may be inaccessible.
.
MessageId=0x0D27
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EXCH_NETWORK_ERROR
Language=English
A network problem may be preventing contact with the Exchange server, or the process doesn't have sufficient rights to connect.
.
MessageId=0x0D28
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CONNECTING_CMS
Language=English
The importer is trying to re-connect to the CMS.
.
MessageId=0x0D29
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CONNECTED_CMS
Language=English
The importer has re-connected to the CMS.
.
MessageId=0x0D2A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMP_USERNAME_PASSWORD_BLANK
Language=English
Both Username and Password must be specified in the configuration file.
.
MessageId=0x0D2B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMP_SERVICE_INIT_START
Language=English
%1 is initializing.
.
MessageId=0x0D2C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMP_SERVICE_INIT_COMPLETE
Language=English
%1 has successfully initialized.
.
MessageId=0x0D2D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMP_BAD_NEXT_EVENT
Language=English
An importer has failed to obtain the next event to be imported, but has not reported an error.
.
MessageId=0x0D2E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMP_UNKNOWN_SOURCE
Language=English
An unknown value has been supplied as the source of an email.
.
MessageId=0x0D2F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOTES_IMPORT_NO_DATABASES
Language=English
The Import file does not contain any database names.
.
MessageId=0x0D30
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOTES_IMPORT_INITERR
Language=English
Failed to initialize Notes API.
.
MessageId=0x0D31
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOTES_IMPORT_NOT_INIT
Language=English
Notes API has not been initialized.
.
MessageId=0x0D32
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOTES_IMPORT_REINITERR
Language=English
Failed to reinitialize the Importer. Required threads inactive.
.
MessageId=0x0D33
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMPORT_RELEASE_ERRORS
Language=English
Errors occurred releasing event
.
MessageId=0x0D34
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMPORT_NOT_NOTIFIED
Language=English
Event has not been notified of import engine status - failing event
.
MessageId=0x0D39
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ERROR_OBTAINING_USER_FROM_EMAILADDR
Language=English
Failed to obtain an event's user from the email provided. Unexpected error.
.
MessageId=0x0D3A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ERROR_OBTAINING_USER_FROM_USERNAME
Language=English
Failed to obtain an event's user from the user name provided. Unexpected error.
.
MessageId=0x0D3B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CANT_MATCH_USER_BY_EMAIL
Language=English
Failed to obtain an event's user from the email address provided.
.
MessageId=0x0D3d
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMP_NO_USER_UNIQUE_ID
Language=English
No unique ID was included for a participant. Cannot import this conversation.
.
MessageId=0x0D3e
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_END_IMPORT_GROUP
Language=English
This signifies the end of a 'group' of related events.
.
MessageId=0x0D3f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMP_NO_SUCH_USER_DEFINED
Language=English
Conversation file refers to a user which has not previously been fully defined.
.
MessageId=0x0D40
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMP_NO_SUCH_ATTACHMENT_DEFINED
Language=English
Conversation file refers to an attachment which has not previously been fully defined.
.
MessageId=0x0D41
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMP_CFF_READ_ERROR
Language=English
Error reading conversation file.
.
MessageId=0x0D42
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMP_CFF_BAD_TAG_SIZE
Language=English
Error reading conversation file. A data section's length is incorrect.
.
MessageId=0x0D43
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMP_CFF_BAD_ATTACHMENT
Language=English
Attachment data's checksum is invalid. Attachment was not saved correctly in conversation file.
.
MessageId=0x0D44
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DEPRICATED_PARAMETER
Language=English
A parameter supplied to the importer is no longer supported.
.
MessageId=0x0D45
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IMP_HUB_ABANDONED_EVENT
Language=English
Hub was stopped before this event could be processed.
.
MessageId=0x0D46
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IMP_ABANDON_EVENT
Language=English
Import Engine was shut down before the event could be processed.
.
MessageId=0x0D47
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMP_MQ_ERROR_OPENING_QUEUE_MANAGER
Language=English
The MQ Queue manager could not be opened.
.
MessageId=0x0D48
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMP_MQ_ERROR_OPENING_INPUT_QUEUE
Language=English
The MQ input queue could not be opened.
.
MessageId=0x0D49
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMP_MQ_ERROR_OPENING_ERROR_QUEUE
Language=English
The MQ error queue could not be opened.
.
MessageId=0x0D50
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMP_MQ_ERROR_CREATING_MSG_BUFFER
Language=English
Out of memory creating .
.
MessageId=0x0D5A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_EVENT_SUCCEEDED
Language=English
The event was imported successfully.
.
MessageId=0x0D5B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ENGINE_SHUTDOWN
Language=English
The import engine is shutting down.
.
MessageId=0x0D5C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNKNOWN_IMPORT_TYPE
Language=English
Unknown import type.
.
MessageId=0x0D5D
Severity=Error
Facility=Wigan
SymbolicName=WGN_LOG_EXCHANGE_PROVIDER_FAULT
Language=English
An exception was raised by the Exchange provider. %1.
.
MessageId=0x0D5E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EXCHANGE_PROVIDER_FAULT
Language=English
An exception was detected that could lead to deadlock. The import engine will be terminated.
.
MessageId=0x0D5F
Severity=Error
Facility=Wigan
SymbolicName=WGN_I_NO_EXTENDED_ERROR_INFO
Language=English
There was no extended error information available.
.
MessageId=0x0D60
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMPORT_POLICY_NOT_SUPPORTED
Language=English
Import Policy is not currently supported by the importer.
.
MessageId=0x0D61
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IMPORT_ENGINE_HASNT_NOTIFIED_STATUS
Language=English
The Import Engine hasn't notified the import event of its status yet
.
MessageId=0x0D62
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_ENUM_VAL
Language=English
Unrecognized enumerated value.
.
MessageId=0x0D63
Severity=Error
Facility=Wigan
SymbolicName=WGN_CRIT_SD_WHILE_INITIALISING
Language=English
The critical shutdown event is set. Object will not be initialized.
.
MessageId=0x0D64
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ERROR_DBITEM_FILTER
Language=English
An error occurred processing NSF.RemoteDataLocationDBItem filter.
.
MessageId=0x0D65
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ERROR_DBITEM_FILTER_PROCESS
Language=English
An error occurred processing NSF.RemoteDataLocationDBItem filter. The filter is invalid.
.
MessageId=0x0D66
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ERROR_DBITEM_FILTER_EMPTY
Language=English
An error occurred processing NSF.RemoteDataLocationDBItem filter. The result string is empty.
.
MessageId=0x0D67
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOTES_PASSWORD
Language=English
Unable to obtain Notes Credentials
.
MessageId=0x0D68
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_ANALYSE_EVENT
Language=English
Failed to pass the message to the Policy Engine for processing.
.
MessageId=0x0D69
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ABANDONED_INTERNALLY
Language=English
The Hub Event has been abandoned internally.
.
MessageId=0x0D6A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_EVENT_STATE
Language=English
No Event Status available.
.
MessageId=0x0D6B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_REQUIRED_TAG_NOT_FOUND
Language=English
Required tag not found.
.
MessageId=0x0D6C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_IMPNSF_NOTES_INITERR
Language=English
Failed to initialize Notes API - %1.
.
MessageId=0x0D6D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMPNSF_NOTES_INITERR
Language=English
Failed to initialize Notes API.
.
MessageId=0x0D6E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IMPNSF_SEARCH_EXCEPTION
Language=English
An Exception occurred opening a Note (Note Id=%1!d!) while searching for Notes to import.
.
MessageId=0x0D6F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_IMPNSF_NOTES_OPENERR
Language=English
A Notes error occurred opening Note.
.
; // Please add new importer errors above here if possible!!!!!!
; // From here on are the new import codes. These will end up in the log file.
MessageId=0x0D70
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_INF_WHILE_STORING
Language=English
Failed. Title: '%5!ls!'. Reason: API '%1' failed with '%2'. Ext Error Code: '%3'. Ext Error Description: '%4!ls!'
.
MessageId=0x0D71
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BT_CAUGHT_EXCEP
Language=English
System Error. The broker thread caught an exception. The error was: '%1'. Description is: '%2'
.
MessageId=0x0D72
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ET_CAUGHT_EXCEP
Language=English
System Error. The event thread caught an exception. The error was: '%1'. Description is: '%2'
.
MessageId=0x0D73
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_LOG_SUCCEEDED
Language=English
Captured. Title: '%1!ls!'
.
MessageId=0x0D74
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_START_IMPORTING
Language=English
Failed to start importing.
.
MessageId=0x0D75
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CRITICAL_WHILE_STORING
Language=English
Failed. Title: '%2!ls!'. Reason: '%1'
.
MessageId=0x0D76
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IGNORED_EVENT
Language=English
Excluded (Imp). Title: '%1!ls!'. Reason: '%2!ls!'
.
MessageId=0x0D77
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PROCESSED_BAD_PA
Language=English
Failed. Title: '%3!ls!'. Reason: '%2!ls!', Extended Error: '%1'
.
MessageId=0x0D78
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PROCESSED_BAD_IE
Language=English
Failed. Title: '%3!ls!'. Reason: '%2!ls!', Extended Error: '%1' 
.
MessageId=0x0D79
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_PROCESSED_BAD_UF
Language=English
Excluded (Imp). Title: '%1!ls!' Reason: Participants all failed the user filter.
.
MessageId=0x0D7A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PROCESSED_BAD_CRIT
Language=English
System Error. A critical error occurred processing message '%1!ls!'. Error was '%2'.
.
MessageId=0x0D7B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_STORED_NO_PARTS
Language=English
Message has no participants associated with it.
.
MessageId=0x0D7C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOT_USED_D7C
Language=English
Not Used.
.
MessageId=0x0D7D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOT_USED_D7D
Language=English
Not Used.
.
MessageId=0x0D7E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_MESSAGE_THREAD_FINISHED
Language=English
System Info. Message Processing thread '%1!hs!' has finished processing.
.
MessageId=0x0D7F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_NEW_IMPORT_SESSION
Language=English
System Info. Import Started.
.
MessageId=0x0D80
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_END_IMPORT_SESSION
Language=English
System Info. Import Finished.
.
MessageId=0x0D81
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_IGNORE
Language=English
System Error. Title: '%2!ls!'. Reason: chapter '%1' is reported as ignored.
.
MessageId=0x0D82
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ERROR_PROCESSING_CHAPTER
Language=English
Failed. Title: '%1!ls!'. Reason: A chapter could not be obtained from the importer. Error: '%2'. Reason '%3!ls!'.
.
MessageId=0x0D83
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOT_USED_D83
Language=English
Not Used.
.
MessageId=0x0D84
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CRITICAL_IMPORTER_ERROR
Language=English
System Error. A critical error occurred in the importer. Extended error code: '%1', Extended error description: '%2!ls!'.
.
MessageId=0x0D85
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_IGNORE_RET
Language=English
Excluded (Imp). Title: '%1!ls!'. Reason: After applying the retention period the email expiry date is in the past.
.
MessageId=0x0D86
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_REMOTE_LOCATION_EI
Language=English
Failed. Title: '%1!ls!'. Reason: Unable to obtain a remote location from the importer. Extended error code: '%2', Extended error description: '%3!ls!'.
.
MessageId=0x0D87
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_REMOTE_LOCATION
Language=English
Failed. Title: '%1!ls!'. Reason: Unable to obtain a remote location from the importer.
.
MessageId=0x0D88
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_REMOTE_LOCATION_HR
Language=English
Failed. Title: '%1!ls!'. Reason: Unable to obtain a remote location from the importer. The Event Importer returned '%2'.
.
MessageId=0x0D89
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SI_CAUGHT_EXCEP
Language=English
System Error. The StartImporting RPC thread caught an exception. Importer will now shut down. The error was: '%1'. Description is: '%2'.
.
MessageId=0x0D8A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOT_USED_D8A
Language=English
Not Used.
.
MessageId=0x0D8B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_HUB_FAILED_MESSAGE
Language=English
Failed. Title: '%2!ls!'. Reason: Import Policy Hub or Engine reported '%1'.
.
MessageId=0x0D8C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SUMMARY_PROGRESS
Language=English
System Info. Import Summary: Processed %1. Captured %2. Excluded %3. Failed %4.
.
MessageId=0x0D8D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CRIT_OBTAINING_PARTICIPANTS
Language=English
System Error. A critical error occurred processing message '%1!ls!'. Error was '%2'.
.
MessageId=0x0D8E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_TRANSACTION
Language=English
System Error. Failed to create a transaction. Error code '%1'. Ext Error Code: '%2'. Ext Error Description: '%3!ls!'.
.
MessageId=0x0D8F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_COMMIT
Language=English
System Error. Failed to commit a transaction. Error code '%1'. Ext Error Code: '%2'. Ext Error Description: '%3!ls!'.
.
MessageId=0x0D90
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_ROLLBACK
Language=English
System Error. Failed to rollback a transaction. Error code '%1'. Ext Error Code: '%2'. Ext Error Description: '%3!ls!'.
.
MessageId=0x0D91
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOT_USED_D91
Language=English
Not Used.
.
MessageId=0x0D92
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BROKER_THREAD_FINISHED
Language=English
System Info. Message broker thread '%1!hs!' has finished processing.
.
MessageId=0x0D93
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_SEQUENCE_ID
Language=English
Failed. Could not obtain a sequence ID for chapter . Error was '%1', from '%2'. Ext Error Code: '%3'. Ext Error Description: '%4!ls!'.
.
MessageId=0x0D94
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CONNECTED_TO_HUB
Language=English
System Info. System successfully connected to the Policy Engine Hub.
.
MessageId=0x0D95
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_RECONNECTED_TO_HUB
Language=English
System Info. Successfully re-connected to the Policy Engine Hub.
.
MessageId=0x0D96
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_CONNECT_TO_HUB
Language=English
System Error. Failed to connect to the Policy Engine Hub. Error was '%1'.
.
MessageId=0x0D97
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INFRA_STOPPING
Language=English
System Error. Shutting down the importer, as the infrastructure is stopping.
.
MessageId=0x0D98
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INFRA_STARTING
Language=English
System Info. The infrastructure is starting up.
.
MessageId=0x0D99
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INFRA_SHUTTING_DOWN
Language=English
System Info. The infrastructure is shutting down.
.
MessageId=0x0D9A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INFRA_START_FAILURE
Language=English
System Info. The infrastructure failed to start.
.
MessageId=0x0D9B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_INFRA_START_DISABLED
Language=English
System Info. The infrastructure has been suspended.
.
MessageId=0x0D9C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INFRA_RESUMED
Language=English
System Info. The infrastructure has been resumed.
.
MessageId=0x0D9D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INFRA_BAD_STATE
Language=English
System Info. The infrastructure has entered an undefined state.
.
MessageId=0x0D9E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAIL_INF_CONNECT_NT
Language=English
Event Importer '%1' failed to write to the log file. The log entry was '%2'.
.
MessageId=0x0D9F
Severity=Warning
Facility=Wigan
SymbolicName=WGN_I_PARTICIPANT_NOT_IMPORTED
Language=English
System Info. A participant from the message '%1!ls!' was not imported: No email address.
.
MessageId=0x0DA0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INI_ENGINE_FAILED
Language=English
System Error. Failed to initialize the importer. Error was '%1'. Error Description is '%2!ls!'
.
MessageId=0x0DA1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_USER_PERMISSIONS
Language=English
System Error. Failed to initialize the importer. The supplied import user '%1!ls!' does not have bulk import privileges.
.
MessageId=0x0DA2
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IMP_MOVE_FILE
Language=English
System Warning. Failed to move file '%1!ls!' to failed directory. Error '%2'
.
MessageId=0x0DA3
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IMP_DELETE_FILE
Language=English
System Warning. Failed to delete file '%1!ls!'. Error '%2'
.
MessageId=0x0DA4
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IMPORTER_ERROR
Language=English
A generic log code through which importer .dll errors are made.
.
MessageId=0x0DA5
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_TAG_NOT_FOUND
Language=English
The remote data location tag '%1!ls!' was not found in file '%2!ls!'. Resetting remote data type and location to NULL.
.
MessageId=0x0DA6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_INF_WHILE_INITIALISING
Language=English
System Error. Could not initialize the importer. API '%1' failed with '%2'. Ext Error Code: '%3'. Ext Error Description: '%4!ls!'.
.
MessageId=0x0DA7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_RPC_INF_WHILE_INITIALISING
Language=English
System Error. Could not initialize the importer. API '%1' failed with '%2'.
.
MessageId=0x0DA8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_COULD_NOT_RE_INITIALISE_THREAD
Language=English
System Error. Could not initialize re-initialize the thread.
.
MessageId=0x0DA9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RPC_ERROR_FROM_INFRA
Language=English
System Info. An infrastructure API returned '%1' from '%2' while processing '%3!ls!'.
.
MessageId=0x0DAA
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TOO_MANY_REINITS
Language=English
System Error. Threads in the importer are having to be re-initialized too frequently. 
.
MessageId=0x0DAB
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_REINITIALISING
Language=English
System Info. Thread '%1!hs!' re-initializing.
.
MessageId=0x0DAC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PROGRESS_THREAD_EXCEPTION
Language=English
System Error. The importer's progress logging thread caught an import exception in '%1'. The exception description is <description>.
.
MessageId=0x0DAD
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TEST_ERROR
Language=English
Test Error.
.
MessageId=0x0DAE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_STD_PROGRESS_THREAD_EXCEPTION
Language=English
System Error. The importer's progress logging thread caught a standard exception in '%1'. The exception description is '%2!hs!'.
.
MessageId=0x0DAF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNK_PROGRESS_THREAD_EXCEPTION
Language=English
System Error. The importer's progress logging thread caught an unknown exception in '%1'. The exception description is '%2!hs!'.
.
MessageId=0x0DB0
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_REPORT_PROGRESS
Language=English
System Info. Processed '%1'. Captured '%2', Excluded '%3', Failed '%4'. 
.
MessageId=0x0DB1
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_HUB_THROTTLING_ON
Language=English
System Info. There are '%1!d!' messages outstanding in the import policy hub. Hub throttling is now on.
.
MessageId=0x0DB2
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_HUB_THROTTLING_OFF
Language=English
System Info. There are '%1!d!' messages outstanding in the import policy hub. Hub throttling is now off.
.
MessageId=0x0DB3
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_THROTTLING_ON
Language=English
System Info. There are '%1!d!' messages ready for processing. Throttling is now on.
.
MessageId=0x0DB4
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_THROTTLING_OFF
Language=English
System Info. There are '%1!d!' messages ready for processing. Throttling is now off.
.
MessageId=0x0DB5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_IF_FROM_ENGINE
Language=English
System Error. Failed to get the IWgnImportEngine interface from the CWgnImportEngine object. Error was '%1'.
.
MessageId=0x0DB6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SHUTTING_DOWN
Language=English
System Error. A critical exception occurred in the importer. The importer will now shut down.
.
MessageId=0x0DB7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EXCEPTION_WHILE_STORING
Language=English
An exception occurred while trying to store an event in the database.
.
MessageId=0x0DB8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MT_CAUGHT_EXCEP
Language=English
System Error. The main thread caught an exception. The error was: '%1'. Description is: '%2!ls!'.
.
MessageId=0x0DB9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_PE_REGISTRATION
Language=English
System Error. Failed to register as a client of the Policy Engine. Error was '%1'.
.
MessageId=0x0DBA
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_PE_CREATE
Language=English
System Error. Failed to create an instance of a CImportPolicyEngine object. Importer can not start.
.
MessageId=0x0DBB
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAIL_PE_CLIENT_REG
Language=English
System Error. Failed to register as a client of the Policy Engine. Error was '%1'.
.
MessageId=0x0DBC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAIL_PE_CO_CREATE
Language=English
System Error. Failed to co-create the Policy Engine. Error was '%1'.
.
MessageId=0x0DBD
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAIL_PE_CALLBACK_REG
Language=English
System Error. Failed to register a callback interface with the Policy Engine. Error was '%1'.
.
MessageId=0x0DBE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAIL_CALLBACK_QI
Language=English
System Error. Failed to query the Policy Engine object for its callback interface. Error was '%1'.
.
MessageId=0x0DBF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_SUSPENSION_EVENT
Language=English
System Error. Failed to create the Import Policy Engine's suspension event. Error was '%1'.
.
MessageId=0x0DC0
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PES_SUSPENDED
Language=English
System Info. The Policy Engine has reported that its local infrastructure is suspended.
.
MessageId=0x0DC1
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PES_RESUMED
Language=English
System Info. The Policy Engine has reported that its local infrastructure has been resumed.
.
MessageId=0x0DC2
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_REINITIALISING_PE
Language=English
System Info. A call to the Policy Engine has failed and the Policy Engine will now be re-created and initialized. Error was '%1'.
.
MessageId=0x0DC3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_PASS_TO_PE
Language=English
Failed. Title: '%2!ls!'. Failed to pass a message to the Policy Engine. Error was '%1'.
.
MessageId=0x0DC4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_ITEM_NOT_FOUND
Language=English
The remote data location item '%1!hs!' was not found.
.
MessageId=0x0DC5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ITEM_NOT_FOUND
Language=English
The remote data location item was not found.
.
MessageId=0x0DC6
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_RETRY_AS_SUSPENDED
Language=English
System Info. Title: '%1!ls!'. Info: A message will be passed to the Policy Engine again. It was not processed as the infrastructure has been suspended.
.
MessageId=0x0DC7
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_NOT_CAPTURED
Language=English
Excluded (PE). Title: '%1!ls!'. Reason: '%2'.
.
MessageId=0x0DC8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_REQUIRED_TAG_NOT_FOUND
Language=English
The required remote data location tag '%1!ls!' was not found in file '%2!ls!'. Failing the message
.
MessageId=0x0DC9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_NOTES_ERROR
Language=English
Note Id=%2!d! - %1.
.
MessageId=0x0DCA
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ABANDONED_OUTSTANDING_EVENT
Language=English
Abandoned. Title: '%1!ls!'. Reason: 'Dumping outstanding events'.
.
MessageId=0x0DCB
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_NOTES_STATUS
Language=English
Notes Error - %1.
.
MessageId=0x0DCC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOTES_DIRECTORY
Language=English
Note Directory='%2!hs!' - %1.
.
MessageId=0x0DCD
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_IMPNSF_NOTES_DIRERR
Language=English
A Notes error occurred opening a Notes Directory.
.
MessageId=0x0DCE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_IMPNSF_NOTES_SEARCHERR
Language=English
A Notes error occurred searching a Notes Directory.
.
MessageId=0x0DCF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_IMPNSF_NOTES_INITTHREAD
Language=English
A Notes error occurred initializing Notes Thread.
.
MessageId=0x0DD0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_SELECTED_NO_DATABASES
Language=English
The Import file selected no database names.
.
MessageId=0x0DD1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_XML_ATTACHMENT_REF
Language=English
Attachment References not supported in BB XML Logs.
.
MessageId=0x0DD2
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_XML_ATTACHMENT_REF_LOG
Language=English
Attachment References not supported in BB XML Logs. Event description: '%1!ls!', Reference:'%2!ls!'.
.
MessageId=0x0DD3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_INITIALISE_LOG_FILE
Language=English
The import engine failed to initialize its log file interface.
.
MessageId=0x0DD4
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WAITING_FOR_INFRASTRUCTURE_TO_START
Language=English
Waiting for the infrastructure process to start.
.
MessageId=0x0DD5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_FAIL_TO_START_IMPORT
Language=English
System Info. Failed to start the importer. Reason '%1!hs!', Error '%2!hs!'.
.
MessageId=0x0DD6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_FAIL_TO_INIT_IMPORT
Language=English
System Info. Failed to initialize the importer. Reason '%1!hs!', Error '%2!hs!'.
.
MessageId=0x0DD7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_FAIL_TO_RE_INIT_IMPORT
Language=English
System Info. Failed to re-initialize the importer after RPC errors. Reason '%1!hs!', Error '%2!hs!'.
.
MessageId=0x0DD8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_XML_NODE
Language=English
System Info. Invalid XML node.
.
MessageId=0x0DD9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_FILE_PATH
Language=English
Could not obtain the file path from the file name.
.
MessageId=0x0DDA
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EXCEPTION_WHILE_PROCESSING
Language=English
An exception was thrown while processing the message.
.
MessageId=0x0DDB
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_NOT_CAPTURED_EXPL
Language=English
Policy did not cause the event to be captured.
.
MessageId=0x0DDC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_MUST_SPECIFY_POLICY_PARTICIPANT
Language=English
When doing Import Policy of files ImpFile.PolicyParticipant must be specified in the importer's initialization file.
.
MessageId=0x0DDD
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_NO_FILE_POLICY_PARTICIPANT
Language=English
System Info. Shutting down. The Policy Engine could not obtain a policy for the specified policy participant. Please check configuration.
.
MessageId=0x0DDE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_HASH_GENERATION
Language=English
The number of bytes retrived from the hash digest are less than the hash class reported.
.
MessageId=0x0DDF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_CONNECTION_TO_MASTER_CMS
Language=English
System Info. Failed to connect to master CMS. Error was '%1!d!'. Description was '%2!ls!'.
.
MessageId=0x0DE0
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FAILED_TO_CREATE_EVF
Language=English
System Info. Could not create an EVF or EVL in the failed folder for Event UID '%1!ls!'. Error was '%2!hs!'. Description was '%3!ls!'.
.
MessageId=0x0DE1
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_NO_EVF
Language=English
System Info. No EVF or EVL in the failed folder for Event UID '%1!ls!'. No failed folder is specified.
.
MessageId=0x0DE1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNRECOGNISED_RECORD_SET_COLUMN
Language=English
A column name returned by the RCi Stored Procedure query was not recognised.
.
MessageId=0x0DE2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ERROR_OBTAINING_RECORDSET_ROW
Language=English
An error occurred try to obtain the next row from the record set.
.
MessageId=0x0DE3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ERROR_NO_LICENCE
Language=English
Support for %1!ls! is not covered by the system license.
.
MessageId=0x0DE4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_SET_IMMEDIATE_SHUTDOWN_REQUEST
Language=English
Failed to set the event to cause a critical shutdown. The error was %1!hs!.
.
MessageId=0x0DE5
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FAILED_NBA_FILENAME_PARSING
Language=English
Failed to parse the NBA filename to obtain the source and destination machines for an NBA file. A host participant will be create instead.
.
MessageId=0x0DE6
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FAILED_CREATE_SOURCE_PART
Language=English
Warning: Title: '%1!ls!'. Failed to generate participants to represent the source and destination machines for an NBA file. A host participant will be create instead.
.
MessageId=0x0DE7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_XML_PARSING_ERROR
Language=English
An error occurred parsing file %1 at line %2
.
MessageId=0x0DE8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_XML_ROOT
Language=English
Unexpected top level XML node: %1
.
MessageId=0x0DE9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_XML_VERSION
Language=English
Unsupported XML Version :%1
.
MessageId=0x0DEA
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FAILED_TO_OPEN_XML_FILE
Language=English
Failed to open XML File :%1
.
MessageId=0x0DEB
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_OPENED_XML_FILE
Language=English
Successfully opened XML File :%1
.
MessageId=0x0DEC
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_OPENED_DISCLAIMER_FILE
Language=English
Successfully opened disclaimer File :%1
.
MessageId=0x0DED
Severity=Error
Facility=Wigan
SymbolicName=WGN_I_BB_DISCLAIMER_NOT_IN_FILE
Language=English
Can't find disclaimer text for reference %1
.
MessageId=0x0DEF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FAILED_TO_OPEN_DISCLAIMER_FILE
Language=English
Failed to open disclaimer File :%1
.
MessageId=0x0DF0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_CIRCULAR_REFERENCE
Language=English
Circular Reference in XML Files. File %1 referenced multiple times.
.
MessageId=0x0DF1
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FAILED_NBA_FILENAME_PARSING_LOG
Language=English
Warning: Title: '%1!ls!'. Failed to parse the NBA filename to obtain the source and destination machines for an NBA file. A host participant will be create instead.
.

; // Please add new importer codes above D70 if possible. If no slots are available please try to find 
; // unused importer error codes to re-use!
;
; // Content Proxy status codes 0x0E00 - 0x0EFF
;
MessageId=0x0E00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_COULD_NOT_READ_FILE
Language=English
Unable to read a requested file.
.
MessageId=0x0E01
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_UNKNOWN_MESSAGE
Language=English
A message was received with an unknown message number.
.
MessageId=0x0E02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_MESSAGE_RECEIVED
Language=English
A message did not have the expected fields present, or those fields were corrupt.
.
MessageId=0x0E03
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_CLIENT_ID
Language=English
Client is not logged in to the Content Proxy.
.
MessageId=0x0E04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TEST_AGENT_NOT_VALID
Language=English
The Test Agent returned from the agent builder is corrupt.
.
MessageId=0x0E05
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ERROR_BUILDING_AGENT
Language=English
Unable to build an agent.
.
MessageId=0x0E06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_CMS
Language=English
The Content Proxy was unable to contact the Central Management Server.
.
MessageId=0x0E07
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLIENT_COULD_NOT_LOGON
Language=English
A client could not log in to the Content Services.
.
MessageId=0x0E08
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_POSITIVE_FILES
Language=English
Unable to build an agent because there were no positive training files, or all those files were empty.
.
MessageId=0x0E09
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FILE_HAS_NO_CONTENT
Language=English
File has no text content.
.
MessageId=0x0E0A
Severity=Error
Facility=Wigan
SymbolicName=WGN_CP_E_CLIENT_VERSION_UNSUPPORTED
Language=English
A client could not log in to the Content Services because its version is unsupported.
.
MessageId=0x0E0B
Severity=Error
Facility=Wigan
SymbolicName=WGN_CP_E_SERVER_VERSION_UNSUPPORTED
Language=English
The client could not log in to the Content Services because the server version is unsupported.
.
MessageId=0x0EA0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_COULD_NOT_STRIP_FILE
Language=English
Could not extract text from file.
.
MessageId=0x0EA1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_COULD_NOT_CONNECT_TO_DRE
Language=English
The Content Proxy could not connect to the Content Database.
.
MessageId=0x0EA2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_FILE
Language=English
Unable to build the agent due to problems processing the training files.
.
MessageId=0x0EA3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DRE_IS_EMPTY
Language=English
Unable to build the agent because the Content Database is empty.
.
MessageId=0x0EA4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_COULD_NOT_ALLOCATE_TEMP_FILE	
Language=English
Unable to allocate temporary file for text extraction.
.
MessageId=0x0EA5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_COULD_NOT_CREATE_MESSAGE
Language=English
Unable to create a message to send. Could be caused by connecting to an old CMS.
.
MessageId=0x0EA6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_AUTONOMY_SEARCH_DISABLED
Language=English
The Search component of the Content Proxy is inactive. 
.
MessageId=0x0EA7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DRE_CONNECTION_NOT_ALLOWED
Language=English
The Content Proxy is not allowed to access the Content Database.
.
MessageId=0x0EA8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NOTHING_TO_SEARCH
Language=English
The search request did not specify any valid criteria.
.
MessageId=0x0EA9
Severity=Success
Facility=Wigan
SymbolicName=WGN_AGENT_BUILDER_CLIENT_LOGGED_ON
Language=English
Agent Builder: %1 (%2) Logged in from machine %3.
.
MessageId=0x0EAA
Severity=Success
Facility=Wigan
SymbolicName=WGN_AGENT_BUILDER_CLIENT_LOGGED_OFF
Language=English
Agent Builder: %1 (%2) Logged out from machine %3.
.
MessageId=0x0EAB
Severity=Success
Facility=Wigan
SymbolicName=WGN_AGENT_BUILDER_BUILD_AGENT
Language=English
Agent Builder: Building an agent for %1 (%2) on %3.
.
MessageId=0x0EAC
Severity=Success
Facility=Wigan
SymbolicName=WGN_AUTONOMY_SEARCH_SEARCH
Language=English
Content Search: Running a query for %1 (%2) on %3.
.
MessageId=0x0EAD
Severity=Success
Facility=Wigan
SymbolicName=WGN_AUT_SERVICE_REGISTERING
Language=English
%1 trying to register service on CMS %2.
.
MessageId=0x0EAE
Severity=Error
Facility=Wigan
SymbolicName=WGN_AUT_SERVICE_FAILED_TO_REGISTER
Language=English
%1 failed to register service on CMS %2.
.
MessageId=0x0EAF
Severity=Success
Facility=Wigan
SymbolicName=WGN_AUT_SERVICE_REGISTERED_OK
Language=English
%1 registered service on CMS %2.
.
MessageId=0x0EB0
Severity=Error
Facility=Wigan
SymbolicName=WGN_AUT_SERVICE_CANNOT_REGISTER_BAD_CMS_INFRA
Language=English
Cannot register service yet, %1 CMS infrastructure not ready.
.
MessageId=0x0EB1
Severity=Success
Facility=Wigan
SymbolicName=WGN_AUT_SERVICE_STARTED
Language=English
%1 started successfully.
.
MessageId=0x0EB2
Severity=Success
Facility=Wigan
SymbolicName=WGN_AUT_SERVICE_STOPPED
Language=English
%1 stopped.
.
MessageId=0x0EB3
Severity=Error
Facility=Wigan
SymbolicName=WGN_AUT_SERVICE_FAILED_TO_START
Language=English
%1 failed to start. Error %2
.
MessageId=0x0EB4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DRE_NOT_ENOUGH_DOCUMENTS
Language=English
The Content Database does not contain enough relevant documents to build an Agent.
.
MessageId=0x0EB5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_COULD_NOT_CONTACT_PROXY
Language=English
Unable to communicate with Content Proxy service.
.
MessageId=0x0EB6
Severity=Warning
Facility=Wigan
SymbolicName=WGN_AUT_SERVICE_REGISTERED_OK_AUTONOMY_NOT_LICENCED
Language=English
%1 registered service on CMS %2. Content Services are not licensed.
.
MessageId=0x0EB7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DRE_FAILED
Language=English
Content Database failed to process request
.
MessageId=0x0EB8
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FAILED_MUSTHAVE
Language=English
File failed Required Words test.
.
MessageId=0x0EB9
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FAILED_CANTHAVE
Language=English
File failed Disqualifying Words test.
.
MessageId=0x0EBA
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DOC_TOO_SMALL
Language=English
File failed Minimum Word Count test.
.
MessageId=0x0EBB
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FAILED_BOOL_TEST
Language=English
File failed Boolean test.
.
MessageId=0x0EBC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_COULD_NOT_CONNECT_TO_DRE_NAMED
Language=English
The Content Proxy could not connect to the Content Database.
.
MessageId=0x0EBD
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DRE_CONNECTION_NOT_ALLOWED_NAMED
Language=English
The Content Proxy is not allowed to access the Content Database.
.
MessageId=0x0EBE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_REPLY_SEND_FAILED
Language=English
The Content Proxy could not send a message to the client on machine %1, error %2.
.
MessageId=0x0EBF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CONTENT_SEARCH_GROUP_QUERY_FAILED
Language=English
The Content Proxy could not enumerate the groups that user %1 is allowed to search. Error: %2, %3.
.
MessageId=0x0EC0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PY_CREATE_PIPE
Language=English
The Content Proxy could not create a named pipe to communicate to the Fast vectorizer.
.
MessageId=0x0EC1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DUPLICATE_PIPE
Language=English
The Content Proxy could not duplicate a pipe to communicate to the Fast vectorizer.
.
MessageId=0x0EC2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PY_CREATE_FAILED
Language=English
The Content Proxy could not create the Fast vectorizer process.
.
MessageId=0x0EC3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PY_CREATE_TIMEOUT
Language=English
The Content Proxy timed out creating the Fast vectorizer process.
.
MessageId=0x0EC4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_DOCVECTOR
Language=English
Agent build failed: Malformed doc vector returned from the Fast vectorizer process.
.
MessageId=0x0EC5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PYTHON_EXCEPTION
Language=English
Agent build failed: Python script threw an exception.
.
MessageId=0x0EC6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAST_PYTHON_NOT_CONFIGURED
Language=English
The Content Proxy could not build a content agent: Fast vectorizer command not found in registry.
.
MessageId=0x0EC7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAST_PYTHON_COMMS_FAILED
Language=English
Agent build failed: Could not communicate with the Fast vectorizer.
.
MessageId=0x0EC8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAST_AGENT_BUILD
Language=English
The Content Proxy could not build a Fast content agent. Error: %1
.
MessageId=0x0EC9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAST_AGENT_CAUGHT_EXCEPTION
Language=English
Exception caught while trying to build Content Agent.
.
MessageId=0x0EDA
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAST_PYTHON_SCRIPT_NOT_FOUND
Language=English
The Content Proxy could not open the Fast vectorizer python script. Check registry setting.
.
MessageId=0x0EDB
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PYTHON_CREATE_VECTORIZER
Language=English
Could not create FAST Vectorizer. Check installation.
.
MessageId=0x0EDC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PYTHON_ADD_TO_VECTORIZER
Language=English
Error adding file to FAST Vectorizer.
.
MessageId=0x0EDD
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PYTHON_OPEN_FILE
Language=English
Error loading stripped document text.
.
MessageId=0x0EDE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PYTHON_BUILD_VECTOR
Language=English
Error building FAST document vector.
.
MessageId=0x0EDF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_CONTENT_SEARCH_PRIVILEGE
Language=English
User does not have the required content search privilege.
.
MessageId=0x0EE0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_MORE_LIKE_THIS_DOCS
Language=English
Unable to read the source documents for a more-like-this search.
.
MessageId=0x0EE1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CONTENT_PROXY_UNSUPPORTED_FEATURE
Language=English
The requested feature is not supported by the Content Proxy.
.
MessageId=0x0EE2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CONTENT_PROXY_QUERY_TOO_LARGE
Language=English
The query was too large to be processed, probably due to the number of groups in the hierarchy.
.
MessageId=0x0EE3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CONTENT_DB_QUERY_ERROR
Language=English
Content Database Error %1 %2 %3
.
MessageId=0x0EE4
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CONTENT_SEARCH_PARTIAL_RESULTS
Language=English
Partial Result. Content Database was unable to retrieve results from all columns.
.
MessageId=0x0EE5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CONTENT_SEARCH_ERROR
Language=English
The Content Database failed to process the query.
.
MessageId=0x0EE6
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CONTENT_SEARCH_WARNING
Language=English
The Content Database returned an error along with search results; these may be incomplete.
.
MessageId=0x0EE7
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CONTENT_SEARCH_PARAMETERS
Language=English
Content Search Parameters:%1
.
MessageId=0x0EE8
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CONTENT_SEARCH_DROPPED
Language=English
Confidence Level of %1 caused %2 results to be dropped (the first of which had a level of %3).
.
MessageId=0x0EE9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CS_BAD_PROVIDER
Language=English
The Content Connector could not be started. It may not be installed, may be the wrong version or may have failed to initialize.
.
MessageId=0x0EEA
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CS_PROVIDER_LOADED
Language=English
Content Database Connector is '%1'.
.


;
;// Attribute Lookup codes (0xF00 - )
;// <attribute> <object> <data source> <lookup server> <protocol>
;
MessageId=0x0F00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_SYNTAX_ERROR
Language=English
Syntax error in the query string.
.
MessageId=0x0F01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_PROTOCOL_UNRECOGNISED
Language=English
The query protocol is not recognized.
.
MessageId=0x0F02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_PROTOCOL_UNREACHABLE
Language=English
The query protocol handler is unreachable.
.
;// Only returned if the protocol handler compares against a list of known attributes,
MessageId=0x0F10
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_ATTRIBUTE_UNRECOGNISED
Language=English
The attribute is not a known attribute.
.
MessageId=0x0F11
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_ATTRIBUTE_LOOKUP_FAILED
Language=English
There was an error looking up the attribute.
.
;// Compulsory status code - must be returned by all implementations
MessageId=0x0F12
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_ATTRIBUTE_NOT_FOUND
Language=English
The attribute was looked up and was not found.
.
MessageId=0x0F13
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_ATTRIBUTE_ACCESS_FAILED
Language=English
The attribute was found but failed to be accessed.
.
;// Only returned if the protocol handler compares against a list of known objects.
MessageId=0x0F20
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_OBJECT_UNRECOGNISED
Language=English
The object is not a known object.
.
MessageId=0x0F21
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_OBJECT_LOOKUP_FAILED
Language=English
There was an error looking up the object.
.
;// Compulsory status code - must be returned by all implementations
MessageId=0x0F22
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_OBJECT_NOT_FOUND
Language=English
The object was looked up and was not found.
.
MessageId=0x0F23
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_OBJECT_ACCESS_FAILED
Language=English
The object was found but failed to be accessed.
.
MessageId=0x0F24
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_OBJECT_AMBIGUOUS
Language=English
The object was looked up but is ambiguous (more than one found).
.
MessageId=0x0F30
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_SOURCE_UNRECOGNISED
Language=English
The data source is not a known data source.
.
MessageId=0x0F31
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_SOURCE_NOT_FOUND
Language=English
The data source was not found.
.
MessageId=0x0F32
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_SOURCE_UNREACHABLE
Language=English
The data source was unreachable.
.
MessageId=0x0F40
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_SERVER_UNRECOGNISED
Language=English
The lookup server is not a recognized lookup server.
.
MessageId=0x0F41
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_SERVER_NOT_FOUND
Language=English
The lookup server was not found.
.
MessageId=0x0F42
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_SERVER_UNREACHABLE
Language=English
The lookup server was unreachable.
.
;// Message used for reporting - not a processing error code
MessageId=0x0F43
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_LOOKUP_FAILED
Language=English
Data lookup for trigger '%1' failed. See the following message for details...
.
;// Message used for reporting - not a processing error code
MessageId=0x0F44
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_LOOKUP_UNKNOWN_HOST
Language=English
Data lookup host '%1' was not recognized.
.
;// Message used for reporting - not a processing error code
MessageId=0x0F45
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_LOOKUP_UNKNOWN_SOURCE
Language=English
Data lookup source '%1' was not recognized.
.
;// Message used for reporting - not a processing error code
MessageId=0x0F46
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_LOOKUP_GENERAL_ERROR
Language=English
Data lookup failed with error '%1'.
.
MessageId=0x0F50
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_ALP_PARTIAL_TRUE
Language=English
This lookup query evaluates to TRUE but any subsequent queries must also evaluate to TRUE.
.
MessageId=0x0F51
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_ALP_PARTIAL_FALSE
Language=English
This lookup query evaluates to FALSE but any subsequent queries must also evaluate to FALSE.
.
MessageId=0x0F60
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOOKUP_NO_HANDLED_TYPES
Language=English
The supplied lookup resolver reports that it supports no lookup types.
.
MessageId=0x0F61
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_ALP_TRUE
Language=English
The lookup evaluates to TRUE: the trigger can be fired.
.
MessageId=0x0F62
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_ALP_FALSE
Language=English
The lookup evaluates to FALSE: the trigger cannot be fired.
.
MessageId=0x0F63
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_ALP_IGNORE
Language=English
The lookup was not applicable in the context in which it was made.
.
MessageId=0x0F64
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_DATA_NOT_FOUND
Language=English
The specified data could not be found.
.
MessageId=0x0F65
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_ACCESS_DENIED
Language=English
The specified data could not be accessed.
.
MessageId=0x0F66
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_RESOLVER_FAILED
Language=English
A general error occurred in the lookup resolver.
.
MessageId=0x0F67
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_CAUGHT_EXCEPTION
Language=English
An exception was caught while processing the lookup.
.
MessageId=0x0F68
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_REMOTE_REQUEST_TIMED_OUT
Language=English
A lookup request timed out - the remote lookup resolver failed to respond.
.
;// Message used for reporting - not a processing error code
MessageId=0x0F69
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_LOOKUP_FAILED_CANNOT_ABANDON
Language=English
The "Block" data lookup failure mode can only be performed in client integration - raising trigger '%1' instead.
.
MessageId=0x0F6A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALP_ERROR
Language=English
The combined result of two lookups was error.
.
MessageId=0x0F6B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DATA_LOOKUP_FAILED
Language=English
Data lookup failed.
.
;
;
; // Domino Server Agent Codes 0x1F00 to 0x1FFF
;
MessageId=0x1F00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_EMAILS_OUTSTANDING_IN_HUB
Language=English
%1!d! emails are outstanding in the Policy Engine Hub.
.
MessageId=0x1F01
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_DELETED_EMAIL
Language=English
Deleted email with subject '%1!ls!'.
.
MessageId=0x1F02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_DELETE_EMAIL
Language=English
Failed to delete email with subject '%1!ls!'.
.
MessageId=0x1F03
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_BLOCKED_EMAIL
Language=English
Blocked email with subject '%1!ls!'.
.
MessageId=0x1F04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_BLOCK_EMAIL
Language=English
Failed to block email with subject '%1!ls!'.
.
MessageId=0x1F05
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_GET_EMAIL_STORE
Language=English
Failed to query email event for email store interface. error %1. 
.
MessageId=0x1F06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_HUB_NOT_INSTALLED
Language=English
Policy Engine Hub not installed.
.
MessageId=0x1F07
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_CREATE_HUB
Language=English
Failed to create Policy Engine Hub, error %1. Entering failure mode. 
.
MessageId=0x1F08
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_GET_LOCAL_NAME
Language=English
Failed to retrieve local computer name, error %1. Entering failure mode. 
.
MessageId=0x1F09
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_REGISTER_WITH_HUB
Language=English
Failed to register with Policy Engine Hub, error %1. Entering failure mode. 
.
MessageId=0x1F0A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_CONNECTED_TO_HUB
Language=English
Successfully connected to the Policy Engine Hub.
.
MessageId=0x1F0B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_CONFIGURE_HUB
Language=English
Failed to configure the Policy Engine Hub, error %1. Entering failure mode. 
.
MessageId=0x1F0C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_CREATE_EMAIL_CONTEXT
Language=English
Failed to create email context object, error %1. 
.
MessageId=0x1F0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_CREATE_ADDITIONAL_INFO
Language=English
Failed to create email additional info object, error %1. 
.
MessageId=0x1F0E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_PASS_EMAIL_TO_HUB
Language=English
Failed to pass email '%1!ls!' to hub, error %2. Retrying.
.
MessageId=0x1F0F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_GIVING_UP_EMAIL_NO_HUB
Language=English
Giving up on email '%1!ls!' because the hub won't start. Entering failure mode.
.
MessageId=0x1F10
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_GIVING_UP_EMAIL_HUB_ERROR
Language=English
Giving up on email '%1!ls!' due to hub error %2. Entering failure mode.
.
MessageId=0x1F11
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_CREATE_CALLBACK
Language=English
Failed to create email callback object, error %1. 
.
MessageId=0x1F12
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_CREATE_SYNC_OBJECT
Language=English
Initialization failure. Failed to create a synchronization event, error %1. 
.
MessageId=0x1F13
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_CREATE_REG_PARAMS_OBJECT
Language=English
Initialization failure. Failed to create registry parameters object, error %1. 
.
MessageId=0x1F14
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_OPEN_REGISTRY_KEY_DEPRECATED_
Language=English
*Obsolete* Failed to open registry key %1\\%2, error %3. Entering failure mode.
.
MessageId=0x1F15
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_OPEN_REGISTRY_KEY_AND_FAIL_DEPRECATED_
Language=English
*Obsolete* Failed to open registry key '%1', error %2. Entering failure mode.
.
MessageId=0x1F16
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_CREATE_NEW_REGISTRY_PARAMETERS_OBJECT
Language=English
Failed to create a new registry parameters object, error %1. The new registry parameters have not been applied.
.
MessageId=0x1F17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_POPULATE_LIST_OF_DNS_DOMAINS
Language=English
Failed to populate the list of DNS domains in the enterprise, error %1. Entering failure mode.
.
MessageId=0x1F18
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_ALLOCATE_BYTES_FOR_REGISTRY
Language=English
Failed to allocate %1!d! bytes for registry's '%2' value, error %3.
.
MessageId=0x1F19
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_CONVERT_REGISTRY_LIST_TO_UNICODE
Language=English
Failed to convert registry list entry '%1' to UNICODE, error %2.
.
MessageId=0x1F1A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_SENDER_INC_LIST_EMPTY
Language=English
The registry value '%1' is empty. All emails will be excluded.
.
MessageId=0x1F1B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_SENDER_INC_LIST_NOT_PRESENT
Language=English
The registry value '%1' is not present. All emails will be excluded. 
.
MessageId=0x1F1C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_REGISTRY_QUERY_FAILED
Language=English
Failed to query registry value '%1', error %2.
.
MessageId=0x1F1D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_REGISTRY_INVALID_VALUE
Language=English
The registry value '%1' is set to an invalid value.
.
MessageId=0x1F1E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_REGISTRY_READ_FAILED
Language=English
Failed to read the registry value '%1', error %2.
.
MessageId=0x1F1F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_RELEASE_EMAIL_TO_ROUTER
Language=English
Failed to release email '%1!ls!' to Router, error %2.
.
MessageId=0x1F20
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_DID_NOT_RECEIVE_CALLBACK
Language=English
Email '%1!ls!' was released without receiving update callback.
.
MessageId=0x1F21
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_UNABLE_TO_INITIALISE_NOTES
Language=English
Failed to initialize the Notes API on this thread.
.
MessageId=0x1F22
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_MESSAGE_SUBMISSION_FAILED
Language=English
Submission to Policy Engine failed, error '%1.
.
MessageId=0x1F23
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_WORKQUEUE_CREATION
Language=English
Failed to create free message work queue, error %1 (messages may stick in mailbox).
.
MessageId=0x1F24
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_PESESSION_CREATION
Language=English
Failed to create PE session object.
.
MessageId=0x1F25
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_DETERMINE_SMTP_DNS_HOSTNAME
Language=English
Failed to determine SMTP DNS host name, error %1. Entering failure mode.
.
MessageId=0x1F26
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_DUPLICATE_WGNDSARL_INSTANCE
Language=English
Another instance of WgnDSARl is already running. This instance will exit.
.
MessageId=0x1F27
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_WGNDSARL_FAILED_TO_OBTAIN_SERVER_NAME
Language=English
WgnDSARl unable to obtain the Domino server name (Item:'%1') to construct data transfer objects with.
.
MessageId=0x1F28
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_WGNDSARL_THREAD_STOP_EVENT_CREATION_FAILED
Language=English
WgnDSARl failed to create listener thread stop event, error %1 (WgnDSARl will exit).
.
MessageId=0x1F29
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_WGNDSARL_FAILED_TO_CREATE_SET_EVENT
Language=English
WgnDSARl failed to create data set event %1, error %2.
.
MessageId=0x1F2A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_WGNDSARL_FAILED_TO_CREATE_RESULT_EVENT
Language=English
WgnDSARl failed to create data result event %1, error %2.
.
MessageId=0x1F2B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_WGNDSARL_FAILED_TO_CREATE_DATA_TRANSFER_CONTROL_MUTEX
Language=English
WgnDSARl failed to create data transfer control mutex %1, error %2.
.
MessageId=0x1F2C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_WGNDSARL_FAILED_TO_CREATE_DATA_TRANSFER_FILE
Language=English
WgnDSARl failed to create data transfer file mapping %1, error %2.
.
MessageId=0x1F2D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_WGNDSARL_FAILED_TO_DELETE_ROUTING_STATE
Language=English
WgnDSARl routing state deletion (NSFItemDelete) failed, error %1.
.
MessageId=0x1F2E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_WGNDSARL_FAILED_TO_UPDATE_RELEASED_MAIL
Language=English
WgnDSARl routing state update (NSFNoteUpdate) failed, error %1.
.
MessageId=0x1F2F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_WGNDSARL_FAILED_TO_OPEN_RELEASED_MAIL
Language=English
WgnDSARl failed to open (NSFNoteOpen) email for release, error %1.
.
MessageId=0x1F30
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_WGNDSARL_FAILED_TO_OPEN_DATABASE
Language=English
WgnDSARl failed to open database (NSFDbOpen), error %1.
.
MessageId=0x1F31
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_WGNDSARL_FAILED_TO_DELETE_MAIL
Language=English
WgnDSARl failed to delete email (NSFNoteDelete), error %1.
.
MessageId=0x1F32
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_WGNDSARL_FAILED_MAILBOX_PATH_CONSTRUCT
Language=English
Failed to create mailbox path (OSPathNetConstruct), error %1.
.
MessageId=0x1F33
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_WGNDSARL_THREW_EXCEPTION
Language=English
WgnDSARl threw exception during email processing
.
MessageId=0x1F34
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_WGNDSARL_FAILED_TO_CREATE_DATA_TRANSFER_FILE_VIEW
Language=English
WgnDSARl failed to create a view of the data transfer file, error %1.
.
MessageId=0x1F35
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_PARKING_DATABASE_MOVE_FAILED
Language=English
Failed to move email from parking database to mailbox (NSFDbCopyNote), error %1.
.
MessageId=0x1F36
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_PARKING_DATABASE_MAIL_WAS_NOT_MOVED
Language=English
Email (subject='%1) was not moved from the parking database to mailbox.
.
MessageId=0x1F37
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_PARKING_DATABASE_MAIL_WAS_MOVED
Language=English
Email (subject='%1) has been moved from the parking database to mailbox.
.
MessageId=0x1F38
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_START
Language=English
Failed to start the WgnDSARl application (error='%1')
.
MessageId=0x1F39
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_FIND_EMPTY_TRANSFER_SLOT
Language=English
DSA failed to find an empty transfer slot to communicate with WgnDSARl.
.
MessageId=0x1F3A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_FIND_DATABASE_IN_PARKING_DATABASE_LIST
Language=English
DSA failed to find '%1' in the parking database list.
.
MessageId=0x1F3B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_WGNDSARL_GIVEN_INVALID_PARKING_DATABASE_INDEX
Language=English
WgnDSARl given email with parking database index '%1!d!' but only has '%2!d! parking database list entries.
.
MessageId=0x1F3C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_RESTARTED_WGNDSARL
Language=English
WgnDSARl has been restarted. Server response is '%1'
.
MessageId=0x1F3D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_REGISTRY_PARAMETER_NOT_DOMINO
Language=English
The registry setting '%1' is not valid for the Domino Server Agent (DSA).
.
MessageId=0x1F3E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_TO_SAVE_EMAIL_CONTENTS
Language=English
Failed to save email contents to file '%1!ls!', error %2.
.
MessageId=0x1F3F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_USING_DEFAULT_REGISTRY_SETTING_VALUE_2S
Language=English
The registry setting '%1' is not set. Using its default value %2!ls!.
.
MessageId=0x1F40
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_READING_CONFIGURATION
Language=English
Reading the configuration parameters following the detection of a potential change.
.
MessageId=0x1F41
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_INTEGRATION_STAYING_OFF
Language=English
Integration is currently disabled.
.
MessageId=0x1F42
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_ENABLING_INTEGRATION
Language=English
Integration has been enabled.
.
MessageId=0x1F43
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_DISABLING_INTEGRATION
Language=English
Integration has been disabled.
.
MessageId=0x1F44
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_INVALID_CONFIGURATION_STAYING_OFF
Language=English
The configuration is invalid. Integration is staying disabled.
.
MessageId=0x1F45
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_INVALID_CONFIGURATION_STAYING_ON
Language=English
The new configuration is invalid and has been discarded. Integration is staying enabled with the previous configuration.
.
MessageId=0x1F46
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_CHANGED_CONFIGURATION_STAYING_ON
Language=English
The configuration has changed. Integration is staying enabled and is now using this new configuration.
.
MessageId=0x1F47
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DSA_LOG_CHANGED_REGISTRY_SETTING_NEEDS_DOMINO_RESTART
Language=English
The changed value of the registry setting '%1' will not be picked up until the Domino Server is restarted.
.
MessageId=0x1F48
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DSA_LOG_REGISTRY_NOTIFICATION_SET
Language=English
Failed to set registry notification - error %1
.
MessageId=0x1F49
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_RECOVERY_THREAD_CREATE_FAILED
Language=English
Failed to create Recovery thread object.
.
MessageId=0x1F4A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_RECOVERY_VIEW_MAPPING_FAILED
Language=English
Failed to create view of Recovery timestamp file - error %1.
.
MessageId=0x1F4B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_RECOVERY_FILE_MUTEX_CREATION
Language=English
Failed to create Recovery file mutex %1, error %2.
.
MessageId=0x1F4C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_FAILED_RECOVERY_THREAD_CREATION
Language=English
Failed to create Recovery thread.
.
MessageId=0x1F4D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_RECOVERY_FAILED_TO_FREE_MESSAGE
Language=English
Recovery thread failed to free email for DSA reprocessing - error %1.
.
MessageId=0x1F4E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_RECOVERY_FAILED_POSTED_TIME_RESET
Language=English
Recovery thread failed to reset posted time of email - error %1.
.
MessageId=0x1F4F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_RECOVERY_FAILED_NOTE_UPDATE
Language=English
Recovery thread failed to update a note for recovery - error %1.
.
MessageId=0x1F50
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_RECOVERY_ELIGIBLE_NOTE
Language=English
Note '%1' is eligible for Recovery.
.
MessageId=0x1F51
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_RECOVERY_RELEASED_NOTE
Language=English
Recovery released note '%1' to the DSA.
.
MessageId=0x1F52
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_RECOVERY_DELETED_NOTE
Language=English
Recovery deleted note '%1' because it was marked for deletion.
.
MessageId=0x1F53
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_RECOVERY_DATABASE
Language=English
Recovery is scanning database '%1'.
.
MessageId=0x1F54
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_RECOVERY_DATABASE_OPEN_FAILED
Language=English
Failed to open database '%1' for recovery - error %2.
.
MessageId=0x1F55
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_SMTP_INIT_FAILED
Language=English
SmtpUtilsInitialize failed (X headers will not be processed correctly) - error '%1'.
.
MessageId=0x1F56
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_MARKING_MAIL_FAILED
Language=English
Failed to mark message as dead. DSA is unable to stop this message - error '%1'.
.
MessageId=0x1F57
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_RELEASE_SET_STATUS_FAILED
Language=English
SetStatus failed - error '%1'. The email may be reprocessed.
.
MessageId=0x1F58
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_EXCEPTION_DURING_MAIL_RELEASE
Language=English
Exception occurred while releasing email to router.
.
MessageId=0x1F59
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_XO_ACTION_LIST_POPULATION_FAILED
Language=English
Failed to populate the XO Actions list - error '%1'.
.
MessageId=0x1F5A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_MEMORY_ALLOCATION_FOR_XO_ACTION_LIST_FAILED
Language=English
Failed to allocate memory for the XO Actions list.
.
MessageId=0x1F5B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_MEMORY_ALLOCATION_FOR_X_HEADER_NAME_FAILED
Language=English
Failed to to allocate memory for X header item name.
.
MessageId=0x1F5C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_LOG_MEMORY_ALLOCATION_FOR_TRANSFORMED_X_HEADER_NAME_FAILED
Language=English
Failed to to allocate memory for name transformed from underscores.
.
MessageId=0x1F5D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_XO_ACTIONS_SPECIFY_REPLACE
Language=English
X-ORCH-Actions contains replace so using X headers where possible.
.
MessageId=0x1F5E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DSA_LOG_XO_ACTIONS_DO_NOT_SPECIFY_REPLACE
Language=English
X-ORCH-Actions does not include replace.
.
MessageId=0x1F5F
Severity=Warning
Facility=Wigan
SymbolicName=WGN_E_DSA_IN_FAILURE_MODE
Language=English
The DSA is in failure mode. Message not submitted.
.
MessageId=0x1F60
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DSA_MAIL_IS_EXCLUDED_TYPE
Language=English
The email is of an excluded type. Message not submitted.
.
MessageId=0x1F61
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DSA_MAIL_IS_IGNORED
Language=English
The email is being ignored. Message not submitted.
.
MessageId=0x1F62
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DSA_MAIL_FAILS_SENDER_INCLUSION_FILTER
Language=English
The email fails the sender inclusion filter. Message not submitted.
.
MessageId=0x1F63
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DSA_FAILED_TO_ANALYSE_MAIL
Language=English
The email failed AnalyseMessage. Message not submitted.
.
MessageId=0x1F64
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DSA_LEAVING_FAILURE_MODE
Language=English
The DSA is leaving failure mode as a result of a registry change.
.
MessageId=0x1F65
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_FAILED_TO_GET_EVENT_ATTRIBUTES
Language=English
Failed to get an IWgnEventAttributes pointer. Cannot store X headers - error '%1'.
.
MessageId=0x1F66
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_FAILED_TO_ADD_X_HEADER_TO_ENVELOPE
Language=English
Failed to add X header ''%1' to envelope - error '%2'.
.
MessageId=0x1F67
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_FAILED_RETRIEVE_X_HEADER_DATA
Language=English
Failed to get X header ''%1' data from note - error '%2'.
.
MessageId=0x1F68
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_EXCEPTION_FROM_MESSAGE_SUBMISSION
Language=English
OnMessageSubmission threw an exception.
.
MessageId=0x1F69
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_NOTE_OPEN_FOR_EVENT_FAILED
Language=English
Failed to open note for Wgn event creation - error '%1'.
.
MessageId=0x1F6A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_DATABASE_OPEN_FOR_EVENT_FAILED
Language=English
Failed to open database ''%1' for Wgn event creation - error '%2'.
.
MessageId=0x1F6B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_RECOVERY_TIME_COMPARE_FAILED
Language=English
NSFItemTimeCompare failed - PostedDate item is not present or is not of type Time/Date.
.
MessageId=0x1F6C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_RECOVERY_ITEM_GETINFO_FAILED
Language=English
NSFItemInfo for recovery failed - error '%1'.
.
MessageId=0x1F6D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_RECOVERY_POSTEDDATE_TEXT_NOT_PRESENT
Language=English
NSFItemGetTime failed - PostedDate item not present or not of type time
.
MessageId=0x1F6E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_RECOVERY_POSTEDDATE_TEXT_CONVERSION_FAILED
Language=English
Converting PostedDate text to time/date failed - error '%1'.
.
MessageId=0x1F6F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_FAILED_TO_APPEND_ITEM
Language=English
Failed to append item '%1' to note - error %2.
.
MessageId=0x1F70
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_DATABASE_OPEN_FOR_X_HEADER_ADDITION_FAILED
Language=English
Failed to open database ''%1' for set X header client action - error '%2'.
.
MessageId=0x1F71
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DSA_NOTE_OPEN_FOR_X_HEADER_ADDITION_FAILED
Language=English
Failed to open note for set X header client action - error '%1'.
.


;
;
;// Java Exception status codes
; #define WGN_JAVA_ERR_BASE	0xF000
;
;// Java Infrastructure Base errors 0xF100-0xF1FF
MessageId=0xF100
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INFRA_BASE_ERR
Language=English
Unknown infrastructure error.
.
MessageId=0xF101
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_PROPERTIES_FILE_NOT_FOUND
Language=English
Unable to find properties file.
.
MessageId=0xF102
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_PROPERTIES_FILE_UNREADABLE
Language=English
Unable to read properties file.
.
MessageId=0xF103
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_START_CLASS_NOT_FOUND
Language=English
Unable to load the class defined in the properties file.
.
MessageId=0xF104
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_START_CLASS_ILLEGAL_ACCESS
Language=English
Illegal access exception in class defined in properties file.
.
MessageId=0xF105
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_START_CLASS_INSTANTIATION
Language=English
Unable to instantiate object defined in properties file.
.
MessageId=0xF106
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_NO_BASE_POLICIES_ON_CMS
Language=English
Unable to load base policies.
.
MessageId=0xF107
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CANNOT_LOG_MACHINE_ON
Language=English
Unable to log in to parent machine.
.
MessageId=0xF108
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_MACHINE_LOGIN_CANT_FIND_SERVER
Language=English
Unable to make initial login connection to parent server.
.
MessageId=0xF109
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_MISSING_JAR_FILE
Language=English
A JAR file is missing from the installation.
.
MessageId=0xF10A
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_JVM_OUT_OF_MEMORY
Language=English
The Infrastructure Java Virtual Machine has run out of memory.
.
MessageId=0xF110
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REMOTE_OBJECT_CREATION_ERR
Language=English
Unable to create a remote object.
.
MessageId=0xF111
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REMOTE_USER_LOGIN_ERR
Language=English
Remote login error while creating session.
.
MessageId=0xF112
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CANNOT_OBTAIN_USERNAME
Language=English
Unable to obtain the native user name.
.
MessageId=0xF113
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ERROR_WRITING_TO_DATABASE
Language=English
Failed to write to database. Ensure database exists and is not read-only.
.
MessageId=0xF114
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ERROR_PARSING_BASE_XML_FILES
Language=English
Error while parsing base policies.
.
MessageId=0xF115
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ERROR_LOADING_BASE_XML_FILES
Language=English
Error while loading base policies.
.
MessageId=0xF116
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ERROR_SETTING_UP_GROUPS
Language=English
Error while setting base groups.
.
MessageId=0xF117
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ERROR_READING_WELL_KNOWN_IDS
Language=English
Unable to read well known IDs.
.
MessageId=0xF118
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_MACHINE_UNKNOWN_TO_PARENT
Language=English
The parent server does not have an account for this machine.
.
MessageId=0xF119
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_UNKNOWN_TO_PARENT
Language=English
The parent server does not have an account for this user.
.
MessageId=0xF120
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CANNOT_LOG_USER_ON
Language=English
Unable to log the user in to the system.
.
MessageId=0xF121
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INVALID_PARAMETER
Language=English
Invalid parameter.
.
MessageId=0xF122
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_WRONG_NUMBER_OF_PARAMETERS
Language=English
Incorrect number of parameters.
.
MessageId=0xF123
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_UNKNOWN_STARTUP_EXCEPTION
Language=English
Unexpected Java exception during start-up.
.
MessageId=0xF124
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INFRASTRUCTURE_DISABLED
Language=English
The server is currently suspended.
.
MessageId=0xF125
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_RMI_REGISTRY_NOT_STARTED
Language=English
The RMI Registry could not be started - check its ports are not in use.
.
MessageId=0xF126
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INFRA_MANUALLY_DISABLED
Language=English
Manual suspend was requested.
.
MessageId=0xF127
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INFRA_DATA_DISK_ERROR
Language=English
A critical disk IO error occurred.
.
MessageId=0xF128
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INFRA_DISABLED
Language=English
This machine is currently suspended.
.
MessageId=0xF129
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INFRA_FEATURE_NOT_SUPPORTED
Language=English
This feature is not supported on the selected machine.
.
MessageId=0xF12A
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INFRA_ENCRYPTIONKEY_MISSING
Language=English
Required encryption key could not be found.
.
MessageId=0xF12B
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INFRA_DISABLED_MAINTENANCE
Language=English
Suspend requested by an automated maintenance task.
.
MessageId=0xF12C
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INVALID_MACHINE_POLICY_SCHEMA
Language=English
The schema of the machine policy is invalid. It is incompatible with the infrastructure running on this machine.
.
MessageId=0xF12D
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INFRA_DISABLED_REPL_THRESHOLD
Language=English
The replication holding cache is full.
.
MessageId=0xF12E
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INFRA_DISABLED_INIT_SYNC
Language=English
Infrastructure Data is being synchronized.
.
MessageId=0xF12F
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INFRA_JCE_PROVIDER_ERROR
Language=English
Infrastructure JCE provider error.
.
MessageId=0xF130
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INFRA_ENCRYPTIONKEY_UPGRADE_ERROR
Language=English
Updating of current encryption key failed.
.


;
;// Java Connection errors 0xF200-0xF2FF
;
MessageId=0xF200
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CONNECTION_BASE_ERR
Language=English
Unknown connection error.
.
MessageId=0xF201
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CANNOT_CONNECT
Language=English
Unable to communicate with remote server. There may be a network or configuration problem.
.
MessageId=0xF202
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CANT_GET_SERVER
Language=English
Unable to obtain interface to remote machine.
.
MessageId=0xF203
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_FAIL_REBIND
Language=English
Unable to bind service to local registry - check RMI port availability.
.
MessageId=0xF204
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_FAIL_LOOKUP
Language=English
Unable to communicate with parent server. There may be a network or configuration problem.
.
MessageId=0xF205
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CONNECT_PROG_ERR
Language=English
Program error while making a connection.
.
MessageId=0xF206
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SERVER_INCOMPATIBLE
Language=English
The remote server is running an incompatible software version.
.
MessageId=0xF207
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SERVER_INCORRECT
Language=English
Incorrect server name supplied - please check.
.
MessageId=0xF208
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SERVER_START_ERR
Language=English
The remote server has not started successfully.
.
MessageId=0xF209
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_PING_ERROR
Language=English
Error in machine discovery service.
.
;
;// Java Policy errors 0xF300-0xF3FF
;
MessageId=0xF300
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_POLICY_BASE_ERR
Language=English
Unknown policy error.
.
MessageId=0xF301
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_POLICY_INTERNAL_ERROR
Language=English
Internal policy error.
.
MessageId=0xF302
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_POLICY_MISSING_ID
Language=English
A policy ID was not specified.
.
MessageId=0xF303
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_POLICY_INVALID_OPERATION
Language=English
Unsupported policy operation.
.
MessageId=0xF304
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_POLICY_READ_ONLY
Language=English
The policy cannot be modified because it is read-only.
.
MessageId=0xF305
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_POLICY_UNKNOWN_ELEMENT
Language=English
Unknown policy element.
.
MessageId=0xF306
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_POLICY_UNKNOWN_ELEMENT_TYPE
Language=English
Unknown policy element type.
.
MessageId=0xF307
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_POLICY_UNKNOWN_POLICY
Language=English
Unknown policy.
.
MessageId=0xF308
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_POLICY_INVALID_FORMAT
Language=English
Invalid policy format.
.
MessageId=0xF309
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_POLICY_LOAD_ERR
Language=English
Unable to load policy.
.
MessageId=0xF30A
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_POLICY_SAVE_ERR
Language=English
Unable to save policy.
.
MessageId=0xF30B
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_POLICY_UPGRADE_FAILED_INIT
Language=English
Unable to upgrade policy because the infrastructure service cannot be initialized.
.
MessageId=0xF30C
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_POLICY_UPGRADE_ALREADY_RUNNING
Language=English
Unable to upgrade policy because the infrastructure service is already running.
.
;
;// Java Database errors 0xF400-0xF4FF
;
MessageId=0xF400
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_BASE_ERR
Language=English
Unknown database error.
.
MessageId=0xF401
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_BLOB_DIR_REQUIRED
Language=English
No directory has been defined for BLOB storage.
.
MessageId=0xF402
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_INVALID_BLOB_LOCATION
Language=English
An invalid directory has been defined for BLOB storage.
.
MessageId=0xF404
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_BLOB_NOT_FOUND
Language=English
BLOB not found.
.
MessageId=0xF405
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_SECURITY_ERROR
Language=English
Security exception detected.
.
MessageId=0xF406
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_BLOB_CREATION_ERROR
Language=English
Unable to create BLOB file.
.
MessageId=0xF407
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_BLOB_IO_ERROR
Language=English
Unable to access BLOB file contents.
.
MessageId=0xF408
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_DB_DRIVER_NOT_FOUND
Language=English
Unable to locate database driver.
.
MessageId=0xF409
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_DB_CONNECTION_ERROR
Language=English
Unable to connect to the database.
.
MessageId=0xF40A
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_DB_CONFIG_ERROR
Language=English
Invalid database configuration information.
.
MessageId=0xF40B
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_PREPARED_STATEMENT_ERROR
Language=English
Unable to create prepared statement.
.
MessageId=0xF40C
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_OBJECT_NOT_FOUND
Language=English
Object not found in database.
.
MessageId=0xF40D
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_GET_ERROR
Language=English
Unable to retrieve object from database.
.
MessageId=0xF40E
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_INSERT_ERROR
Language=English
Unable to insert object into database.
.
MessageId=0xF40F
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_UPDATE_ERROR
Language=English
Unable to update object in database.
.
MessageId=0xF410
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_DELETE_ERROR
Language=English
Unable to remove object from database.
.
MessageId=0xF411
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_SEARCH_ERROR
Language=English
Unable to perform database search.
.
MessageId=0xF412
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_INVALID_SEARCH_ERROR
Language=English
Invalid database search.
.
MessageId=0xF413
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_DUPLICATE_NAME_ERROR
Language=English
Duplicate database object name.
.
MessageId=0xF414
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_ILLEGAL_QUERY_WORD
Language=English
Unknown word in a database query.
.
MessageId=0xF415
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_ILLEGAL_QUERY_TABLE
Language=English
Queries are unsupported on the specified table.
.
MessageId=0xF416
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_UNKNOWN_QUERY_TABLE
Language=English
The specified table does not exist.
.
MessageId=0xF417
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_VIEW_CREATION_ERROR
Language=English
Unable to create an object for a database report.
.
MessageId=0xF418
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_VIEW_DEFINITION_ERROR
Language=English
Unable to read the database report definition.
.
MessageId=0xF419
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_PROP_INDEX_OUT_OF_RANGE
Language=English
The supplied property index is out of range.
.
MessageId=0xF41A
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_MAX_USERS
Language=English
The new user cannot be created because the maximum number of users has been reached.
.
MessageId=0xF41B
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_MAX_GROUPS
Language=English
The new group cannot be created because the maximum number of groups has been reached.
.
MessageId=0xF41C
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_MAX_GATEWAYS
Language=English
The new gateway cannot be created because the maximum number of gateways has been reached.
.
MessageId=0xF41D
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_MAX_CLIENTS
Language=English
The new client machine cannot be created because the maximum number of client machines has been reached.
.
MessageId=0xF41E
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_UNSUPPORTED_PROXY
Language=English
The remote object could not be 'proxied'. Please ensure that the remote machine is running the same software version.
.
MessageId=0xF41F
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_INCOMPATIBLE_SCHEMA
Language=English
The database schema is incompatible with the infrastructure software.
.
MessageId=0xF420
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_DB_FULL
Language=English
The database is full. Increase the database size or delete unwanted data.
.
MessageId=0xF421
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_LOW_DISK_SPACE
Language=English
The free disk space on the data volume has reached a critically low level.
.
MessageId=0xF422
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_VIEW_DEFINITION_EMPTY
Language=English
The report definition contained no SQL statement for the underlying DBMS.
.
MessageId=0xF423
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_OLD_USER_INCORRECT
Language=English
The supplied details of the existing DBMS user are incorrect.
.
MessageId=0xF424
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_UNABLE_TO_VERIFY_CREDENTIALS
Language=English
Unable to verify new username and password. Please ensure that the supplied username and password are valid and exist on the database. Database credentials not changed.
.
MessageId=0xF425
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_NOT_SCHEMA_OWNER
Language=English
The database schema is already in use by another machine.
.
MessageId=0xF426
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_SCHEMA_OWNER_UNAVAILABLE
Language=English
The database schema's owning machine could not be determined.
.
MessageId=0xF427
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_DIR_CREATION_ERROR
Language=English
An invalid directory has been defined for BLOB storage. The directory could not be created.
.
MessageId=0xF428
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_DIR_WRITE_ERROR
Language=English
An invalid directory has been defined for BLOB storage. A file could not be written to it.
.
MessageId=0xF429
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_RDM_SERVICE_UNAVAILABLE
Language=English
The Remote Data Manager for this file is not registered or is not running.
.
MessageId=0xF42A
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_RDM_SERVICE_UNREACHABLE
Language=English
The Remote Data Manager for this file cannot be reached on the network.
.
MessageId=0xF42B
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_RDM_TIMEOUT
Language=English
The Remote Data Manager for this file did not respond in time.
.
MessageId=0xF42C
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_RDM_BLOCK_SEQ_ERROR
Language=English
The Remote Data Manager for this file has sent data in the wrong sequence.
.
MessageId=0xF42D
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_UNKNOWN_ROW_LEVEL_FILTER
Language=English
An unknown Row Level Filter has been detected.
.
MessageId=0xF42E
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_INVALID_POLICY_PATH
Language=English
The supplied policy path is empty.
.
MessageId=0xF42F
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_POLICY_NAME_NOT_UNIQUE
Language=English
The policy name supplied is not unique - a full path is required.
.
MessageId=0xF430
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_POLICY_NAME_NOT_FOUND
Language=English
The policy name supplied was not found.
.
MessageId=0xF431
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_ROOT_POLICY_PATH_NOT_FOUND
Language=English
The root of the policy path name is incorrect.
.
MessageId=0xF432
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_POLICY_PATH_NOT_FOUND
Language=English
The supplied policy path name is not valid.
.
MessageId=0xF433
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_SLASH_NOT_PERMITTED
Language=English
Forward slash characters may not be used in machine, user or group names.
.
MessageId=0xF434
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_DATABASE_SERVICES_NOT_CREATED
Language=English
Failed to construct DatabaseServices.
.
MessageId=0xF435
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_REMOTE_EXCEPTION
Language=English
A remote exception was encountered by the database.
.
MessageId=0xF436
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_UNKNOWN_EXCEPTION
Language=English
Unknown (Throwable) exception encountered in the Database.
.
MessageId=0xF437
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_UNSUPPORTED_DBMS
Language=English
An unsupported DBMS has been detected.
.
MessageId=0xF438
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_DBMS_USER_IS_NOT_OWNER
Language=English
The DBMS user account being used by the infrastructure MUST own the database schema.
.
MessageId=0xF439
Severity=Error
Facility=Wigan
SymbolicName=DATABASE_ANONYMOUS_PARTICIPANT
Language=English
An attempt was made to store an event participant without having an address or a login.
.
MessageId=0xF43A
Severity=Error
Facility=Wigan
SymbolicName=DATABASE_NO_RLS
Language=English
Your system has not been configured to allow secure searches, please contact your administrator.
.
MessageId=0xF43C
Severity=Error
Facility=Wigan
SymbolicName=DATABASE_TRANSACTION_ABORTED
Language=English
An unexpected error has caused a database transaction to abort.
.
MessageId=0xF43D
Severity=Error
Facility=Wigan
SymbolicName=DATABASE_CONNECTOR_STOREQ_TOO_LARGE
Language=English
The BLOB connector storage queue is too large. However, migration to the storage device will continue.
.
MessageId=0xF43E
Severity=Error
Facility=Wigan
SymbolicName=DATABASE_GROUP_MOVES_PROHIBITED
Language=English
Groups cannot be moved because the 'Allow groups to be moved' CMS machine policy setting is false.
.
MessageId=0xF43F
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_RETPERIOD_FILE_OPEN_ERR
Language=English
The blob file cannot be opened when attempting to set its retention period.
.
MessageId=0xF440
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_RETPERIOD_OUT_OF_RANGE
Language=English
The blob file retention period cannot be set because the period is out of range.
.
MessageId=0xF441
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_RETPERIOD_FILE_INFO_ERR
Language=English
The blob file retention period cannot be set because the current file information cannot be read.
.
MessageId=0xF442
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_RETPERIOD_CANNOT_SET_PERIOD
Language=English
The blob file retention period cannot be set because the file date was not set.
.
MessageId=0xF443
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_RETPERIOD_CANNOT_SET_READONLY
Language=English
The blob file retention period cannot be set because the file's read-only flag was not set .
.
MessageId=0xF444
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_RETPERIOD_CANNOT_RESET_READONLY
Language=English
The blob file cannot be removed because its read-only flag cannot be removed.
.
MessageId=0xF445
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_RETPERIOD_CANNOT_DELETE_FILE
Language=English
The blob file cannot be removed because the file system prevented deletion.
.
MessageId=0xF446
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_DBELM_STARTUP_ERROR
Language=English
An error occurred whilst starting up the DB Event Logging Manager.
.
MessageId=0xF447
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_ERROR_CONFIGURING_RLS
Language=English
An error occurred whilst configuring an RLS model.
.
MessageId=0xF448
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DATABASE_STAY_POLICY_EXEMPT
Language=English
User must remain policy exempt as the maximum number of policy applied users has been reached.
.
;
;// Java Machine Services errors 0xF500-0xF5FF
;
MessageId=0xF500
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_MACHINE_BASE_ERR
Language=English
Unknown machine error.
.
MessageId=0xF501
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CANNOT_READ_MACHINE_DB
Language=English
Machine not found in database.
.
MessageId=0xF502
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CANNOT_CREATE_MACHINE_DB
Language=English
Creation of client machine is not permitted - Internet applications are enabled.
.
MessageId=0xF503
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CANNOT_CREATE_MACH_STDALONE
Language=English
Standalone installation cannot act as a server.
.
MessageId=0xF504
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CANNOT_CREATE_MACHINE_DB_DISABLE
Language=English
Creation of client machine is not permitted - Internet applications are disabled.
.
MessageId=0xF505
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CANNOT_CREATE_GATEWAY_DB
Language=English
Creation of gateway machine is not permitted.
.
MessageId=0xF506
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CANNOT_CREATE_MACH_VIA_CLIENT
Language=English
A client machine cannot parent another machine.
.
MessageId=0xF507
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_MACHINE_ROLE_MISMATCH
Language=English
The existing machine record has a different role to the local machine.
.
MessageId=0xF508
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CANNOT_CREATE_UTILITY_DB
Language=English
Creation of utility machine is not permitted.
.
MessageId=0xF509
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CANNOT_OBTAIN_CREATED_MACHINE_DB
Language=English
Unable to obtain machine policy.
.
MessageId=0xF50A
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_MACHINE_NAME_TOO_LONG
Language=English
The machine name is too long - it should be less than 65 characters.
.
MessageId=0xF50B
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INVALID_MACHINE_ROLE
Language=English
Invalid machine role.
.
MessageId=0xF50C
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_MACHINE_BELONGS_TO_OTHER_APM
Language=English
This machine is parented to a different CMS.
.
MessageId=0xF50D
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_MACHINE_RUNNING_OLDER_APM
Language=English
Machine state may be inaccurate because this machine does not support remote diagnostics.
.
MessageId=0xF50E
Severity=Error
Facility=Wigan
SymbolicName=MACHINE_PROFILE_IMPORT_FAILURE
Language=English
Machine profile import failure.
.
MessageId=0xF50F
Severity=Error
Facility=Wigan
SymbolicName=MACHINE_PROFILE_EXPORT_FAILURE
Language=English
Machine profile export failure.
.
;
;// Java User Services errors 0xF600-0xF6FF
;
MessageId=0xF600
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_BASE_ERR
Language=English
Unknown user services error.
.
MessageId=0xF601
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_NOT_IN_DATABASE
Language=English
Unknown user.
.
MessageId=0xF602
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_INVALID_USER_PASSWORD
Language=English
Unknown user or incorrect password.
.
MessageId=0xF603
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_NOT_FOUND_OR_CREATABLE
Language=English
The username or password supplied are invalid, and you are not permitted to create a new account. Please contact your administrator.
.
MessageId=0xF604
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_AND_PASSWORD_REQUIRED
Language=English
Username and password are required.
.
MessageId=0xF605
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_DOES_NOT_HAVE_PRIVILEGE
Language=English
The user does not have a required privilege.
.
MessageId=0xF606
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SILENT_LOGIN_FAILED
Language=English
Creation of a new user, or a login based on native authentication failed.
.
MessageId=0xF607
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REMOTE_LOGIN_TO_CLIENT_FAILED
Language=English
The selected machine does not support console sessions. Try connecting to its CMS.
.
MessageId=0xF608
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_NOT_FOUND_OR_CREATABLE_DISABLE
Language=English
The username or password supplied are invalid, and you are not permitted to create a new account. Please contact your administrator.
.
MessageId=0xF609
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REMOTE_LOGIN_TO_GATEWAY_FAILED
Language=English
Remote access to a gateway machine is not permitted.
.
MessageId=0xF60A
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REQUIRE_FULL_USER_NAME
Language=English
The full user name is required.
.
MessageId=0xF60B
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_NOT_IN_DATABASE_DISABLE
Language=English
The specified user is unknown - Internet applications are disabled.
.
MessageId=0xF60C
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CANNOT_ACCESS_CLIENT_LOCALLY
Language=English
Access to this machine is not permitted.
.
MessageId=0xF60D
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_CANNOT_CREATE_USER_VIA_CLIENT
Language=English
It is not possible to create a user via a client machine.
.
MessageId=0xF60E
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CANNOT_OBTAIN_CREATED_USER_DB
Language=English
Unable to obtain user policy.
.
MessageId=0xF60F
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_NOT_IN_MANAGEMENT_GROUP
Language=English
The user is not in the appropriate management group.
.
MessageId=0xF610
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_ONLY_ON_CMS
Language=English
This action may only be performed on the CMS.
.
MessageId=0xF611
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_SET_RES_POL_ERR
Language=English
Error installing license - policy has not been updated.
.
MessageId=0xF612
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_LICENCE_CODE_MISMATCH
Language=English
Incorrect license for this installation - policy has not been updated.
.
MessageId=0xF613
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_RES_POL_READ_ERR
Language=English
Unable to read license - policy has not been updated.
.
MessageId=0xF614
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_RES_POL_CONTENT_ERR
Language=English
The license file is corrupt or was generated for a previous software version - policy has not been updated.
.
MessageId=0xF615
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_USER_NAME_TOO_LONG
Language=English
The user name is too long - it should be less than 65 characters.
.
MessageId=0xF616
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_FULL_NAME_TOO_LONG
Language=English
The full name is too long - it should be less than 256 characters.
.
MessageId=0xF617
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_GROUP_NAME_TOO_LONG
Language=English
The group name is too long - it should be less than 65 characters.
.
MessageId=0xF618
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DELETED_USER_HAS_NO_POLICY
Language=English
The user who is currently logged in has been deleted from the database and now has no policy.
.
MessageId=0xF619
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_PROHIBITED_CHAR_IN_PASSWORD
Language=English
One or more characters in the user account password is in the list of prohibited characters set in CMS machine policy.
.
;
;// Java Logging errors 0xF700-0xF7FF
;
MessageId=0xF700
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_LOG_BASE_ERR
Language=English
Unknown logging error.
.
MessageId=0xF701
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_FAIL_REMOTE_LOG
Language=English
Unable to contact the remote machine to retrieve logging information.
.
MessageId=0xF702
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ACTIVITY_LOG_ERROR
Language=English
Activity Log Entry%rType: Error%rUser: %1%rMessage: %2
.
MessageId=0xF703
Severity=Warning
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ACTIVITY_LOG_WARNING
Language=English
Activity Log Entry%rType: Warning%rUser: %1%rMessage: %2
.
MessageId=0xF704
Severity=Informational
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ACTIVITY_LOG_INFO
Language=English
Activity Log Entry%rType: Informational%rUser: %1%rMessage: %2
.
MessageId=0xF705
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SYSTEM_LOG_ERROR
Language=English
System Log Entry%rType: Error%rUser: %1%rMessage: %2
.
MessageId=0xF706
Severity=Warning
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SYSTEM_LOG_WARNING
Language=English
System Log Entry%rType: Warning%rUser: %1%rMessage: %2
.
MessageId=0xF707
Severity=Informational
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SYSTEM_LOG_INFO
Language=English
System Log Entry%rType: Informational%rUser: %1%rMessage: %2
.
MessageId=0xF708
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_IMPORT_LOG_ERROR
Language=English
Event Import Log Entry%rType: Error%rUser: %1%rMessage: %2
.
MessageId=0xF709
Severity=Warning
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_IMPORT_LOG_WARNING
Language=English
Event Import Log Entry%rType: Warning%rUser: %1%rMessage: %2
.
MessageId=0xF70A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_IMPORT_LOG_INFO
Language=English
Event Import Log Entry%rType: Informational%rUser: %1%rMessage: %2
.
MessageId=0xF70B
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CONTENT_LOG_ERROR
Language=English
Content Services Log Entry%rType: Error%rUser: %1%rMessage: %2
.
MessageId=0xF70C
Severity=Warning
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CONTENT_LOG_WARNING
Language=English
Content Services Log Entry%rType: Warning%rUser: %1%rMessage: %2
.
MessageId=0xF70D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_CONTENT_LOG_INFO
Language=English
Content Services Log Entry%rType: Informational%rUser: %1%rMessage: %2
.
MessageId=0xF70E
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REPLICATION_LOG_ERROR
Language=English
Replication Log Entry%rType: Error%rUser: %1%rMessage: %2
.
MessageId=0xF70F
Severity=Warning
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REPLICATION_LOG_WARNING
Language=English
Replication Log Entry%rType: Warning%rUser: %1%rMessage: %2
.
MessageId=0xF710
Severity=Informational
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REPLICATION_LOG_INFO
Language=English
Replication Log Entry%rType: Informational%rUser: %1%rMessage: %2
.
MessageId=0xF711
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ACCOUNT_IMPORT_LOG_ERROR
Language=English
Account Import Log Entry%rType: Error%rUser: %1%rMessage: %2
.
MessageId=0xF712
Severity=Warning
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ACCOUNT_IMPORT_LOG_WARNING
Language=English
Account Import Log Entry%rType: Warning%rUser: %1%rMessage: %2
.
MessageId=0xF713
Severity=Informational
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ACCOUNT_IMPORT_LOG_INFO
Language=English
Account Import Log Entry%rType: Informational%rUser: %1%rMessage: %2
.
MessageId=0xF714
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_ACCOUNT_LOG_ERROR
Language=English
User Account Log Entry%rType: Error%rUser: %1%rMessage: %2
.
MessageId=0xF715
Severity=Warning
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_ACCOUNT_LOG_WARNING
Language=English
User Account Log Entry%rType: Warning%rUser: %1%rMessage: %2
.
MessageId=0xF716
Severity=Informational
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_USER_ACCOUNT_LOG_INFO
Language=English
User Account Log Entry%rType: Informational%rUser: %1%rMessage: %2
.
;
;// Java Messaging errors 0xF800-0xF8FF
;
MessageId=0xF800
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_MESSAGE_BASE_ERR
Language=English
Unknown messaging error.
.
MessageId=0xF801
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_FAIL_SEND_MSG
Language=English
Unable to send message.
.
MessageId=0xF802
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_MESSAGE_PROPERTY_MISSING
Language=English
A message property is missing.
.
MessageId=0xF803
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_MESSAGE_PROPERTY_BAD_TYPE
Language=English
Message property has unexpected type.
.
MessageId=0xF804
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_MESSAGE_DOES_NOT_NEED_REPLY
Language=English
This message was not flagged as needing a reply.
.
MessageId=0xF805
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_MESSAGE_SEND_UNKNOWN_FAILURE
Language=English
Unknown failure when trying to send message.
.
MessageId=0xF806
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_MESSAGE_SERVER_NOT_RUNNING
Language=English
Message cannot reach destination. The server does not exist or is not able to receive messages.
.
MessageId=0xF807
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_MESSAGE_SERVER_NOT_REGISTERED
Language=English
Message cannot reach destination. Messages of this class are not being responded to.
.
MessageId=0xF840
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SERVICE_ALREADY_EXISTS
Language=English
A service with this name already exists.
.
MessageId=0xF841
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SERVICE_IS_SINGLETON
Language=English
This service can only have one instance.
.
MessageId=0xF842
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SERVICE_DOES_NOT_EXIST
Language=English
This service does not exist.
.
MessageId=0xF843
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SERVICE_INST_DOES_NOT_EXIST
Language=English
This service instance does not exist.
.
MessageId=0xF844
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SERVICE_ACTION_INCORRECT
Language=English
An unknown service action has been received.
.
MessageId=0xF845
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SERVICE_NOT_LICENSED
Language=English
The service is not licensed on this server.
.
MessageId=0xF846
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SERVICE_MACHINE_INVALID
Language=English
The service host or registrant is not part of this installation.
.
MessageId=0xF847
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_FALLBACK_SERVICE_ALREADY_ACTIVE
Language=English
An attempt was made to make a server providing a CMS-managed singleton active when another server is already active.
.
;
;// Java Replication errors 0xF900-0xF9FF
;
MessageId=0xF900
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REPLICATION_BASE_ERR
Language=English
Unknown replication error.
.
MessageId=0xF901
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REPLICATION_GENERAL_ERR
Language=English
General replication error.
.
MessageId=0xF902
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REPLICATION_CACHE_OUT_OF_DATE
Language=English
Internal data synchronization required.
.
MessageId=0xF903
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REPLICATION_FAILED_TO_NOTIFY
Language=English
Failed to notify that data is available for replication.
.
MessageId=0xF904
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REPLICATION_NOTIFY_IGNORED
Language=English
Replication notification was sent successfully, but was not actioned by a remote machine.
.
MessageId=0xF905
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REPLICATION_PARTIAL_NOTIFY
Language=English
Replication notification was only partially actioned by the remote machine.
.
MessageId=0xF906
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REPLICATION_PARTIAL_TIMEOUT
Language=English
Replication started, but timed out before completion.
.
MessageId=0xF907
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REPLICATION_NOT_RUNNING
Language=English
The replication component is not running on this machine.
.
MessageId=0xF908
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REPLICATION_INVALID_SUBSCRIBER
Language=English
This machine is not registered to receive updates from the remote machine.
.
MessageId=0xF909
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REPLICATION_REPARENT_TO_ANOTHER_CMS
Language=English
Reparenting to another CMS is not supported.
.
MessageId=0xF90A
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REPLICATION_UPGRADE_RESYNC_FAILED
Language=English
Failed to resynchronize infrastructure data from parent machine to complete the software upgrade.
.
MessageId=0xF90B
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_REPLICATION_CACHE_ENUMERATION_FAILED
Language=English
Failed to enumerate the necessary replication data.
.
MessageId=0xF90C
Severity=Error
Facility=Wigan
SymbolicName=REPLICATION_WK_STRING_RESYNC_FAILED
Language=English
Failed to resynchronize Well Known String Table.
.
MessageId=0xF90D
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_REPLICATION_RESYNC_FAILED
Language=English
Failed to resynchronize infrastructure data from parent machine.
.
MessageId=0xF90E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_JAVA_REPLICATION_RESYNC_LIMIT_EXCEEDED
Language=English
The parent machine has reached its maximum number of resynchronizing machines.
.
MessageId=0xF90F
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_REPLICATION_MARK_FOR_RETRY_FAILED
Language=English
The child machine failed to mark the replication cache entry for 'holding'.
.
MessageId=0xF910
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_REPLICATION_OBJECT_TYPE_NOT_SUPPORTED
Language=English
The child machine does not support the object type.
.


;
;// Java Database Schema errors 0xFA00-0xFAFF
;
MessageId=0xFA00
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SCHEMA_BASE_ERR
Language=English
Unknown database schema error.
.
MessageId=0xFA01
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SCHEMA_MISSING_DLL
Language=English
Missing support DLL.
.
MessageId=0xFA02
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SCHEMA_SCRIPT_READ_FAILED
Language=English
Unable to read a line from an SQL script.
.
MessageId=0xFA03
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SCHEMA_MISSING_SCRIPT
Language=English
Required SQL script not found.
.
MessageId=0xFA04
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SCHEMA_SCRIPT_STATEMENT_ERROR
Language=English
Error occurred processing a SQL script statement.
.
MessageId=0xFA05
Severity=Error
Facility=Wigan
SymbolicName=SCHEMA_CREATE_WRONG_NUMBER_OF_PARAMETERS
Language=English
Incorrect parameters for database creation.
.
MessageId=0xFA06
Severity=Error
Facility=Wigan
SymbolicName=SCHEMA_INAVLID_DATABASE_PRODUCT
Language=English
Unsupported database.
.
MessageId=0xFA07
Severity=Error
Facility=Wigan
SymbolicName=SCHEMA_PROPERTIES_STORAGE_ERROR
Language=English
Unable to write the database properties file.
.
MessageId=0xFA08
Severity=Error
Facility=Wigan
SymbolicName=SCHEMA_PROPERTIES_DELETE_ERROR
Language=English
Unable to remove the database properties file.
.
MessageId=0xFA09
Severity=Error
Facility=Wigan
SymbolicName=SCHEMA_DELETE_WRONG_NUMBER_OF_PARAMETERS
Language=English
Incorrect parameters for database deletion.
.
MessageId=0xFA0A
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SCHEMA_EXISTING_SCHEMA_NEWER
Language=English
The existing database schema is newer than the one being installed. It cannot be downgraded.
.
MessageId=0xFA0B
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SCHEMA_CREATE_ERROR
Language=English
Unable to create schema.
.
MessageId=0xFA0C
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SCHEMA_IN_USE
Language=English
Unable to delete the schema, it is currently in use.
.
MessageId=0xFA0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_SCHEMA_DB_USER_MISMATCH
Language=English
The database user account must be the same account that was previously used.
.



;
;// Java Statistics errors 0xFB00-0xFBFF
;
MessageId=0xFB00
Severity=Error
Facility=Wigan
SymbolicName=STATISTICS_BASE_ERR
Language=English
Unknown statistics error.
.
MessageId=0xFB01
Severity=Error
Facility=Wigan
SymbolicName=STATISTICS_SETUP_ERROR
Language=English
Error setting up the statistics.
.
MessageId=0xFB02
Severity=Error
Facility=Wigan
SymbolicName=STATISTICS_BAD_PARENT_NODE
Language=English
A specified parent statistic is not a valid node.
.
MessageId=0xFB03
Severity=Error
Facility=Wigan
SymbolicName=STATISTICS_DEFINITION_STORAGE_ERROR
Language=English
Error storing the statistic definition in the database.
.
MessageId=0xFB04
Severity=Error
Facility=Wigan
SymbolicName=STATISTICS_REMOTE_ERROR
Language=English
A remote statistics exception occurred.
.


;
;// Java File System errors 0xFC00-0xFCFF
;
MessageId=0xFC00
Severity=Error
Facility=Wigan
SymbolicName=FILE_BASE_ERR
Language=English
Unknown file system error.
.
MessageId=0xFC01
Severity=Error
Facility=Wigan
SymbolicName=FILE_NOT_FOUND
Language=English
The file does not exist.
.
MessageId=0xFC02
Severity=Error
Facility=Wigan
SymbolicName=FILE_IO_ERROR
Language=English
An error occurred accessing the file data.
.
MessageId=0xFC03
Severity=Error
Facility=Wigan
SymbolicName=FILE_BAD_PARENT
Language=English
The specified parent must be a folder.
.
MessageId=0xFC04
Severity=Error
Facility=Wigan
SymbolicName=FILE_ALREADY_EXISTS
Language=English
A file with the same name already exists in the folder.
.
MessageId=0xFC05
Severity=Error
Facility=Wigan
SymbolicName=FILE_BAD_PATH
Language=English
An invalid file path was specified.
.
MessageId=0xFC06
Severity=Error
Facility=Wigan
SymbolicName=FILE_NOT_OPEN
Language=English
The file is not currently open.
.
MessageId=0xFC07
Severity=Error
Facility=Wigan
SymbolicName=FILE_WRONG_OPEN_MODE
Language=English
The file operation requested cannot be performed with the current file open mode.
.
MessageId=0xFC08
Severity=Error
Facility=Wigan
SymbolicName=FILE_DELETE_PENDING
Language=English
The file cannot be opened because it has been marked for deletion.
.
MessageId=0xFC09
Severity=Error
Facility=Wigan
SymbolicName=FILE_ALREADY_OPEN_FOR_WRITE
Language=English
The file cannot be opened because it is already open for write access.
.
MessageId=0xFC0A
Severity=Error
Facility=Wigan
SymbolicName=FILE_ALREADY_OPEN
Language=English
The file operation cannot be performed because the file is already open.
.

;
;// Java Directory Services errors 0xFD00-0xFDFF
;
MessageId=0xFD00
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_BASE_ERR
Language=English
Unknown directory services error.
.
MessageId=0xFD01
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_CONNECT_ERR
Language=English
Could not connect to LDAP server.
.
MessageId=0xFD02
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_BROWSE_ERR
Language=English
Could not retrieve information from LDAP server.
.
MessageId=0xFD03
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_CANCELLED
Language=English
Update canceled.
.
MessageId=0xFD04
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_SYNC_ERR
Language=English
Error while synchronizing databases.
.
MessageId=0xFD05
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_AUTHENTICATION_ERR
Language=English
Could not authenticate with LDAP server.
.
MessageId=0xFD06
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_BASEDN_ERR
Language=English
Incorrect BaseDN/Domain value or username.
.
MessageId=0xFD07
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_INSPECT_LOG
Language=English
Errors were encountered during the update. See the User Import log files for details.
.
MessageId=0xFD08
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_EXPORT_ERR
Language=English
Errors were encountered during the export.
.
MessageId=0xFD09
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_EXP_UNKNOWN_MACH
Language=English
Unknown machine to base the export from.
.
MessageId=0xFD0A
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_EXP_UNKNOWN_GROUP_PATH
Language=English
Unknown group path to base the export from.
.
MessageId=0xFD0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_EXP_BAD_XML_CLASS
Language=English
Invalid class specified for XML export.
.
MessageId=0xFD0E
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_IMP_BAD_XML_CLASS
Language=English
Invalid class specified for XML import.
.
MessageId=0xFD0F
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_EXP_NO_MANAGEMENT_GROUP
Language=English
Export base point is not within the user's management group.
.
MessageId=0xFD10
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_IMP_MGMT_GRP_CHANGES_NOT_MADE
Language=English
Management group changes not made due to invalid group names.
.
MessageId=0xFD11
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_XML_STANDARD_PARSING_FAILED
Language=English
The account import xml file was badly formed.
.
MessageId=0xFD12
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_OPTIONS_ERROR
Language=English
The account import options caused an error.
.
MessageId=0xFD13
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_LDAP_DATA_ERROR
Language=English
The account import LDAP data source contained invalid data
.
MessageId=0xFD14
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_XML_APM_PARSING_FAILED
Language=English
The account import xml file format validation failed.
.
MessageId=0xFD15
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_DIRECTORY_EMPTY_BIND_PARAMETERS
Language=English
The directory bind parameters specified were empty.
.
;
;// Java Data Lookup errors 0xFE00-0xFE0F
;// Note - these are identical to WGN_S_ALP_TRUE, etc.
;// A few of these have been copied here to avoid ambiguities with WgnErr.java, etc.
;
MessageId=0xFE00
Severity=Success
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ALP_TRUE
Language=English
The lookup evaluates to TRUE: the trigger can be fired.
.
MessageId=0xFE01
Severity=Success
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ALP_FALSE
Language=English
The lookup evaluates to FALSE: the trigger cannot be fired.
.
MessageId=0xFE02
Severity=Success
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ALP_IGNORE
Language=English
The lookup was not applicable in the context in which it was made.
.
MessageId=0xFE03
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ALP_SYNTAX_ERROR
Language=English
Syntax error in the query string.
.
MessageId=0xFE04
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ALP_DATA_NOT_FOUND
Language=English
The specified data could not be found.
.
MessageId=0xFE05
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ALP_ACCESS_DENIED
Language=English
The specified data could not be accessed.
.
MessageId=0xFE06
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_ALP_ATTRIBUTE_LOOKUP_FAILED
Language=English
There was an error looking up the attribute.
.
MessageId=0xFE07
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_LOOKUP_ERR_INVALID_EMAILFMT
Language=English
The email address is in an incorrect or unknown format.
.
MessageId=0xFE08
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_LOOKUP_ERR_INVALID_ATTRIB
Language=English
The email address conversion attribute %1 could not be found.
.
MessageId=0xFE09
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_LOOKUP_ERR_NOSUCH_MUNGE
Language=English
A suitable email address conversion method could not be found.
.
MessageId=0xFE0A
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_LOOKUP_NO_MATCHING_USER
Language=English
There is no user associated with this email address.
.
MessageId=0xFE0B
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_LOOKUP_AMBIGUOUS_TRANSLATION
Language=English
The email address matched multiple users.
.
MessageId=0xFE0C
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_LOOKUP_NO_MAPPING_NO_CREATE
Language=English
The email address did not match any users and a new account could not be created.
.
MessageId=0xFE0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_LOOKUP_NO_SUCH_USER_NO_CREATE
Language=English
The user name did not match any users and a new account could not be created.
.
MessageId=0xFE0E
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_LOOKUP_USER_EXISTS_BUT_LOOKUP_FAILED
Language=English
The import filter did not match for this user.
.
MessageId=0xFE0F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_JAVA_INF_LOOKUP_USER_EXISTS_BUT_LOOKUP_FAILED
Language=English
The import filter did not match for this user.
.

;
;// Java Provisioning Services errors 0xFF00-0xFFFF
;
MessageId=0xFF00
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_PROVISION_BASE_ERR
Language=English
Unknown provisioning services error.
.
MessageId=0xFF01
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_PROVISION_SESSION_TOKEN_ERR
Language=English
The session token is invalid or not recognised by the provisioning service
.
MessageId=0xFF02
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_PROVISION_AUTHENTICATION_ERR
Language=English
The provisioning service could not authenticate the user
.
MessageId=0xFF03
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_PROVISION_ATTRIBUTE_ERR
Language=English
Invalid value for provisioning attribute
.
MessageId=0xFF04
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_PROVISION_SESSION_TOKEN_IN_USE
Language=English
The supplied Session Token is currently in use. Please try again later.
.
MessageId=0xFF05
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_PROVISION_UPDATE_FAILURE
Language=English
An error occurred during the provisioning operation
.
MessageId=0xFF06
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_PROVISION_INITIALISATION_FAILURE
Language=English
An error occurred during the initialisation of the provisioning operation
.
MessageId=0xFF07
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_PROVISION_ITERATION_FAILURE
Language=English
An error occurred during the iteration of users by the provisioning server
.
MessageId=0xFF08
Severity=Error
Facility=Wigan
SymbolicName=WGN_JAVA_ERR_PROVISION_BAD_PRIVILEGES
Language=English
The user has insufficient privileges to provision users
.

;
;// Error codes specifically for the Wigan components of Lotus Notes.
;// All the codes are equivalent to a Notes STATUS definition using the PKG_ADDIN (0x3300) error code package.
;// Do not use the MessageId=0x3300.
;
MessageId=0x3301
Severity=Error
Facility=Notes
SymbolicName=WGN_E_NOTES_WRONG_VERSION
Language=English
The version of Lotus Notes is unsupported, or incorrect for this version of the Extension.
.
MessageId=0x3302
Severity=Error
Facility=Notes
SymbolicName=WGN_E_NOTES_WRONG_HOST
Language=English
The host process for the extension is not one we want to attach to.
.
MessageId=0x3303
Severity=Error
Facility=Notes
SymbolicName=WGN_E_NOTES_EXT_DISABLED
Language=English
The extension is disabled.
.
MessageId=0x3304
Severity=Error
Facility=Notes
SymbolicName=WGN_E_NOTES_READ_DENIED
Language=English
The extension denied the reading of the email note.
.
MessageId=0x3305
Severity=Error
Facility=Notes
SymbolicName=WGN_E_NOTES_SEND_DENIED
Language=English
The extension denied the sending of the email note.
.
MessageId=0x3306
Severity=Error
Facility=Notes
SymbolicName=WGN_E_NOTES_INVALID_API_OUTPUT
Language=English
The output of an API call is invalid. For instance a NULL handle was returned unexpectedly.
.
MessageId=0x3307
Severity=Success
Facility=Notes
SymbolicName=WGN_W_NOTES_AMBIGUOUS_ADDRESS
Language=English
The name of a person or group (one or more name in the case of the Recipients) is ambiguous because it is found multiple times in the Address Books.
.
MessageId=0x3308
Severity=Error
Facility=Notes
SymbolicName=WGN_E_NOTES_THREAD_INIT_FAILED
Language=English
A worker thread could not be initialized to use Lotus Notes. We cannot access any data.
.
MessageId=0x3309
Severity=Success
Facility=Notes
SymbolicName=WGN_W_NOTES_OLE_WRAPPED
Language=English
The OLE attachment document could not be unwrapped. Its internal structure is the one used by Lotus Notes.
.
MessageId=0x330a
Severity=Error
Facility=Notes
SymbolicName=WGN_E_NOTES_MIME_CONTENT_DECODE_FAILED
Language=English
MIME content could not be decoded (and/or translated) into a displayable format, or is invalid.
.
MessageId=0x330b
Severity=Success
Facility=Notes
SymbolicName=WGN_W_NOTES_PLAINTEXT_FROM_HTML
Language=English
The HTML content of the email could not be preserved. It was converted to plaintext.
.
MessageId=0x330c
Severity=Error
Facility=Notes
SymbolicName=WGN_E_NOTES_INVALID_ARG_TYPE
Language=English
Invalid type of argument
.
MessageId=0x330d
Severity=Error
Facility=Notes
SymbolicName=WGN_E_NOTES_MEM_ALLOC
Language=English
Memory allocation error
.
MessageId=0x330e
Severity=Error
Facility=Notes
SymbolicName=WGN_E_NOTES_FORMULA_COMPILE
Language=English
An error occurred compiling a Notes formula.
.
MessageId=0x330f
Severity=Error
Facility=Notes
SymbolicName=WGN_E_NOTES_NOT_RAW_MIME_OR_INVALID
Language=English
The Notes note isn't an Internet message or its Internet content is invalid.
.
MessageId=0x3310
Severity=Success
Facility=Notes
SymbolicName=WGN_W_NOTES_INET_PROC_FAILED_USED_FALLBACK
Language=English
The Notes note contained an Internet message but its processing failed. The unprocessed Internet content as stored in the note items was captured instead.
.

;
;// Content Indexer status and log codes 0x1000-0x10FF
;// It's a bit of a mess that status codes and log codes are mixed up, and also that no naming
;// convention is used that would help to distinguish between the two (e.g. _LOG_ for a log code).
;
MessageId=0x1000   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_FILE         
Language=English
FILE ITEM : %1
.
MessageId=0x1001   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_WEB                
Language=English
WEB ITEM  : %1 %2
.
MessageId=0x1002   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_EMAIL_BODY         
Language=English
MAIL ITEM : %1
.
MessageId=0x1003   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_ATTACH             
Language=English
ATTACHMENT: %1 %2
.
MessageId=0x1004
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_ESTIMATE
Language=English
Estimated number of events to index: %1!lu!
.
MessageId=0x1005   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_GROUP              
Language=English
GROUP: %1!ls!
.
MessageId=0x1006   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_USER               
Language=English
USER: %1!ls!
.
MessageId=0x1007   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_CMS                
Language=English
CMS: %1
.
MessageId=0x1008   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_FILTER             
Language=English
FILTER: %1
.
MessageId=0x1009   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_TERMINATED         
Language=English
Terminated before completion.
.
MessageId=0x100A   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_INDEX_FILE      
Language=English
INDEX FILE: %1
.
MessageId=0x100B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_RETRY_LOGON
Language=English
Connection to be reattempted in %1!lu! seconds.
.
MessageId=0x100C   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_DONE_EVENTS        
Language=English
Events Processed: %1!lu!
.
MessageId=0x100D   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_DONE_DOCS          
Language=English
Documents Indexed: %1!lu!
.
MessageId=0x100E   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_DONE_FAILED        
Language=English
Documents Failed: %1!lu!
.
MessageId=0x100F   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_DONE_ERRORS        
Language=English
System Errors: %1!lu!
.
MessageId=0x1010   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_DONE_TIME          
Language=English
Elapsed Time: %1 seconds
.
MessageId=0x1011   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_DONE_RATE          
Language=English
Documents/second: %1
.
MessageId=0x1012   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_STARTING           
Language=English
Job starting: %1
.
MessageId=0x1013   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_DRE_RESP           
Language=English
Content Database response '%1!ls!'
.
MessageId=0x1014   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_NO_TEXT_EMPTY      
Language=English
No text to be extracted from '%1'
.
MessageId=0x1015   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_WAIT_AUTOINDEXER   
Language=English
Waiting for the Content Database to finish importing.
.
MessageId=0x1016   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_NO_GROUP           
Language=English
No groups found matching '%1'.
.
MessageId=0x1017   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_RETRY              
Language=English
RETRY: %1
.
MessageId=0x1018   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_DUPLICATE          
Language=English
DUPLICATE ITEM
.
MessageId=0x1019   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_SUBMIT_BATCH       
Language=English
%1!ld! documents queued for submission to the Content Database.
.
MessageId=0x101A   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_BATCH_SUBMITTED    
Language=English
%1!ld! documents submitted to the Content Database. Index ID %2!ld!
.
MessageId=0x101B   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_BATCH_COMPLETE     
Language=English
Content Database finished processing Index ID %1!ld!
.
MessageId=0x101C   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_WEB_SKIP_TRUNCATED 
Language=English
WEB (Skipped): %1 %2 (truncated)
.
MessageId=0x101D   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_WEB_SKIP           
Language=English
WEB (Skipped): %1 %2
.
MessageId=0x101E   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_NO_TEXTOR          
Language=English
No text could be extracted.
.
MessageId=0x101F   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_NO_TEXT_EMPTY2     
Language=English
No text to be extracted
.
MessageId=0x1020   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_NO_TEXT_EMPTY_WEB  
Language=English
WEB ITEM : %1 '%2' has no textural content to index.
.
MessageId=0x1021   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_INDEX_WEB          
Language=English
INDEX WEB : %1
.
MessageId=0x1022   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_INDEX_MAIL         
Language=English
INDEX MAIL: %1
.
MessageId=0x1023   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_INDEX_ATTACH       
Language=English
INDEX ITEM: %1
.
MessageId=0x1024   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_TIME_BEFORE        
Language=English
Index events before %1
.
MessageId=0x1025   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_TIME_AFTER         
Language=English
Index events after %1
.
MessageId=0x1026   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_TIMESLICE_OPEN     
Language=English
Time slice to %1
.
MessageId=0x1027   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_TIMESLICE_CLOSED   
Language=English
Time slice from %1 to %2
.
MessageId=0x1028   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_JOB_COMPLETE       
Language=English
Job complete
.
MessageId=0x1029   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_JOB_COMPLETE_DRE   
Language=English
Job complete. The Content Database may still have data to process.
.
MessageId=0x102A   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_BATCH_SUBMITTED2   
Language=English
Documents submitted to the Content Database. Index ID %1!ld!
.
MessageId=0x102B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_DELETE_EVENT
Language=English
DELETE: %1
.
MessageId=0x102C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_NOT_IN_DRE
Language=English
Nothing to delete: %1
.
MessageId=0x102D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_RESUBMIT
Language=English
Interrupted batch will be resubmitted.
.
MessageId=0x102E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_CONNECT_DRE
Language=English
Connecting to the Content Database.
.
MessageId=0x102F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_INDEX_IM
Language=English
INDEX IM  : %1
.
MessageId=0x1030
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_FAST_BATCH_SUBMIT
Language=English
Batch Submitted: %1!ls!
.
MessageId=0x1031
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_FAST_BATCH_COMPLETE
Language=English
Batch Complete: %1!ls!
.
MessageId=0x1032
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_QUERY
Language=English
Submitting Query:
%1
.
MessageId=0x1033   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_PAUSED_DOCS          
Language=English
Processing halted - DOCLIMIT reached. Docs Processed: %1!lu!
.
MessageId=0x1034   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_PAUSED_EVENTS          
Language=English
Processing halted - EVENTLIMIT reached. Events Processed: %1!lu!
.
;
;// Content Indexer warnings
;
MessageId=0x1035   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_W_RESUBMIT               
Language=English
Resubmitting file from previous job (%1).
.
MessageId=0x1036   
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_FAILEDATTACHMENT       
Language=English
Failed to index file: %1
.
MessageId=0x1037   
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_DRE_CANTCHECK          
Language=English
Unable to check status of Content Database.
.
MessageId=0x1038   
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_PROBABLE_INDEX_PORT    
Language=English
The specified index port (%1!lu!) is invalid. There appears to be an index port at %2!lu!
.
MessageId=0x1039
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_ERROR_AS_WARNING
Language=English
%1 (%2)
.
MessageId=0x103A
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_FAST_TIMEOUT
Language=English
Timeout accessing the Content Database.
.
MessageId=0x103B
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_FAST_LATE_CALLBACK
Language=English
Callback Received After Timeout: %1!ls!
.
MessageId=0x103C
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_FAST_BATCH_NO_CALLBACK_RETRY
Language=English
No Callback - Retrying Batch: %1!ls!
.
MessageId=0x103D 
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_DRE_TIMED_OUT          
Language=English
Index attempt timed out. Retrying.
.
MessageId=0x103E 
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_AUTOINDEXER            
Language=English
Using AutoIndexer via '%1!hs!'
.
MessageId=0x103F
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_AUTOINDEXER_BLOCKED    
Language=English
Content Database indexing process appears to be inactive.
.
MessageId=0x1040
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_AUTOINDEXER_RESUMED    
Language=English
Content Database indexing activity resumed.
.
;
;// Content indexer errors (mainly)
;
MessageId=0x1041   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_DRE_REASON              
Language=English
Content Database Error: %1 - %2!ls! (%3!d!)
.
MessageId=0x1042   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_DRE_GENERAL             
Language=English
Content Database Error: %1!ls! (%2!d!)
.
MessageId=0x1043
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_FAILEDEVENT    
Language=English
Failed to index event: %1
.
MessageId=0x1044
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_IGNORED_EVENTS        
Language=English
Events Ignored: %1!lu!
.
MessageId=0x1047   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_WRONG_CMS               
Language=English
Wrong CMS
.
MessageId=0x1048   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAILED_CREATE_DIR       
Language=English
Failed to create %1
.
MessageId=0x1049   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAILED_CREATE_IDX       
Language=English
Failed to create %1
.
MessageId=0x104A   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAILED_CREATE_FILE      
Language=English
Failed to create %1
.
MessageId=0x104B   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAILED_WRITE            
Language=English
Failed to write to file.
.
MessageId=0x104C   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAILED_LOGON            
Language=English
Failed to log in to CMS.
.
MessageId=0x104D   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAILED_CONNECT          
Language=English
Failed to connect to infrastructure.
.
MessageId=0x104E   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAILED_CONNECT_DB_DEPRECATED
Language=English
*Obsolete* Failed to connect to the Content Database on %1:%2!lu!
.
MessageId=0x104F   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_NO_USER1                
Language=English
User '%1' not found.
.
MessageId=0x1050   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_NO_USER2                
Language=English
User '%1' not found.
.
MessageId=0x1051   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_GROUP_AMBIGUOUS         
Language=English
Group name '%1' is ambiguous.
.
MessageId=0x1052   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAILED_LOG              
Language=English
Failed to open file: %1
.
MessageId=0x1053
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_ERROR            
Language=English
Unrecoverable Error.
.
MessageId=0x1054   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_SYSTEM                  
Language=English
System Error: %1 (0x%2!08x!)
.
MessageId=0x1055
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAILED_DELETE1          
Language=English
Failed to delete %1
.
MessageId=0x1056   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAILED_DELETE2          
Language=English
Failed to delete %1
.
MessageId=0x1057   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_UNABLE_MONITOR          
Language=English
Unable to monitor %1
.
MessageId=0x1058   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_QUERY_FAILED            
Language=English
RunQuery Failed: %1
.
MessageId=0x1059   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_SET_QUERY_FAILED        
Language=English
SetQueryString Failed: %1
.
MessageId=0x105A   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_ADD_EVENT_FAILED        
Language=English
Failed to index event %1 with %2
.
MessageId=0x105B
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAILED_LOGON2           
Language=English
Failed to log in to %1
.
MessageId=0x105C
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_SUBMIT_BATCH            
Language=English
Failed to communicate with the Content Database.
.
MessageId=0x105D   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_WRITE_CACHE             
Language=English
Failed to write to the Content Database cache.
.
MessageId=0x105E   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_WRITE_DRE               
Language=English
Failed to post data to the Content Database.
.
MessageId=0x105F   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_NO_CREDENTIALS          
Language=English
Unable to retrieve login credentials for %1.
.
MessageId=0x1060   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_NO_SERVER               
Language=English
No CMS specified
.
MessageId=0x1061   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_RESUBMIT                
Language=English
Failed to index %1
.
MessageId=0x1062   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_WIGAN_ENUM              
Language=English
Error querying CMS (retrieving record %1!lu! out of %2!lu!).
.
MessageId=0x1063   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_WIGAN_ENUM2             
Language=English
Error querying CMS (retrieving record %1!lu!).
.
MessageId=0x1064   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_CHANGELIST              
Language=English
Error retrieving event changes on notification.
.
MessageId=0x1065   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_CONNECTION_LOST
Language=English
Connection to CMS lost.
.
MessageId=0x1066   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_DRE_DISKSPACE           
Language=English
Content Database is out of disk space (Index ID %1!ld!).
.
MessageId=0x1067   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_DRE_IDXFILE             
Language=English
Content Database could not read from the file cache (Index ID %1!ld!).
.
MessageId=0x1068   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_DRE_DATABASE            
Language=English
Content Database reports invalid database specified (Index ID %1!ld!).
.
MessageId=0x1069   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_DRE_BADPARAM            
Language=English
Content Database received an invalid parameter (Index ID %1!ld!).
.
MessageId=0x106A   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_DRE_UNKNOWN             
Language=English
Content Database unknown status (Index ID %1!ld!): %2!ls!
.
MessageId=0x106B  
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_QUEUE_EVENT_FAILED      
Language=English
Failed to index event: EVENT=%1!lX!%2!08lX!:%3!08lX!
.
MessageId=0x106C   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_EXCEPTION_GENERAL       
Language=English
Exception processing event
.
MessageId=0x106D   
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_EXCEPTION_TEXTOR        
Language=English
Exception extracting text from event data.
.
MessageId=0x106E
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_CONNECTION_LOST_NOTIFIED
Language=English
CMS shutting down - connection lost.
.
MessageId=0x106F
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_NO_QUERY_PORT
Language=English
The Content Database Query Port has not been specified.
.
MessageId=0x1070
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_NO_INDEX_PORT
Language=English
The Content Database Index Port has not been specified.
.
MessageId=0x1071
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_INVALID_QUERY_PORT
Language=English
No recognized response from the Content Database Query Port.
.
MessageId=0x1072
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_INVALID_INDEX_PORT
Language=English
No recognized response from the Content Database Index Port.
.
MessageId=0x1073
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_PORT_MISMATCH
Language=English
The specified Query and Index Ports do not correspond to the same Content Database.
.
MessageId=0x1074
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_QUERY_PORT_CLOSED
Language=English
The Content Database has refused access to the Query Port.
.
MessageId=0x1075
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_INDEX_PORT_CLOSED
Language=English
The Content Database has refused access to the Index Port.
.
MessageId=0x1076
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_DELETE_JOB_ALREADY_RUNNING
Language=English
A delete notification job for this CMS is already running.
.
MessageId=0x1077
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_DRE_INTERRUPTED
Language=English
Content Database was interrupted (Index ID %1!ld!) - possible service restart.
.
MessageId=0x1078
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_NO_RESUBMIT
Language=English
Interrupted batch cannot be resubmitted.
.
MessageId=0x1079
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_LOAD_EVL
Language=English
Failed to load Event Link: %1
.
MessageId=0x107A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_CREATE_EVL
Language=English
Created Event Link: %1
.
MessageId=0x107B
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAST_BAD_COLLECTION
Language=English
The specified Content Database collection does not exist.
.
MessageId=0x107C
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAST_EXCEPTION
Language=English
Unrecognized exception raised by Content Database.
.
MessageId=0x107D
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_TOO_LARGE
Language=English
Item not submitted to the Content Database as it exceeds the maximum size limit (%1KB) by %2KB.
.
MessageId=0x107E
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_STREAM_TRUNCATED
Language=English
Source data stream truncated.
.
MessageId=0x107F
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAST_SERVICE_MISMATCH
Language=English
A connection to a different Content Database is already established. Unable to connect.
.
MessageId=0x1080
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAST_ERROR
Language=English
Content Database Error: %1!ls!
.
MessageId=0x1081
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAST_ERROR_BATCH
Language=English
Content DB Batch Error: %1!ls!: %2!ls!
.
MessageId=0x1082
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAST_ERROR_FILE
Language=English
Content DB Item Error: %1!ls!
.
MessageId=0x1083
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_UNSUPPORTED_ENGINE
Language=English
Support for the required Content Database is not installed.
.
MessageId=0x1084
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAST_BATCH_NO_CALLBACK_FAIL
Language=English
No Callback - Batch Failed: %1!ls!
.
MessageId=0x1085
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_ALL_THREADS_DEAD
Language=English
No threads are able to submit data to the Content Database.
.
MessageId=0x1086
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_FAST_UNKNOWN_EXCEPTION
Language=English
Unidentified exception raised by the Content Database.
.
MessageId=0x1087
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_BATCH_RETRIES_EXHAUSTED
Language=English
Failed to submit batch of documents. Maximum retry count reached.
.
;
;// Content indexer status codes and messages continued 0x10A0 - 0x10FF
;
;// WGN_CI_I_INIT_TIMESLICE and WGN_CI_I_INIT_TIMESLICE_DONE must be consecutive
MessageId=0x10A0
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_INIT_TIMESLICE
Language=English
Submitting initial query (to identify earliest event).
.
MessageId=0x10A1
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_INIT_TIMESLICE_DONE
Language=English
Initial query complete.
.
;// WGN_CI_I_FIRST_TIMESLICE and WGN_CI_I_FIRST_TIMESLICE_DONE must be consecutive
MessageId=0x10A2
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_FIRST_TIMESLICE
Language=English
Submitting first full query.
.
MessageId=0x10A3
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_FIRST_TIMESLICE_DONE
Language=English
First full query complete.
.
MessageId=0x10A4
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_INDEX_FAILED
Language=English
Index Failed: %1!ls! (%2!ls!)
.
MessageId=0x10A6
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_CONNECT_CONTENTDB_DEPRECATED
Language=English
*Obsolete* Connecting to the %1 Content Database at %2:%3!lu!
.
MessageId=0x10A7
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_PREEMPTIVE_QUERY
Language=English
Issuing pre-emptive timeslice query.
.
MessageId=0x10A8   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_SKIP_ATTACH       
Language=English
SKIP ITEM : %1
.
MessageId=0x10A9
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_CREATE_EVL_FAIL
Language=English
Failed to write to Event Link %1 with error 0x%2!lx!
.
MessageId=0x10AA
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_BAD_CONTENT_PROVIDER
Language=English
The Content Connector could not be started. It may not be installed, may be the wrong version or may have failed to initialize.
.
MessageId=0x10AB
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_LOG_CONNECT_CONTENT_PROVIDER_LS
Language=English
Connecting to the Content Connector %1!ls!.
.

MessageId=0x10AC
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_ITEM_FAILED_EXTRACTION 
Language=English
Failed to index document: %1 with error %2 reported during extraction.
.
MessageId=0x10AD
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_ITEM_SUBMIT
Language=English
Submitted document %1 (%2!d!) for indexing.
.
MessageId=0x10AE
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_ITEM_COMPLETE
Language=English
Completed indexing document: %1 (%2)
.
MessageId=0x10AF
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_ITEM_FAILED_PROVIDER 
Language=English
Failed to index document: %1 (%2) with error %3 reported by the Content Connector.
.
MessageId=0x10B0   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_DOCS_QUEUED        
Language=English
Documents Pending: %1!lu!
.
MessageId=0x10B1
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_XML_PROVIDER_NODOCREF
Language=English
Required XML node 'DocumentUserReference' was not found.
.
MessageId=0x10B2
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_XML_PROVIDER_BAD
Language=English
Content Connector supplied XML failed to be parsed with error '%1'.
.
MessageId=0x10B3
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_XML_PROVIDER_CUSTOMMSG
Language=English
Content Connector reported custom message: '%1', code '%2' with severity '%3'.
.
MessageId=0x10B4
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_XML_PROVIDER_PARMERR
Language=English
Content Connector reported parameter error '%1' for '%2': '%3'.
.
MessageId=0x10B5
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_XML_PROVIDER_NOSTATUS
Language=English
Required XML node 'Status' was not found.
.
MessageId=0x10B6
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_XML_PROVIDER_STATUS
Language=English
Content Connector reported status: CurrentState '%1', PreviousState '%2', Effector '%3', Operation '%4', Result '%5'.
.
MessageId=0x10B7
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_WAIT_PROVIDER_COMPLETE
Language=English
Waiting for %1!lu! documents to be processed by the Content Connector.
.
MessageId=0x10B8
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_PROVIDER_EXCEPTION
Language=English
The Content Connector threw an exception.
.
MessageId=0x10B9
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_STREAM_TOOLARGE
Language=English
The content stream is too large to process.
.
MessageId=0x10BA
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_PROVIDER_CALL_FAIL
Language=English
The Content Connector failed to %1 with %2.
.
MessageId=0x10BB
Severity=Warning
Facility=Wigan
SymbolicName=WGN_CI_W_XML_PROVIDER_MISSINGPARM
Language=English
The expected parameter %1 was not found in the Content Connector status report for document %2 (%3).
.
MessageId=0x10BC   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_JOB_STOPPING       
Language=English
Job stopping due to user request.
.
MessageId=0x10BD   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_JOB_PAUSING       
Language=English
Job pausing due to user request.
.
MessageId=0x10BE   
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_JOB_RESUMING       
Language=English
Job resuming due to user request.
.
MessageId=0x10BF
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_ATTACHMENT_NO_CONTENT       
Language=English
No attachment data was captured: %1.
.
MessageId=0x10C0
Severity=Informational
Facility=Wigan
SymbolicName=WGN_CI_I_ITEM_FAILED_NOEVL       
Language=English
Document is not retryable. Skipping EVL generation.
.
MessageId=0x10C1
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_SCODE_E_EVENT_EXCEPTION
Language=English
An unknown exception was caught processing the event.
.
MessageId=0x10C2
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_SCODE_E_CONTENT_EXCEPTION
Language=English
Caught Exception processing event content.
.
MessageId=0x10C3
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_STATUSREPORT_EXCEPTION
Language=English
Caught Exception processing status report: %1
.
MessageId=0x10C4
Severity=Error
Facility=Wigan
SymbolicName=WGN_CI_E_PROVIDER_ERROR
Language=English
Content Connector reported Indexer error: %1.
.
;
; // Appmon status codes 0x1100 - 0x11FF
;
MessageId=0x1100
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TERMINATE_APP
Language=English
The application is prohibited and will be terminated.
.
MessageId=0x1101
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_VERSION_INFO
Language=English
The version resource information is invalid.
.

;
; // Remote Data Manager status codes 0x1200 - 0x127F
;
MessageId=0x1200
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_UNKNOWN_PREFIX
Language=English
The Remote Data location prefix is not recognized.
.
MessageId=0x1201
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_HTTP_REQUEST_FAILED
Language=English
The Archive Server has failed the read request.
.
MessageId=0x1202
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_INVALID_DATA
Language=English
The Remote Data Manager was given invalid data.
.
MessageId=0x1203
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_HTTP_ACCESS_DENIED
Language=English
The Archive Server denied access to the data.
.
MessageId=0x1204
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_EVF_FILE_NOT_FOUND
Language=English
The Remote Data Manager could not find the file.
.
MessageId=0x1205
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_GENERAL_ERROR
Language=English
The Remote Data Manager was unable to process the request due to an internal error.
.
MessageId=0x1206
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_HTTP_CONNECT_FAIL
Language=English
The Remote Data Manager was unable to connect to the Archive Server.
.
MessageId=0x1207
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_NOT_ENOUGH_DATA
Language=English
The Remote Data Manager was given insufficient data.
.
MessageId=0x1208
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_EVENT_CREATION_FAILED
Language=English
The Remote Data Manager was unable to create an event from the supplied data.
.
MessageId=0x1209
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_DATA_SEND_ERROR
Language=English
The Remote Data Manager failed to transmit the data.
.
MessageId=0x120A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_APS_KEY_NOT_FOUND
Language=English
The AppStor Server has failed the read request.
.
MessageId=0x120B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_APS_BAD_SERVER
Language=English
The Remote Data Manager was unable to access the AppStor server.
.
MessageId=0x120C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_APS_BAD_PPTEMP_DLL
Language=English
Failed to create Persist MAPI Class object.
.
MessageId=0x120D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_BAD_CONFIG
Language=English
The Remote data Manager has not been configured correctly.
.
MessageId=0x120E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_BAD_SEV_CONFIG
Language=English
The Enterprise Vault searching service does not appear to be working, please check.
.
MessageId=0x120F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_SEV_ACCESS_DENIED
Language=English
The Enterprise Vault searching has denied access to search, please check admin privileges.
.
MessageId=0x1210
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_SEV_NO_RESULTS
Language=English
The Enterprise Vault search returned no results.
.
MessageId=0x1211
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_IRM_BAD_RETRIEVAL_DLL
Language=English
Failed to create Iron Mountain Retrieval Object. 
.
MessageId=0x1212
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_SEV_FAILED_TO_RETRIEVE_EVENT
Language=English
The Enterprise Vault has failed to return archived object.
.
MessageId=0x1213
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_SEV_INCORRECT_UNIQUE_IDENTIFIER
Language=English
Could not use the supplied unique identifier to retrieve the event from Enterprise Vault. The identifier may have been generated by a deprecated version of the Enterprise Vault integration.
.
MessageId=0x1214
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CS_CONNECT_FAILURE
Language=English
Unable to connect to the Content Manager Interface service. It may not be running or the RDM address/port number configuration is incorrect.
.
MessageId=0x1215
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CS_CONFIG_FAILURE
Language=English
Unable to configure the Content Manager Interface service connection. The RDM address/port number configuration is incorrect or the interface service is not the correct version.
.
MessageId=0x1216
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CS_LOGIN_FAILURE
Language=English
Unable to log in to the Content Manager. The RDM settings may be incorrect or the Content Manager/Information Integrator may not be configured correctly.
.
MessageId=0x1217
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CS_COMMS_FAILURE
Language=English
Failure when communicating with the Content Manager Interface service. The connection was lost during a file operation.
.
MessageId=0x1218
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CS_DATA_FORMAT_ERROR
Language=English
The format of the data supplied by the Content Manager in a bundled event is incorrect or not enough data was supplied. The Content Manager Interface service may have terminated or the RDM and CS settings may be incorrect.
.
MessageId=0x1219
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CS_OUT_OF_MEM
Language=English
Unable to allocate a memory block to retrieve data from the Content Manager.
.
MessageId=0x121A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CS_BUNDLED_EVENT_NOT_FOUND
Language=English
Unable retrieve a bundled event from the Content Manager because the identifier was not found in the Library Server database.
.
MessageId=0x121B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EEX_EVENT_NOT_FOUND
Language=English
Unable to retrieve event from EMC EmailXtender.
.
MessageId=0x121C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_ZDS_BAD_RETRIEVAL_DLL
Language=English
Failed to create ZANTAZ Retrieval Object. 
.
MessageId=0x121D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_FNET_BAD_RETRIEVAL_DLL
Language=English
Failed to create IBM FileNet P8 Retrieval Object. 
.
MessageId=0x121E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CAMM_EVENT_NOT_FOUND
Language=English
Unable to retrieve event from CA Message Manager.
.

;
; // Remote Data Manager CSLD status codes 0x1220 - 0x122F - Log messages 0x12A0 - 0x12AF
;
MessageId=0x1220
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_LOADING_NOTES_HELPER
Language=English
Error loading Notes Helper.
.
MessageId=0x1221
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_OPEN_MAILSTORE
Language=English
Error opening mailstore.
.
MessageId=0x1222
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_CREATE_EMAIL
Language=English
Error creating email in mailstore.
.
MessageId=0x1223
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_QUERY_INTERFACE
Language=English
Error loading Notes CSLD Helper.
.
MessageId=0x1224
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_POPULATE_NOTE
Language=English
Error populating Note From CSLD Stream.
.
MessageId=0x1225
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_IMPORT_INTERFACE
Language=English
Error creating Import Interface for CSLD Note.
.
MessageId=0x1226
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_CREATE_EVENT
Language=English
Error creating Wigan Event from CSLD Note.
.
MessageId=0x1227
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_WRITE_EVENT
Language=English
Error writing Wigan Event to stream.
.
MessageId=0x1228
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CS_PASSWORD
Language=English
Unable to obtain Common Store password.
.
MessageId=0x1229
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_CLIENT_PASSWORD
Language=English
Unable to obtain Notes Client password.
.


;
; // Remote Data Manager log message codes 0x1280 - 0x12FF
;
MessageId=0x1280
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_SERVER_INIT
Language=English
The Remote Data Manager failed to initialize and is now disabled: %1.
.
MessageId=0x1281
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_SERVER_START
Language=English
The Remote Data Manager failed to start: %1.
.
MessageId=0x1282
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_RDM_SERVER_START
Language=English
The Remote Data Manager has started successfully.
.
MessageId=0x1283
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_JOB_ACTION
Language=English
The Remote Data Manager failed to action a job request: %1.
.
MessageId=0x1284
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_REQUEST_FAILED
Language=English
The Remote Data Manager failed to process a request: %1.
.
MessageId=0x1285
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_HTTP_READ
Language=English
The Remote Data Manager failed to retrieve file from the archive: %1.
.
MessageId=0x1286
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_EVENT_CONVERT
Language=English
The Remote Data Manager failed to process the email: %1.
.
MessageId=0x1287
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_TRANSMIT
Language=English
The Remote Data Manager failed to transmit the email: %1.
.
MessageId=0x1288
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_HTTP_SPECIFIC_ERROR
Language=English
Archive-specific error: %1.
.
MessageId=0x1289
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_HTTP_OPEN
Language=English
The Remote Data Manager failed to contact the Archive Server: %1.
.
MessageId=0x1290
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_HTTP_IIS_OPEN
Language=English
The Archive Server returned status code %1 (%2).
.
MessageId=0x1291
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_MAPI_INIT
Language=English
The Remote Data Manager failed to initialize MAPI (%1). Please ensure a Microsoft Exchange-compatible email application such as Outlook is the default email application.
.
MessageId=0x1292
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_EVENT_BAD_STG_FORMAT
Language=English
The Remote Data Manager failed to process the email because it was not a valid structured storage file.
.
MessageId=0x1293
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_RDM_HTTP_RETRYING
Language=English
The Remote Data Manager is trying again to retrieve message '%1' from the archive.
.
MessageId=0x1294
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_HTTP_RETRY_EXCEEDED
Language=English
The Remote Data Manager has failed to retrieve message '%1' from the archive.
.
MessageId=0x1295
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_APS_REQUEST_FAILED
Language=English
The Remote Data Manager failed to retrieve file from the AppStor Server: %1.
.
MessageId=0x1296
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_HTTP_READ_ZERO
Language=English
The Remote Data Manager received zero bytes from the archive.
.
MessageId=0x1297
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_IRM_BAD_RETRIEVAL_DLL_LOG
Language=English
The Remote Data Manager failed to create the Iron Mountain Adapter retrieval object: %1. 
.
MessageId=0x1298
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_SEV_OBJECT_STARTUP
Language=English
The Remote Data Manager failed to create the Symantec Enterprise Vault '%1' object: %2.
.
MessageId=0x1299
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_SEV_ITEM_RETRIEVAL
Language=English
The Remote Data Manager failed to retrieve item '%1' from Symantec Enterprise Vault: %2.
.
MessageId=0x129a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_SEV_ITEM_SEARCH
Language=English
The Remote Data Manager failed to find item '%1' in Symantec Enterprise Vault: %2.
.
MessageId=0x129b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CS_LOG_BAD_EVENT
Language=English
The Remote Data Manager failed to retrieve item '%1' from IBM Content Manager: %2.
.
MessageId=0x129c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_EEX_LOG_BAD_SERVER
Language=English
The Remote Data Manager was unable to load the EMC EmailXtender retrieval object: %1.
.
MessageId=0x129d
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_EEX_LOG_BAD_EVENT
Language=English
The Remote Data Manager failed to retrieve item '%1' from EMC EmailXtender: %2.
.
MessageId=0x129e
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_ZDS_BAD_RETRIEVAL_DLL_LOG
Language=English
The Remote Data Manager failed to create the ZANTAZ Adapter retrieval object: %1. 
.
MessageId=0x129f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_FNET_BAD_RETRIEVAL_DLL_LOG
Language=English
The Remote Data Manager failed to create the IBM FileNet P8 Adapter retrieval object: %1. 
.

;
; // Remote Data Manager CSLD log message codes 0x12A0 - 0x12A9 - Log message for 0x1220 - 0x122F
;
MessageId=0x12A0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_LOG_LOADING_NOTES_HELPER
Language=English
Error loading Notes Helper - %1
.
MessageId=0x12A1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_LOG_OPEN_MAILSTORE
Language=English
Error opening mailstore '%2' - %1
.
MessageId=0x12A2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_LOG_CREATE_EMAIL
Language=English
Error creating email in mailstore '%2' - %1
.
MessageId=0x12A3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_LOG_QUERY_INTERFACE
Language=English
Error loading Notes CSLD Helper - %1
.
MessageId=0x12A4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_LOG_POPULATE_NOTE
Language=English
Error populating Note From CSLD Stream - %1
.
MessageId=0x12A5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_LOG_IMPORT_INTERFACE
Language=English
Error creating Import Interface for CSLD Note - %1
.
MessageId=0x12A6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_LOG_CREATE_EVENT
Language=English
Error creating Wigan Event from CSLD Note - %1
.
MessageId=0x12A7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_LOG_WRITE_EVENT
Language=English
Error writing Wigan Event to stream - %1
.
MessageId=0x12A8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CS_LOG_PASSWORD
Language=English
Unable to obtain Common Store password - %1
.
MessageId=0x12A9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_CSLD_LOG_CLIENT_PASSWORD
Language=English
Unable to obtain Notes Client password - %1
.

;
; // Remote Data Manager EELD and EERF log message codes 0x12B0 - 0x12B9 - 
;
MessageId=0x12B0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_EMC_LOG_BAD_EVENT
Language=English
The Remote Data Manager failed to retrieve item '%1' from EMC EmailXtender for %2: %3.
.

MessageId=0x12B1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_EMC_LOG_EXPORT_FAILED
Language=English
The EMC EmailXtender for %1 failed to export item '%2' Status = '%3'.
.
MessageId=0x12B2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_EMC_LOG_THREW_EXCEPTION
Language=English
The EMC EmailXtender MsgCenterExportConnector threw an unexpected exception.
.

;
; // Remote Data Manager general log message codes 0x12C0 - 0x12C9
;
MessageId=0x12C0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_NOTES_INIT
Language=English
The Remote Data Manager failed to initialize Lotus Notes (%1).
.
MessageId=0x12C1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_READ_REQUEST_FAILED
Language=English
The Remote Data Manager failed to retrieve item '%2': %1.
.
MessageId=0x12C2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_IRM_LOG_BAD_EVENT
Language=English
The Remote Data Manager failed to retrieve item '%1' from Iron Mountain Digital Archive: %2.
.
MessageId=0x12C3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_ZDS_LOG_BAD_EVENT
Language=English
The Remote Data Manager failed to retrieve item '%1' from ZANTAZ Digital Safe: %2.
.
MessageId=0x12C4
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_RDM_ABOUT_TO_GET_DATA
Language=English
The Remote Data Manager for '%1' is about to retrieve the data for '%2'.
.
MessageId=0x12C5
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_RDM_GET_DATA_SUCCESS
Language=English
The Remote Data Manager for '%1' successfully retrieved the data for '%2'.
.
MessageId=0x12C6
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_RDM_GET_DATA_FAIL
Language=English
The Remote Data Manager for '%1' failed to retrieve the data for '%2'. Error: %3
.
MessageId=0x12C7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDM_SEVLD_NOT_AVAILABLE
Language=English
The Enterprise Vault export object for Domino is not available.
.






;
; // Policy Engine status codes 0x1300 - 0x13FF
;
MessageId=0x1300
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_SENDER_POLICY_ID
Language=English
The supplied policy ID for the sender is not the correct one for that user.
.
MessageId=0x1301
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_OBTAIN_POLICY_GROUP
Language=English
Internal Policy Engine failure: Could not obtain a policy group.
.
MessageId=0x1302
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ALREADY_REGISTERED
Language=English
An attempt was made to register a Policy Engine that was already registered.
.
MessageId=0x1303
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_EMAIL_ADDRESS_DOES_NOT_MATCH_USER
Language=English
The supplied email addresses do not match a known user.
.
MessageId=0x1304
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_EXPECT_ASYNC_CALLBACK
Language=English
A further asynchronous callback can be expected.
.
MessageId=0x1305
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_LOADING_POLICY_GROUP
Language=English
Loading policy %1
.
MessageId=0x1306
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_UPDATING_POLICY_GROUP
Language=English
Replacing policy %1 with policy %2
.
MessageId=0x1307
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_UNLOADING_POLICY_GROUP
Language=English
Unloading policy %1
.
MessageId=0x1308
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_TO_CREATE_WORK_ITEM
Language=English
An error occurred while creating a hub work item for the event.
.
MessageId=0x1309
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNABLE_TO_OBTAIN_CALLBACK_INTERFACE
Language=English
An error occurred while trying to obtain the hub client's callback interface.
.
MessageId=0x130A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_DISCONNECTED
Language=English
An RPC error occurred while trying call a Policy Engine.
.
MessageId=0x130B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ENGINE_DOES_NOT_SUPPORT_IDMAPPER
Language=English
Failed to obtain an IDMapper from the Policy Engine.
.
MessageId=0x130C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_COPYING_EVENT
Language=English
The Policy Engine Hub failed to copy the current event.
.
MessageId=0x130D
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_POLICY_ENGINE_REG_SUCCEEDED
Language=English
A Policy Engine connection was successfully created by machine '%1'
.
MessageId=0x130E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_REG_FAILED
Language=English
A Policy Engine connection created by machine '%1' failed to initialize. See the following message for details...
.
MessageId=0x130F
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_POLICY_ENGINE_UNREG
Language=English
The Policy Engine connection created by machine '%1' has been terminated.
.
MessageId=0x1310
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_LOG_ERROR
Language=English
The Policy Engine failed with error '%1'.
.
MessageId=0x1311
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_EXECUTION_FAILED
Language=English
The Policy Engine is in an invalid state and cannot be used.
.
MessageId=0x1312
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_SAVE_FAILED
Language=English
The Policy Engine failed to store an event in the database.
.
MessageId=0x1313
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_POLICY_ENGINE_PROCESSING_COMPLETE
Language=English
The Policy Engine has successfully completed event processing.
.
MessageId=0x1314
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_POLICY_ENGINE_ANALYSIS_COMPLETE 
Language=English
The Policy Engine has analyzed the event.
.
MessageId=0x1315
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_POLICY_ENGINE_ANALYSIS_PENDING 
Language=English
The Policy Engine is currently analyzing the event.
.
MessageId=0x1316
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_HUB_EVENT_TIMEOUT 
Language=English
The Policy Engine Hub has timed out the event.
.
MessageId=0x1317
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_POLICY_ENGINE_CLOSING_DOWN
Language=English
The Policy Engine has been closed down, and no more calls can be made.
.
MessageId=0x1318
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_NOT_REGISTERED
Language=English
A method on the Policy Engine interface was made before the client had registered.
.
MessageId=0x1319
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_INVALID_CLIENT_TYPE
Language=English
The supplied client type is not supported by the Policy Engine.
.
MessageId=0x131a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_INVALID_EVENT_TYPE
Language=English
The supplied event type is not supported by the Policy Engine.
.
MessageId=0x131b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_HUB_HEARTBEAT_GONE
Language=English
The heartbeat has not been received from the Policy Engine.
.
MessageId=0x131c
Severity=Success
Facility=Wigan
SymbolicName=WGN_E_HUB_THREAD_FINISHING
Language=English
The thread is being shut down.
.
MessageId=0x131d
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_HUB_SHUTDOWN
Language=English
The hub is being shut down.
.
MessageId=0x131e
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_HUB_PROXY_SHUTDOWN
Language=English
The Policy Engine proxy is being removed.
.
MessageId=0x131f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_INVALID_FALLBACK_POLICY_USER
Language=English
Failed to initialize the named fallback user in the Policy Engine.
.
MessageId=0x1320
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_INVALID_RECIPIENT_POLICY_USER
Language=English
The named recipient policy user or group does not exist.
.
MessageId=0x1321
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_HUB_EVENT_QUEUE_ABOVE_WATERMARK
Language=English
The Policy Engine Hub input queue is above a watermark, the event will be returned.
.
MessageId=0x1322
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_INITIALSE_EVENT_CLONE
Language=English
The event could not be transferred from the hub to the Policy Engine.
.
MessageId=0x1323
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_INITIALSE_EVENT_CLONE_LOG
Language=English
The Policy Engine failed to get an email from machine '%1' for processing. See the following message for details...  
.
MessageId=0x1324
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_CALLBACK_HUB
Language=English
The Policy Engine Hub could not be called.
.
MessageId=0x1325
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_CALLBACK_HUB_LOG
Language=English
Policy engine failed to contact machine '%1'. See the following message for details...  
.
MessageId=0x1326
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_HUB_LOG_ERROR
Language=English
The Policy Engine Hub failed with error '%1'.
.
MessageId=0x1327
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_CREATE_DIR_LOOKUP
Language=English
The Directory Lookup module could not be created.
.
MessageId=0x1328
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_CREATE_DIR_LOOKUP_LOG
Language=English
The Policy Engine failed to initialize the Directory Lookup module. See the following message for details...
.
MessageId=0x1329
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PE_NO_MATCHING_USER
Language=English
Could not find a user to match the supplied email address (or display name).
.
MessageId=0x132A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PE_NO_MATCHING_USER
Language=English
Policy was not applied to an event as no user matches the supplied event details and no default user is defined.
.
MessageId=0x132B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_POLICY_ENGINE_NO_FALLBACK_POLICY_USER
Language=English
The defined fallback user does not exist. 
.
MessageId=0x132C
Severity=Error 
Facility=Wigan
SymbolicName=WGN_E_HUB_BEING_SHUTDOWN
Language=English
The hub is being shut down.
.
MessageId=0x132D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_SET_FALLBACK_USER
Language=English
The Policy Engine failed to set '%1' as the fallback user. See the following message for details...  
.
MessageId=0x132E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_NO_FALLBACK_POLICY_USER
Language=English
The fallback policy was invoked, but no fallback user exists.
.
MessageId=0x132F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_SET_DEFAULT_USER
Language=English
The Policy Engine failed to set '%1' as the default user. See the following message for details...  
.
MessageId=0x1330
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_INVALID_DEFAULT_POLICY_USER
Language=English
Failed to initialize the named default user in the Policy Engine.
.
MessageId=0x1331
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_POLICY_ENGINE_NO_DEFAULT_POLICY_USER
Language=English
The default policy was invoked, but no default user exists.
.
MessageId=0x1332
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_NO_DEFAULT_POLICY_USER
Language=English
The default policy was invoked, but no default user exists.
.
MessageId=0x1333
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_FIND_APM_USER_FROM_EMAIL_ADDRESS
Language=English
A user could not be located or created for email address '%1'.  See the following message for details...
.
MessageId=0x1334
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_NO_MATCHING_USER
Language=English
Could not find a user to match the supplied email address (or display name).
.
MessageId=0x1335
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_HUB_LOG_FILE_ERROR
Language=English
Policy Engine Hub could not open (or create) log file. The hub will now close.
.
MessageId=0x1336
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_SAVE_EVENT
Language=English
An event could not be saved.
.
MessageId=0x1337
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_CONNECTION_TERMINATED
Language=English
A loaded policy instance terminated unexpectedly and will be restarted. 
.
MessageId=0x1338
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_RECONNECTION_FAILED
Language=English
The policy instance could not be reloaded for the following reason: '%1'. 
.
MessageId=0x1339
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INFRA_CONNECTION_LOST
Language=English
The connection to the infrastructure was terminated unexpectedly. 
.
MessageId=0x133A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNABLE_TO_OBTAIN_HUB_CALLBACK_INTERFACE
Language=English
An error occurred while trying to obtain the callback interface in the Policy Engine Hub.
.
MessageId=0x133B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNABLE_TO_OBTAIN_HUB_RESULTS_INTERFACE
Language=English
An error occurred while trying to obtain the client action results interface in the Policy Engine Hub.
.
MessageId=0x133C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLONE_EVENT_IN_HUB
Language=English
The Policy Engine Hub was unable to clone the event.
.
MessageId=0x133D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_CLIENT_AC_RES_MISSING
Language=English
A required client action result was not supplied.
.
MessageId=0x133E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_LOG_CLIENT_AC_RES_MISSING
Language=English
The client action result for decision ID '%1' was not supplied.
.
MessageId=0x133F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_POLICY_ENGINE_EVENT_IS_BEING_SAVED
Language=English
The event is being saved in the database.
.
MessageId=0x1340
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_HUB_CREDENTIALS_USER_SPECIFIED
Language=English
No hub credentials user has been specified.
.
MessageId=0x1341
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_SERVICE_NOT_STARTED
Language=English
An attempt was made to connect to a stopped Policy Engine.
.
MessageId=0x1342
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_OVERRIDE_USER_ADDRESS_PATTERN_LOG
Language=English
Failed to override the UserSpecificAddrPattern for the current event to: '%1'. See the following message for details...
.
MessageId=0x1343
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_OVERRIDE_USER_ADDRESS_PATTERN
Language=English
Failed to override the UserSpecificAddrPattern for the current event.
.
MessageId=0x1344
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INFRA_REQUIRED_RESTART;
Language=English
The connection to the infrastructure service was restarted after it was unexpectedly lost.
.
MessageId=0x1345
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_INFRA_CONNECTION_LOST
Language=English
The connection to the infrastructure was terminated unexpectedly.  It will be auto restarted. 
.
MessageId=0x1346
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_SERVICE_NOT_REGISTERED
Language=English
The Policy Engine service is not registered.
.
MessageId=0x1347
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_SERVICE_NOT_ACCESSABLE
Language=English
Could not connect to the service manager on the Policy Engine host machine.
.
MessageId=0x1348
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_SERVICE_ACCESS_DENIED
Language=English
Access is denied contacting the service manager on the Policy Engine host machine.
.
MessageId=0x1349
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ADDRESS_NOT_EXPANDED
Language=English
The email address was not expanded against a directory.
.
MessageId=0x134A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ASYNC_CLIENT_TYPE_NOT_SUPPORTED
Language=English
The Policy Engine does not support the supplied client type, as it requires asynchronous processing.
.
MessageId=0x134B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_CREATION_FAILURE
Language=English
The Policy Engine failed to create.
.
MessageId=0x134C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_CORE_FAILED_TO_START
Language=English
The Policy Engine processing core failed to start. See the following message for details...
.
MessageId=0x134D
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_POLICY_ENGINE_CORE_STARTED
Language=English
The Policy Engine processing core has started.
.
MessageId=0x134E
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_POLICY_ENGINE_CORE_SHUTDOWN
Language=English
The Policy Engine processing core has shut down.
.
MessageId=0x134F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_CLIENT_TYPE_DOES_NOT_MATCH
Language=English
The Policy Engine processing core does not support multiple client types.
.
MessageId=0x1350
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_CORE_NUMBER_LIMIT_REACHED
Language=English
Cannot create a Policy Engine processing core - the internal limit has been reached.
.
MessageId=0x1351
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MULTIPLE_SENDERS
Language=English
The supplied email has more than one sender.
.
MessageId=0x1352
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_CORE_SHUTDOWN_TIMEOUT
Language=English
The Policy Engine processing core timed out while waiting for it to shut down.
.
MessageId=0x1353
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_SAVE_EVENT_LOG
Language=English
An event with subject '%1' could not be saved.
.
MessageId=0x1354
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_FIND_DEFAULT_USER
Language=English
The specified default user '%1' could not be located. See the following message for details...
.
MessageId=0x1355
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_FIND_FALLBACK_USER
Language=English
The specified default user '%1' could not be located.  See the following message for details...
.
MessageId=0x1356
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_POLICY_ENGINE_AWAITING_COMPLETION
Language=English
The Policy Engine has successfully completed event processing and is waiting for the caller to commit or abort.
.
MessageId=0x1357
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_POLICY_ENGINE_SAVE_SUCCEEDED
Language=English
The Policy Engine successfully stored an event in the database.
.
MessageId=0x1358
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_ANALYSIS_INCOMPLETE
Language=English
The Policy Engine has not yet completed its analysis of an event.
.
MessageId=0x1359
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_CANNOT_COMMIT
Language=English
Second pass processing was invoked illegally, as there was no event to commit.
.
MessageId=0x135A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_CANNOT_ABORT
Language=English
Second pass processing was invoked illegally, as there was no event to abort.
.
MessageId=0x135B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_COMMIT_FAILED_NO_CORE
Language=English
Second pass processing was failed - Cound not commit the event.
.
MessageId=0x135C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_ABORT_FAILED_NO_CORE
Language=English
Second pass processing was failed - Could not abort the event.
.
MessageId=0x135D
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_POLICY_ENGINE_COMPLETION_PENDING
Language=English
The Policy Engine is currently completing the event.
.
MessageId=0x135E
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PE_POLICY_NOT_APPLIED
Language=English
Policy was not applied to the event.
.
MessageId=0x135F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PE_POLICY_NOT_APPLIED
Language=English
Policy was not applied to the event as no fallback user is defined
.
MessageId=0x1360
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_POLICY_ENGINE_EVENT_SAVE_DEFERRED
Language=English
The event save is in a pending state awaiting completion by the caller.
.
MessageId=0x1361
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ANALYSIS_THREAD_STALLED
Language=English
The Analysis thread %1 has become unresponsive.
.
MessageId=0x1362
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ANALYSIS_THREAD_STALLED_WHILE_PROCESSING_EVENT
Language=English
The Analysis thread stalled while processing email with subject '%1' from sender '%2'
.
MessageId=0x1363
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ANALYSIS_THREAD_HAS_RECOVERED
Language=English
The Analysis thread %1 has recovered from a stalled state.
.
MessageId=0x1364
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MISSING_BULK_SESSION_MANAGEMENT_PRIV
Language=English
The Policy Engine could not locate a user with the supplied email address because the Policy Engine user does not have the 'Allow Bulk Session Management' privilege.
.
MessageId=0x1365
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_TRIGGER_PROCESSING_TIME
Language=English
Trigger '%1' took %2 seconds to process event '%3'
.
MessageId=0x1366
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_CALLBACK_UPDATE_STATUS_LOG
Language=English
The Policy Engine failed to notify the caller that event of type '%1' with subject '%2' completed processing.  See following message for further details...
.
MessageId=0x1367
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_CALLBACK_CLIENT_DISCONNECTED_LOG
Language=English
The Policy Engine failed to notify the caller that event of type '%1' with subject '%2' completed processing, because the caller process has disconnected from the Policy Engine.
.
MessageId=0x1368
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_SET_DATA_AT_REST_DEFAULT_USER
Language=English
The Policy Engine failed to set '%1' as the Data at Rest default user. See the following message for details...  
.
MessageId=0x1369
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_ENGINE_INVALID_DATA_AT_REST_POLICY_USER
Language=English
Failed to initialize the named Data at Rest default user in the Policy Engine.
.
MessageId=0x136A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_POLICY_ENGINE_NO_DEFAULT_DATA_AT_REST_POLICY_USER
Language=English
The Data at Rest default user does not exist or has not been defined in policy.
.
MessageId=0x136B
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PE_NO_MATCHING_USER_POLICY
Language=English
Could not find a user to match the supplied policy particpant.
.
MessageId=0x136C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PE_NO_MATCHING_USER_POLICY
Language=English
Policy was not applied to an event as no user matches the supplied event details.
.
MessageId=0x136D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POLICY_INSTANCE_CONNECTION_NOT_AVAILABLE
Language=English
Processing of the event against policy could not continue.  This may be because the Policy Engine or local Infrastructure are shutting down. 
.
MessageId=0x136E
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_POLICY_INSTANCE_CONNECTION_NOT_AVAILABLE
Language=English
Processing of the event against policy could not continue.  This may be because the Policy Engine or local Infrastructure are shutting down. 
.
MessageId=0x136F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_CREATE_DIR_LOOKUP_RPC
Language=English
The Directory Lookup module could not be created.  This may because the local Infrastructure is not available.
.
MessageId=0x1370
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PE_FAILED_TO_CREATE_DIR_LOOKUP_RPC
Language=English
The Directory Lookup module could not be created.  This may because the local Infrastructure is not available.
.
MessageId=0x1371
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_FAILED_TO_FIND_USER
Language=English
The specified user '%1' could not be located.  See the following message for details...
.
MessageId=0x1372
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PE_DICTIONARY_REQUEST_NAME
Language=English
Policy Class Dictionary for user '%1' requested.
.
MessageId=0x1373
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_PE_DICTIONARY_REQUEST_SUCCEEDED
Language=English
Policy Class Dictionary request succeeded.
.
MessageId=0x1374
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_DICTIONARY_REQUEST_FAILED
Language=English
Policy Class Dictionary request failed with '%1'
.
MessageId=0x1375
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PE_DICTIONARY_REQUEST_ID
Language=English
Policy Class Dictionary for user policy '%1' requested.
.
MessageId=0x1376
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PE_POLICYCLASS_STATE_NOTUPDATED
Language=English
Failed to update the policy class state.
.
;
;// SMTP Sink status codes 0x1400 - 0x14FF
;//  WARNING: This section incorrectly contains some log codes (e.g. WGN_E_SMTPSINK_GENERIC). It's too late to move those.
;//  Define new log codes ONLY in 0x1B00 - 0x1BFF.
;//  Last reviewed for documentation accuracy in Nov/2010.
;
MessageId=0x1400
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_GENERIC
Language=English
%1
.
MessageId=0x1401
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_GENERIC
Language=English
%1
.
MessageId=0x1402
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_P1_RECIP_ERROR
Language=English
Error while collecting P1 recipients - list of P1 recipients might be incomplete.
.
MessageId=0x1403
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_SSW_FAILED_CREATE_MUTEX
Language=English
Failed to create the named mutex associated with email warning notifications.
.
MessageId=0x1404
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_SSW_ID_NOT_FOUND
Language=English
No email ID was found.
.
MessageId=0x1405
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_SSW_INVALID_ID
Language=English
The email ID is invalid.
.
MessageId=0x1406
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_EXCLUDE_NOT_SUCCESS_MESSAGE_STATUS
Language=English
The message should not be handled (IMMPID_MP_MESSAGE_STATUS not MP_STATUS_SUCCESS).
.
MessageId=0x1407
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_EXCLUDE_INTEGRATION_DISABLED
Language=English
The integration is disabled.
.
MessageId=0x1408
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_EXCLUDE_SERVER_PROCESSED
Language=English
The message has already been processed by a server agent.
.
MessageId=0x1409
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_EXCLUDE_APM_MAIL
Language=English
The message is a notification or audit email.
.
MessageId=0x140A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_EXCLUDE_BY_TYPE
Language=English
Excluded message type, e.g. report or WMI message.
.
MessageId=0x140B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_EXCLUDE_SSW_RESPONSE_MAIL_CONSUMED
Language=English
The message is an interactive warning response consumed by this agent.
.
MessageId=0x140C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_EXCLUDE_SSW_RESPONSE_MAIL_RELAYED
Language=English
The message is an interactive warning response not intended for this agent.
.
MessageId=0x140D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_EXCLUDE_CLIENT_PROCESSED
Language=English
The message has already been processed by a client agent.
.
MessageId=0x140E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_EXCLUDE_SENDER_FILTER
Language=English
The message has been excluded by the sender filter.
.
MessageId=0x140F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_EXCLUDE_BY_POLICY
Language=English
The message has not been captured by policy.
.
MessageId=0x1410
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_FAILED_TO_CONNECT_TO_HUB
Language=English
Failed to connect to the Hub.
.
MessageId=0x1411
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_FAILED_HUB_CALL_SETUP
Language=English
Failed to prepare the call to the Hub, possibly through a lack of resources.
.
MessageId=0x1412
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_FAILED_HUB_CALL
Language=English
The call to the Hub returned an error.
.
MessageId=0x1413
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_IN_FAILURE_MODE
Language=English
The SMTP sink is in failure mode.
.
MessageId=0x1414
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_DOMAIN_MAPPING_CONFLICTING_DOMAIN
Language=English
A Domain Mapping domain is defined more than once.
.

;
; // Directory Lookup codes 0x1500 - 0x157F
;
MessageId=0x1500
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DLOOK_FAIL_BIND_ROOTDSE
Language=English
The Directory Lookup Module could not bind to the rootDSE.  LDAP server is unavailable/authentication error.
.
MessageId=0x1501
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DLOOK_FAIL_NAMING_CONTEXT
Language=English
The Directory Lookup Module could not find the naming context.  Incorrect LDAP server version or setup.
.
MessageId=0x1502
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DLOOK_FAIL_BIND_PATH
Language=English
The Directory Lookup Module could not bind to the specified object.  Incorrect LDAP setup or object does not exist.
.
MessageId=0x1503
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DLOOK_FAIL_SEARCH_OPTIONS
Language=English
The Directory Lookup Module could not set search options.
.
MessageId=0x1504
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DLOOK_FAIL_EXEC_SEARCH
Language=English
The Directory Lookup Module could not execute the search.
.
MessageId=0x1505
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DLOOK_FAIL_LDAP_SERVER
Language=English
The Directory Lookup Module could not connect to the LDAP Server %1.  Additional information: %2 (searching for: %3).
.
MessageId=0x1506
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_DLOOK_CONNECT_LDAP_SERVER
Language=English
The Directory Lookup Module has successfully connected to the LDAP Server %1.
.
MessageId=0x1507
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_DLOOK_RECONNECT_LDAP_SERVER
Language=English
The Directory Lookup Module has successfully reconnected to the LDAP Server %1.
.
MessageId=0x1508
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_DLOOK_STARTED
Language=English
The Directory Lookup Module has started.
.
MessageId=0x1509
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DLOOK_NOT_INIT
Language=English
The Directory Lookup Module has not been initialized.
.
MessageId=0x150A
Severity=Error
Facility=Wigan
SymbolicName=WGN_S_DLOOK_INITCONNECT_EXCEPT
Language=English
An exception occurred while the Directory Lookup Module was initializing connections.
.
MessageId=0x150B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DLOOK_FAIL_LDAP_SERVER_NO_CONTEXT
Language=English
The Directory Lookup Module could not connect to the LDAP Server %1.  Additional information: %2.
.

;
; // Content Manager Interface codes 0x1580 - 0x15FF
;
MessageId=0x1580
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_IBMCM_STARTED_OK
Language=English
The Content Manager Interface Service has started successfully on port number %1!d!.
.
MessageId=0x1581
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IBMCM_FAIL_TO_START
Language=English
The Content Manager Interface Service has failed to start (code %1!d!).
.
MessageId=0x1582
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_IBMCM_STOPPED_OK
Language=English
The Content Manager Interface Service has stopped.
.
MessageId=0x1583
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IBMCM_EXCEPTION
Language=English
Content Manager connection %1!d! received an exception: %2
.
MessageId=0x1584
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IBMCM_ERROR
Language=English
Content Manager connection %1!d! encountered an error: %2
.

;
; // Performance Lookup codes 0x1600 - 0x16FF
;
MessageId=0x1600
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PERF_COMPONENT_NOT_REGISTERED
Language=English
The requested performance component either does not exist or has not been registered.
.
;
; // Distributor / Distributor Agent integration status codes 0x1700 - 0x17FF
; // These messages are equivalent to 0x1800 - 0x18FF See NOETWELL below.
;

; // NOTEWELL: The messages below SHOULD NOT contain variables. They are returned to
; // Customer programs, who do not have access to the variables. If you wish to include
; // variables for logging, duplicate the message below (0x1800 series).
; // 

MessageId=0x1700
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_NO_FIRMID_MAPPING
Language=English
No hostname mapping for Firm ID.
.
MessageId=0x1701
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_INVALID_MESSAGE_SIZE
Language=English
The length of a received message is not a multiple of 4 bytes long.
.
MessageId=0x1702
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_INVALID_SCHEMA
Language=English
Message schema was not recognized.
.
MessageId=0x1703
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_INVALID_MESSAGE_SIZE_TOO_SMALL
Language=English
The length of a received message is smaller than the smallest possible message.
.
MessageId=0x1704
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_MESSAGE_SIZE_MISMATCH
Language=English
The length of the received message buffer does not match the message length in the header.
.
MessageId=0x1705
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_MESSAGE_FILTERED
Language=English
Message has been filtered out by Firm ID. 
.
MessageId=0x1706
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_INVALID_MESSAGE_TYPE
Language=English
Message type was not a Mail Process Request.
.
MessageId=0x1707
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_INVALID_MESSAGE_FOOTER
Language=English
Message footer was invalid.
.
MessageId=0x1708
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_NO_MESSAGE_BODY
Language=English
Mail Process Request message was empty.
.
MessageId=0x1709
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_ASN_DECODE_FAILED
Language=English
Failed to decode the ASN.1 content of message.
.
MessageId=0x170a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_NO_MAIL_REQUEST
Language=English
Could not get a Mail Request from the ASN.1 content of message.
.
MessageId=0x170b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_INVALID_TIMESTAMP_UTC
Language=English
Mail Request timestamp is invalid. Timestamp must be in UTC.
.
MessageId=0x170c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_INVALID_ACTION_RESULT
Language=English
Action Result is invalid.
.
MessageId=0x170d
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_INCOMPLETE_CLIENT_ACTION
Language=English
The Policy Engine returned an incomplete client action.
.
MessageId=0x170f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_INVALID_FIRM_ID_FILE_TYPE
Language=English
The file type specifier in the Distributor Firm ID mapping file is invalid.
.
MessageId=0x1710
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FIRM_ID_FILE_MISSING_SCHEMA
Language=English
The supplied Distributor Firm ID mapping file does not contain a schema version.
.
MessageId=0x1711
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FIRM_ID_FILE_INVALID_SCHEMA
Language=English
The supplied Firm ID mapping file contains an invalid schema version.
.
MessageId=0x1712
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FIRM_ID_FILE_UNKNOWN_HEADER_DATA
Language=English
The supplied Distributor Firm ID mapping file contains unrecognized data in the header.
.
MessageId=0x1713
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FIRM_ID_FILE_NO_HEADER
Language=English
The supplied Firm ID mapping file does not contain any header information.
.
MessageId=0x1714
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FIRM_ID_FILE_MALFORMED_ENTRY
Language=English
The supplied Distributor Firm ID mapping file contains a malformed entry.
.
MessageId=0x1715
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_COULD_NOT_FIND_SOCKET
Language=English
An existing socket connection could not be found to the required destination.
.
MessageId=0x1716
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FAILED_TO_LOAD_WINSOCK
Language=English
WinSock could not be loaded.
.
MessageId=0x1717
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FAILED_WINSOCK_VERSION
Language=English
The required version of WinSock could not be loaded.  At least version 2.2 is required.
.
MessageId=0x1718
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FAIL_CREATE_LISTENING_SKT
Language=English
A listening socket could not be created.
.
MessageId=0x1719
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FAIL_BIND_LISTENING_SKT
Language=English
A listening socket could not be bound to on port.
.
MessageId=0x171A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FAIL_SET_LISTENING_BACKLOG
Language=English
Failed to set the backlog on a listening socket.
.
MessageId=0x171B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FAIL_CREATE_ACCEPT_THREAD
Language=English
Failed to start the listening socket accept thread.
.
MessageId=0x171C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_HOSTNAME_UNRESOLVABLE
Language=English
Failed to resolve hostname to an IP address.
.
MessageId=0x171d
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_ASN_ENCODE_FAILED
Language=English
Failed to encode the ASN.1 content of a message.
.
MessageId=0x171e
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DAGENT_LOOPBACK
Language=English
The Distributor Agent is configured to loop all messages back without processing.
.
MessageId=0x171f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DAGENT_EXCEPTION_OUTER_FORWARD
Language=English
An exception was caught while receiving and processing a message.
.
MessageId=0x1720
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DAGENT_EXCEPTION_PROCESS_MESSAGE
Language=English
An exception was caught while processing a message.
.
MessageId=0x1721
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DAGENT_EXCEPTION_PROCESSING_INTERVENTION
Language=English
An exception was caught while processing the Intervention Actions. 
.
MessageId=0x1722
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DIST_INVALID_CTRL_COMMAND
Language=English
An invalid distributor control command number was received.
.
MessageId=0x1723
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DIST_BAD_FIRM_ID_FILE_COMMAND
Language=English
An invalid Firm ID filename was received in a distributor control command.
.
MessageId=0x172B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FAILED_FIRM_ID_REG_KEY
Language=English
The Distributor has failed to read the Firm ID map filename from the registry.
.
MessageId=0x172C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DAGENT_INVALID_CTRL_COMMAND
Language=English
An invalid control command number was received.
.
MessageId=0x172D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DAGENT_BAD_FIRM_ID_FILE_COMMAND
Language=English
An invalid Firm ID filename was received in a distributor agent control command.
.
MessageId=0x1731
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_AGENT_INVALID_FIRM_ID_FILE_TYPE
Language=English
The file type specifier in the Firm ID file is invalid.
.
MessageId=0x1733
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_AGENT_FIRM_ID_FILE_INVALID_SCHEMA
Language=English
The supplied Firm ID file contains an invalid schema version.
.
MessageId=0x1734
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_AGENT_FIRM_ID_FILE_UNKNOWN_HEADER_DATA
Language=English
The supplied Firm ID file contains unrecognized data in the header.
.
MessageId=0x1735
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_AGENT_FIRM_ID_FILE_NO_HEADER
Language=English
The supplied Distributor Agent Firm ID file does not contain any header information.
.
MessageId=0x1736
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_AGENT_FIRM_ID_FILE_MALFORMED_ENTRY
Language=English
The supplied Firm ID file contains a malformed entry.
.
MessageId=0x1738
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_AGENT_FIRM_ID_MAP_LOAD_FAIL
Language=English
The Distributor Agent has failed to load the Firm ID file.
.
MessageId=0x1739
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_AGENT_FIRM_ID_DISALLOWED
Language=English
The Distributor Agent is not configured to process Firm ID.
.
MessageId=0x173A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_AGENT_DUPLICATE_FIRM_ID
Language=English
The Distributor Agent Firm ID file contains duplicate entries for Firm ID.
.
MessageId=0x173C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_COULD_NOT_CONNECT_SOCKET
Language=English
A connection could not be made to the destination machine.
.
MessageId=0x173D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_COULD_NOT_SEND_ON_SOCKET
Language=English
Data could not be send to port so the connection will be closed.
.
MessageId=0x173E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_COULD_NOT_CREATE_OUT_SOCKET
Language=English
An outgoing socket connection could not be created.
.
MessageId=0x1740
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DAGENT_FAILED_MAIL_RESPONSE
Language=English
Failed to obtain the actions for email.
.
MessageId=0x1741
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_ASN_DECODE_EXCEPTION
Language=English
An exception was caught while decoding ASN.1 content of message.
.
MessageId=0x1743
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DAGENT_NO_SENDER_ADDRESS
Language=English
Received email has no sender address.
.
MessageId=0x1745
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DAGENT_ERROR_BUILDING_BODY
Language=English
Failed to populate email body from message.
.
MessageId=0x1746
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DAGENT_NO_ATTACH_URL
Language=English
Received email has an attachment with no URL.
.
MessageId=0x1749
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DAGENT_FAILED_TO_PASS_MESSAGE_TO_HUB
Language=English
Failed to pass email to the Policy Engine Hub.
.
MessageId=0x174B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_HOSTNAME_NONE_RESOLVABLE
Language=English
None of the hubs assigned to the Firm ID can be resolved to an IP address.
.
MessageId=0x174F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DISTRIB_NO_ADDRESSABLE_HUBS
Language=English
There are no contactable hubs for the Firm ID code in the message.
.
MessageId=0x1752
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DAGENT_SENDER_FIRMID_MISMATCH
Language=English
The sender Firm ID in the message is not the same as the one in the header.
.
MessageId=0x1753
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DAGENT_MISSING_EXPECT_REPLY_FLAG
Language=English
The ExpectReply flag in the message header was not set.
.
MessageId=0x1755
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_DAGENT_INVALID_EMAIL_TYPE
Language=English
Primary Data message type is invalid.
.
MessageId=0x1756
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FIRM_ID_UNEXPECTED_DATA
Language=English
Firm ID file - unexpected data at end of line.
.
MessageId=0x1757
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_ASN_ENCODE_EXCEPTION
Language=English
Exception encoding the ASN.1 content of a message.
.
MessageId=0x1758
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_SMTP_INIT_EXCEPTION
Language=English
An exception occurred while SMTP Utilities was being initialized.
.
MessageId=0x1759
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FAIL_CREATE_CLEAN_THREAD
Language=English
Failed to start the socket clean up thread.
.
MessageId=0x176B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LINE_ESCAPE_END
Language=English
A Firm ID file parameter cannot end with an unmatched escape character
.
MessageId=0x1786
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_NO_PRIMARY_HUBS_DEFINED
Language=English
Firm ID has no primary hubs defined.
.
MessageId=0x1788
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FAILED_HUB_LIMIT_EXCEEDED
Language=English
The maximum number of failed hubs has been exceeded for firm id.
.
MessageId=0x1789
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_HOST_ADDRESS_TYPE_NOT_INET
Language=English
The host address is not an Internet address. Other address types are not supported.
.
MessageId=0x1790
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_HOST_ADDRESS_LENGTH_NOT_I4
Language=English
The host address is a not TCP/IP Version 4 address. Other address versions are not supported.
.
MessageId=0x1791
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_SCHEMA_PACKET_CONTENT_MISMATCH
Language=English
The received packet contains data that is not supported by the schema version specified in the packet.
.
MessageId=0x1798
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_SECURITY_ATTR_ERROR
Language=English
An error was encountered setting the Security Attribute.
.

; // NOTEWELL: The messages above SHOULD NOT contain variables. They are returned to
; // Customer programs, who do not have access to the variables. If you wish to include
; // variables for logging, duplicate the message below (0x1800 series).
; // 

;
; // Distributor / Distributor Agent integration log codes 0x1800 - 0x18FF
; // These messages are equivalent to 0x1700 - 0x17FF See NOTEWELL above.
;
MessageId=0x1800
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_NO_FIRMID_MAPPING
Language=English
No hostname mapping for Firm ID %1.
.
MessageId=0x1801
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_MESSAGE_SIZE
Language=English
The length of a received message is not a multiple of 4 bytes long. Message number %1!lu! from Sender Firm ID %2!d!.
.
MessageId=0x1809
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_ASN_DECODE_FAILED
Language=English
Failed to decode the ASN.1 content of message. Message number %1!lu! from Sender Firm ID %2!d!, OSS error code %3!d! (%4!hs!).
.
MessageId=0x180a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_NO_MAIL_REQUEST
Language=English
Could not get a Mail Request from the ASN.1 content of message. Message number %1!lu! from Sender Firm ID %2!lu!.
.
MessageId=0x180b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_INVALID_TIMESTAMP_UTC
Language=English
Mail Request timestamp was invalid. Timestamp must be in UTC. Message ID is %1!ls!, message number %2!lu! from Sender Firm ID %3!lu!.
.
MessageId=0x180c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_ACTION_RESULT
Language=English
Action Result (%1!lu!) is invalid. Message number %2!lu! from Sender Firm ID %3!lu!.
.
MessageId=0x180d
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_INCOMPLETE_CLIENT_ACTION
Language=English
The Policy Engine returned an incomplete client action. No %3!ls! found. Message number %1!lu! from Sender Firm ID %2!lu!.
.
MessageId=0x180e
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_EVENT_ABANDONED
Language=English
The Distributor Agent was shut down before the email could be processed. Message ID '%1!ls!', message number %2!lu! from Sender Firm ID %3!lu!.
.
MessageId=0x180f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FIRM_ID_FILE_TYPE
Language=English
The file type specifier (%1) in the Firm ID (%2) mapping file is invalid.
.
MessageId=0x1810
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FIRM_ID_FILE_MISSING_SCHEMA
Language=English
The supplied Firm ID mapping file does not contain a schema version (%1).
.
MessageId=0x1812
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FIRM_ID_FILE_UNKNOWN_HEADER_DATA
Language=English
The supplied Firm ID mapping file contains unrecognized data in the header (%1).
.
MessageId=0x1814
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FIRM_ID_FILE_MALFORMED_ENTRY
Language=English
The supplied Firm ID mapping file contains a malformed entry (%1).
.
MessageId=0x1816
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FAILED_TO_LOAD_WINSOCK
Language=English
WinSock could not be loaded - %1.
.
MessageId=0x1817
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FAILED_WINSOCK_VERSION
Language=English
The required version of WinSock could not be loaded.  At least version 2.2 is required but %1!lu!.%2!lu! was found.
.
MessageId=0x1819
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FAIL_BIND_LISTENING_SKT
Language=English
A listening socket could not be bound to on port %1!lu! - %2.
.
MessageId=0x181A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FAIL_SET_LISTENING_BACKLOG
Language=English
Failed to set the backlog on a listening socket - %1.
.
MessageId=0x181C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_HOSTNAME_UNRESOLVABLE
Language=English
Failed to resolve hostname %1!hs! Firm ID %2!lu! to an IP address.
.
MessageId=0x181d
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_ASN_ENCODE_FAILED
Language=English
Failed to encode the ASN.1 content of a message. Message number %1!lu!, from Sender Firm ID %2!lu!. OSS error code %3!lu! (%4!hs!).
.
MessageId=0x1821
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DAGENT_EXCEPTION_PROCESSING_INTERVENTION
Language=English
An exception was caught while processing the Intervention Actions for message with ID '%1!ls!', message number %2!lu!, from Sender Firm ID %3!lu!. 
.
MessageId=0x1824
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_DAGENT_STARTUP
Language=English
Distributor Agent starting up. Listening on port %1!lu!.
.
MessageId=0x1825
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_DAGENT_SHUTDOWN
Language=English
Distributor Agent shutting down.
.
MessageId=0x1826
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_DIST_STARTING
Language=English
The Distributor is starting up.  Sending to Distributor Agent on port %1!lu! using %2!lu! worker threads.  Log level is %3!lu!.
.
MessageId=0x1827
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_DIST_STARTED
Language=English
The Distributor has successfully started.  Listening for messages on port %1!lu!.
.
MessageId=0x1828
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_DIST_SHUTDOWN
Language=English
The Distributor has shut down.
.
MessageId=0x1829
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_DIST_FIRM_ID_MAP_LOADED
Language=English
Successfully loaded %1!lu! entries from the Firm ID map file '%2'.
.
MessageId=0x182A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DIST_FIRM_ID_MAP_LOAD_FAIL
Language=English
Failed to load the Firm ID map file '%1' with error '%2'.
.
MessageId=0x182B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FAILED_FIRM_ID_REG_KEY
Language=English
Failed to read the Firm ID map filename from the registry, error code '%1'.
.
MessageId=0x182C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_INVALID_CTRL_COMMAND
Language=English
An invalid control command number (%1!lu!) was received.
.
MessageId=0x182E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FAILED_CREATE_REG_KEY
Language=English
Failed to create the registry key '%1', error code '%2'.
.
MessageId=0x182F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FAILED_SET_REG_VALUE
Language=English
Failed to set the registry key '%1', value '%2', error code '%3'.
.
MessageId=0x1830
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FAILED_FIRMS_FILE_REG_KEY
Language=English
The Distributor Agent has failed to read the Firm ID filename from the registry, error code '%1'.
.
MessageId=0x1833
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FIRM_ID_FILE_INVALID_SCHEMA
Language=English
The supplied Firm ID file contains an invalid schema version (%1!lu!).
.
MessageId=0x1837
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_AGENT_FIRM_ID_MAP_LOADED
Language=English
Successfully loaded %1!lu! entries from the Firm ID file '%2'.
.
MessageId=0x1838
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_AGENT_FIRM_ID_MAP_LOAD_FAIL
Language=English
Failed to load the Firm ID file '%1' with error '0x%2!08x!'.
.
MessageId=0x1839
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_AGENT_FIRM_ID_DISALLOWED
Language=English
The Distributor Agent is not configured to process Firm ID %1!lu!.
.
MessageId=0x183A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_AGENT_DUPLICATE_FIRM_ID
Language=English
The Distributor Agent Firm ID file contains duplicate entries for Firm ID %1!lu!.
.
MessageId=0x183D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_COULD_NOT_SEND_ON_SOCKET
Language=English
Data could not be send to %1!lu!.%2!lu!.%3!lu!.%4!lu! port %5!lu! so the connection will be closed - %6.
.
MessageId=0x183E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_COULD_NOT_CREATE_OUT_SOCKET_DEPRECATED_
Language=English
**** Obsolete. **** An outgoing socket connection to %1 could not be created with error %2.
.
MessageId=0x183F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DAGENT_REPLY_SEND_FAILED
Language=English
Failed to send response for email with message ID '%1!ls!' to Distributor, error %2.
.
MessageId=0x1840
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DAGENT_FAILED_MAIL_RESPONSE
Language=English
Failed to obtain the actions for email with message ID '%1!ls!', error %2.
.
MessageId=0x1841
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_ASN_DECODE_EXCEPTION
Language=English
An exception was caught while decoding ASN.1 content of message. Message number %1!lu! from Sender Firm ID %2!lu!.
.
MessageId=0x1842
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DAGENT_CREATE_EVENT_FAILED
Language=English
Failed to create a new email event. Message number %1!lu!, from Sender Firm ID %2!lu!. Error %3.
.
MessageId=0x1843
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DAGENT_NO_SENDER_ADDRESS
Language=English
Received email has no sender address. Message ID is '%1!ls!'.
.
MessageId=0x1844
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DAGENT_ERROR_BUILDING_ENVELOPE
Language=English
Failed to populate email envelope from message with ID '%1!ls!', message number %2!lu!, from Sender Firm ID %3!lu!. Error %4.
.
MessageId=0x1845
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DAGENT_ERROR_BUILDING_BODY
Language=English
Failed to populate email body from message with ID '%1!ls!', message number %2!lu!, from Sender Firm ID %3!lu!. Error %4.
.
MessageId=0x1846
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DAGENT_NO_ATTACH_URL
Language=English
Received email has an attachment with no URL. Message ID '%1!ls!', message number %2!lu!, from Sender Firm ID %3!lu!.
.
MessageId=0x1847
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DAGENT_ERROR_BUILDING_ATTACHMENT
Language=English
Failed to populate email attachment with URL '%1!ls!' from message with ID '%2!ls!', message number %3!lu!, from Sender Firm ID %4!lu!. Error %5.
.
MessageId=0x1848
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DAGENT_ERROR_BUILDING_RESPONSE
Language=English
Failed to construct Intervention Response from message with ID '%1!ls!', message number %2!lu!, from Sender Firm ID %3!lu!. Error %4.
.
MessageId=0x1849
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DAGENT_FAILED_TO_PASS_MESSAGE_TO_HUB
Language=English
Failed to pass email to the Policy Engine Hub. Message ID '%1!ls!', message number %2!lu!, from Sender Firm ID %3!lu!. Error %4.
.
MessageId=0x184A
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_BB_LOG_FAILED_TO_CONNECT
Language=English
Cannot connect socket to %1!lu!.%2!lu!.%3!lu!.%4!lu! port %5!lu! - %6.
.
MessageId=0x184B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_HOSTNAME_NONE_RESOLVABLE
Language=English
None of the hubs assigned to Firm ID %1!lu! can be resolved to an IP address.
.
MessageId=0x184C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_CLOSING_CONNECTION
Language=English
Closing socket connection to %1!lu!.%2!lu!.%3!lu!.%4!lu! port %5!lu!.
.
MessageId=0x184D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_CREATING_OUTGOING_CONNECTION
Language=English
Creating outgoing connection to %1!lu!.%2!lu!.%3!lu!.%4!lu! port %5!lu!.
.
MessageId=0x184E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_CREATING_INCOMING_CONNECTION
Language=English
Creating incoming connection on port %4!u! from %1!hs! port %2!u! socket %3!u!.
.
MessageId=0x184F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DISTRIB_NO_ADDRESSABLE_HUBS
Language=English
There are no contactable hubs for the message Firm ID code %1!lu!.
.
MessageId=0x1851
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_START_LOG_SESSION
Language=English
--------------------------------------------------
.
MessageId=0x1852
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DAGENT_SENDER_FIRMID_MISMATCH
Language=English
The sender Firm ID in the header (%1!lu!) is different to the one in the message (%2!lu!). Message number was %3!lu!.
.
MessageId=0x1853
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DAGENT_MISSING_EXPECT_REPLY_FLAG
Language=English
The ExpectReply flag in the message header was not set.  Message ID '%1!ls!', message number %2!lu!.
.
MessageId=0x1855
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DAGENT_INVALID_EMAIL_TYPE
Language=English
Primary Data message type (%1!x!) is invalid - message number %2!lu! from Sender Firm ID %3!lu!.
.
MessageId=0x1856
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FIRM_ID_UNEXPECTED_DATA
Language=English
Firm ID file - unexpected data at end of line.
.
MessageId=0x1857
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_ASN_ENCODE_EXCEPTION
Language=English
Exception encoding the ASN.1 content of a message. Message number %1!lu! from Sender Firm ID %2!lu!.
.
MessageId=0x1858
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_BB_LOG_ACTION_IGNORED
Language=English
Mail action %3 ignored.  Message number %1!lu! from Sender Firm ID %2!lu!.
.
MessageId=0x1859
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_BB_LOG_ACTION_UNKNOWN
Language=English
Mail action %3 unknown.  Message number %1!lu! from Sender Firm ID %2!lu!.
.
MessageId=0x185A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_ALLOC_FIRMID_PARM
Language=English
Error allocating memory for Firm ID parameter (%1).
.
MessageId=0x185B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_CONNECT_HUB
Language=English
Error connecting Hub (%1).
.
MessageId=0x185C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_INITIALIZE_RECEIVER
Language=English
Error initializing receiver (%1).
.
MessageId=0x185D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_OPEN_REGISTRY
Language=English
Error opening registry %1 (%2).
.
MessageId=0x185E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_CREATE_PHUB
Language=English
Error creating Policy Engine Hub (%1).
.
MessageId=0x185F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_REGISTER_PHUB
Language=English
Error registering Policy Engine Hub (%1).
.
MessageId=0x1860
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_ASN_FREE_EXCEPTION
Language=English
Exception freeing ASN.1 data.
.
MessageId=0x1861
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_SET_ATTRIBUTE
Language=English
Error setting Mail Attribute %1 (%2).
.
MessageId=0x1862
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_SET_PROPERTY
Language=English
Error setting Mail Attribute %1 (%2).
.
MessageId=0x1863
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_LOAD_EMAIL_STORE
Language=English
Error loading email store (%1).
.
MessageId=0x1864
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_GET_ATTRIBUTES
Language=English
Error getting attributes (%1).
.
MessageId=0x1865
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_NO_POLICY_NODE
Language=English
Policy node not found (%1). Message number %1!lu! from Sender Firm ID %2!lu!.
.
MessageId=0x1866
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_EVENT_BODY
Language=English
Message number %1!lu! from Sender Firm ID %2!lu!, %3.
.
MessageId=0x1867
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_ALLOC_FIRMID
Language=English
Error allocating memory for Firm ID (%1).
.
MessageId=0x1868
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_READ_FIRMID_FILE
Language=English
Unable to read Firm ID mapping file '%1': %2
.
MessageId=0x1869
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FIRM_ID_ERROR_DEPRECATED_
Language=English
**** Obsolete. **** Error in Firm ID file - firm %1!lu!
.
MessageId=0x186A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DAGENT_FINAL_RELEASE
Language=English
SMTP processing termination error, hr = %1
.
MessageId=0x186B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_LINE_ESCAPE_END
Language=English
A Firm ID file parameter cannot end with an unmatched escape character (firm %1!lu!) - Line: %2
.
MessageId=0x186C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FAIL_ALLOC_MSG_SKT
Language=English
Failed to allocate an internal data structure to manage an incoming connection.
.
MessageId=0x186D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_ASYNC_RECV_ERROR
Language=English
Failed to start reading a message header from %1!lu!.%2!lu!.%3!lu!.%4!lu! port %5!lu! - %6.
.
MessageId=0x186E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FAIL_RCV_HEADER
Language=English
Failed to complete reading a message header from %1!lu!.%2!lu!.%3!lu!.%4!lu! port %5!lu! - %6.
.
MessageId=0x186F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FAIL_ALLOC_MSG_BLK
Language=English
Failed to allocate an internal data structure to manage an incoming message.
.
MessageId=0x1870
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_SKT_CLOSED_NO_HDR
Language=English
Failed to read a message header because the socket from %1!lu!.%2!lu!.%3!lu!.%4!lu! port %5!lu! closed.
.
MessageId=0x1871
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_SKT_CLOSED_NO_HDR_ERR
Language=English
Failed to read a message header because the socket from %1!lu!.%2!lu!.%3!lu!.%4!lu! port %5!lu! closed - %6.
.
MessageId=0x1872
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_BAD_MSG_HDR_SCHEMA
Language=English
Invalid schema version 0x%1!lx! received - closing socket %2!lu!.%3!lu!.%4!lu!.%5!lu! port %6!lu!.
.
MessageId=0x1873
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_BAD_MSG_HDR_SIZE
Language=English
Invalid message size in header: %1!lu! - closing socket %2!lu!.%3!lu!.%4!lu!.%5!lu! port %6!lu!.
.
MessageId=0x1874
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_NO_MESSAGE_MEM
Language=English
Failed to allocate %1!lu! bytes for message - closing socket %2!lu!.%3!lu!.%4!lu!.%5!lu! port %6!lu!.
.
MessageId=0x1875
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_SKT_CLOSED_NO_MSG
Language=English
Failed to read a message because the socket from %1!lu!.%2!lu!.%3!lu!.%4!lu! port %5!lu! closed.
.
MessageId=0x1876
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_SKT_CLOSED_NO_MSG_ERR
Language=English
Failed to read a message because the socket from %1!lu!.%2!lu!.%3!lu!.%4!lu! port %5!lu! closed - %6.
.
MessageId=0x1880
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_STANDBY_INSERTED_UNRESOLVED
Language=English
Inserted standby hostname %1!hs! Firm ID %2!lu!. Host name unresolved.
.
MessageId=0x1881
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_STANDBY_INSERTED_UNREACHABLE
Language=English
Inserted standby hostname %1!hs! Firm ID %2!lu!. Unreachable host.
.
MessageId=0x1882
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_STANDBY_REMOVED_REINSTATED
Language=English
Removing standby hostname %1!hs! Firm ID %2!lu! to an IP address after primary reinstated.
.
MessageId=0x1883
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_STANDBY_REMOVED_ENOUGH
Language=English
Removing standby hostname %1!hs! Firm ID %2!lu! to an IP address. Active hub count exceeded.
.
MessageId=0x1884
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_STANDBY_NONE
Language=English
No standbys available for Firm ID %1!lu!.
.
MessageId=0x1885
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_BB_LOG_HUB_UNREACHABLE
Language=English
Removing hub hostname %1!hs! Firm ID %2!lu! after IP Error.
.
MessageId=0x1886
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_NO_PRIMARY_HUBS_DEFINED
Language=English
Firm ID %1!lu! has no primary hubs defined.
.
MessageId=0x1887
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_SHUTDOWN_ERROR
Language=English
Error shutting down %1!lu!.%2!lu!.%3!lu!.%4!lu! port %5!lu! - %6.
.
MessageId=0x1888
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FAILED_HUB_LIMIT_EXCEEDED
Language=English
The maximum number of failed hubs (%1!lu!) has been exceeded for Firm ID %2!lu!.
.
MessageId=0x1889
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_HOST_ADDRESS_TYPE_NOT_INET
Language=English
The host address ( %1!hs!) for Firm ID %2!lu! is not an Internet address. Other address types (type %3!lu!) are not supported.
.
MessageId=0x1890
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_HOST_ADDRESS_LENGTH_NOT_I4
Language=English
The host address ( %1!hs!) for Firm ID %2!lu! is not a TCP/IP Version 4 address. Other address versions are not supported (address length %3!lu!).
.
MessageId=0x1891
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_INVALID_SCHEMA
Language=English
The schema version 0x%1!lx! is not supported. Message number %2!lu!.
.
MessageId=0x1892
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_INVALID_MESSAGE_TYPE
Language=English
The schema version 0x%1!lx! does not support message type 0x%2!lx!. Message number %3!lu!.
.
MessageId=0x1893
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_INVALID_PRIORITY_FIELD
Language=English
The schema version 0x%1!lx! does not support Priority value 0x%2!lx!. Message number %3!lu!.
.
MessageId=0x1894
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_INVALID_RESERVED3_FIELD
Language=English
The schema version 0x%1!lx! does not support Reserved3 value 0x%2!lx!. Message number %3!lu!.
.
MessageId=0x1895
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_INVALID_FLAGS1_FIELD
Language=English
The schema version 0x%1!lx! does not support Flags1 value 0x%2!lx!. Message number %3!lu!.
.
MessageId=0x1896
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_INVALID_FLAGS2_FIELD
Language=English
The schema version 0x%1!lx! does not support Flags2 value 0x%2!lx!. Message number %3!lu!.
.
MessageId=0x1897
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_INVALID_FLAGS3_FIELD
Language=English
The schema version 0x%1!lx! does not support Flags3 value 0x%2!lx!. Message number %3!lu!.
.
MessageId=0x1898
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_SECURITY_ATTR_ERROR
Language=English
An error was encountered setting the Security Attribute. Message number %1!lu! from Sender Firm ID %2!lu! - %3.
.

;
; // Web Console status codes 0x1900 - 0x19FF
;
MessageId=0x1900
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_INVALID_SERVER
Language=English
The specified CMS '%1' is not a valid CMS server.
.
MessageId=0x1901
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_INVALID_SESSION
Language=English
The IIS Session is invalid.
.
MessageId=0x1902
;// iConsole PageTracker.cs references this messageid - do not change
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_INVALID_SEARCH_ID
Language=English
The search id '%1' is invalid.
.
MessageId=0x1903
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_INVALID_SEARCH_DEFINITION_FILE
Language=English
The search definition file failed validation for the following reasons:%t
%1%t
No search definitions have been installed.
.
MessageId=0x1904
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SEARCH_DEFINITION_FILE_INSTALLED
Language=English
The search definition file was successfully loaded.%t
%1
.
MessageId=0x1905
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_DEFINITION_INSTALL_INCOMPLETE
Language=English
Installation of search definitions was incomplete because some of the search definitions failed to install.%t
%1%t
%2
.
MessageId=0x1906
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SEARCH_DEFINITION_PUBLISHED
Language=English
%1!d! search definitions were successfully published:%t
%2
.
MessageId=0x1907
;// iConsole PageTracker.cs references this messageid - do not change
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_DEFINITION_ALREADY_PUBLISHED
Language=English
%1!d! search definitions were successfully published:%t
%2%t
%3!d! search definitions failed to be published:%t
%4
.
MessageId=0x1908
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SEARCH_DEFINITION_UNPUBLISHED
Language=English
%1!d! search definitions were successfully unpublished:%t
%2
.
MessageId=0x1909
;// iConsole PageTracker.cs references this messageid - do not change
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_DEFINITION_ALREADY_UNPUBLISHED
Language=English
%1!d! search definitions were successfully unpublished:%t
%2%t
%3!d! search definitions failed to be unpublished:%t
%4
.
MessageId=0x190A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SEARCH_DEFINITION_UNINSTALLED
Language=English
%1!d! search definitions were successfully uninstalled:%t
%2
.
MessageId=0x190B
;// iConsole PageTracker.cs references this messageid - do not change
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_DEFINITION_REFERENCED
Language=English
The search is referenced by one or more customized searches.
.
MessageId=0x190C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SEARCH_DEFINITION_UPDATED
Language=English
The details for search definition %1 were successfully updated.
.
MessageId=0x190D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_CUSTOM_SEARCH_DEFINITION_SAVED
Language=English
The customized search definition '%1' was successfully saved.
.
MessageId=0x190E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_CUSTOM_SEARCH_DEFINITION_NOT_SAVED
Language=English
The customized search definition '%1' was not saved because it already exists.
.
MessageId=0x190F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_CUSTOM_SEARCH_DEFINITION_DELETED
Language=English
%1!d! customized search definitions were successfully deleted:%t
%2
.
MessageId=0x1910
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_CUSTOM_SEARCH_DEFINITION_NOT_DELETED
Language=English
Deletion of customized searches was not completed.%n
%1!d! customized search definitions were successfully deleted:%t
%2%t
%3!d! customized search definitions failed to be deleted because they do not exist:%t
%4
.
MessageId=0x1911
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_RUN_SEARCH_OK
Language=English
The query executed successfully.
.
MessageId=0x1912
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_RUN_QUERY_SEARCH_NOT_FOUND
Language=English
The '%1' search definition for query '%2' could not be retrieved: %3. This could be because the baseline search has been moved or deleted.
.
MessageId=0x1913
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_RUN_QUERY_FAILED
Language=English
The query with ID=%1 failed to run successfully:%t
%2.
.
MessageId=0x1914
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_QUERY_RESULTS_NOT_CACHED
Language=English
The requested query results with ID=%1 were not in the cache. This could be because the search failed or because you have not accessed the results for some time. Re-run the query.
.
MessageId=0x1915
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_INVALID_REQUEST_XML
Language=English
The XML request submitted for '%1' was invalid.
.
MessageId=0x1916
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_ARG_POS_INVALID
Language=English
The argument position(argpos="%1!d!") specified for parameter '%2' is invalid.
The position must be between 1 and %3!d!.
.
MessageId=0x1917
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_ARG_REPEATED
Language=English
The argument position for parameter '%1' was specified as '%2!d!' but parameter '%3' has already been specified in this position.
.
MessageId=0x1918
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SEARCH_DEF_INSTALL_SUCCESS
Language=English
%1!d! search definitions were successfully installed: %2
.
MessageId=0x1919
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_DEF_INSTALL_FAILURE
Language=English
%1!d! search definitions failed to install correctly: %2
.
MessageId=0x191A
;// iConsole PageTracker.cs references this messageid - do not change
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_DEF_ALREADY_INSTALLED
Language=English
The search definition was already installed.
.
MessageId=0x191B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_NO_CONTENT_SEARCH_CAPABILITY
Language=English
There is no content search capability currently available.
.
MessageId=0x191C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_UNSUPPORTED_SEARCH_DATABASE
Language=English
The search database type '%1' is not supported.
.
MessageId=0x191D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_PASSWORD_EXPIRED
Language=English
Password has expired
.
MessageId=0x191E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_INSUFFICIENT_PRIVILEGE
Language=English
You do not have the privileges needed to access the requested iConsole function.
.
MessageId=0x191F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SEARCH_CANCELLED
Language=English
The search with ID=%1 was canceled by the user.
.
MessageId=0x1920
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SOFTWARE_VERSION_UNOBTAINABLE
Language=English
The current software version was unobtainable
.
MessageId=0x1921
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SOFTWARE_VERSION_INCOMPATIBLE
Language=English
This version of the software (%1) is not compatible with the version 
running on the machine '%2' (%3)
.
MessageId=0x1922
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_BAD_POINTER
Language=English
Bad Pointer
.
MessageId=0x1923
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_NO_HTTP_CONTEXT
Language=English
Failed to get the http context
.
MessageId=0x1924
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_NO_HTTP_CONTEXT_CACHE
Language=English
Failed to get the cache from the http context
.
MessageId=0x1925
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_INFRASTRUCTURE_UNAVAILABLE
Language=English
The Infrastructure is currently unavailable
.
MessageId=0x1926
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_DEFINITION_FILE_NOT_XML
Language=English
The supplied search definition file was not an XML document (did not start with '<?xml')
.
MessageId=0x1927
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_CANNOT_DELETE_OWN_USER
Language=English
It is not permitted to delete the currently logged in user from the system.
.
MessageId=0x1928
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_CANNOT_DELETE_OWN_USERGROUP
Language=English
It is not permitted to delete the group or parent group of the currently logged in user from the system.
.
MessageId=0x1929
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_CANNOT_DELETE_DEFAULT_USERGROUP
Language=English
It is not permitted to delete the default group from the system.
.
MessageId=0x192a
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_CANNOT_MOVE_OWN_USER
Language=English
It is not permitted to move the currently logged in user.
.
MessageId=0x192b
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_CANNOT_MOVE_OWN_USERGROUP
Language=English
It is not permitted to move the parent group of the currently logged in user.
.
MessageId=0x192c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_CONTENT_SEARCH_TIMED_OUT
Language=English
The content database stopped responding while waiting for search results to be returned.
.
MessageId=0x192d
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_USER_LOGON
Language=English
User '%1' logged in to CMS Server '%2' (session id %3)
.
MessageId=0x192e
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_WC_USER_LOGON_FAILED
Language=English
User '%1' failed to log in to CMS Server '%2' (Reason: %3)
.
MessageId=0x192f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_PASSWORD_EXPIRED_UNOBTAINABLE
Language=English
Unable to determine if password for user '%1' on CMS Server '%2' has expired
.
MessageId=0x1930
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_PASSWORD_HAS_EXPIRED
Language=English
Password for user '%1' on CMS Server '%2' has expired
.
MessageId=0x1931
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_USER_LOGOFF
Language=English
Session (%1) logged out
.
MessageId=0x1932
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_AUDIT_EMAIL_SENT
Language=English
Session (%1) audit email sent (details - %2)
.
MessageId=0x1933
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_AUDIT_EMAIL_SEND_FAILED
Language=English
Session (%1) audit email send failed, message (%2)
.
MessageId=0x1934
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_PAGE_LOAD_FAILURE
Language=English
Session (%1) has been terminated due to a page load failure
.
MessageId=0x1935
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SESSION_ADDED
Language=English
Session (%1) has been added to the front-end session map (IIS Session %2)
.
MessageId=0x1936
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SESSION_UPDATED
Language=English
Session (%1) has been updated by a keep-alive request (IIS Session %2)
.
MessageId=0x1937
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SESSION_REMOVED
Language=English
Session (%1) has been removed from the front-end session map (IIS Session %2)
.
MessageId=0x1938
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_POSSIBLE_SCRIPT_ATTACK_DETECTED
Language=English
Possible script attack detected, terminating session %1
.
MessageId=0x1939
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_WEBSERVICE_LOCAL_INFRA_INCOMPATIBLE
Language=English
iConsole webservice (version %1) is not compatible with the local infrastructure (version %2)
.
MessageId=0x193A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_ICONSOLE_CONNECT
Language=English
iConsole front-end server (hostname %1, version %2) has connected to the webservice
.
MessageId=0x193B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_QUERY_PROGRESS_NOT_CACHED
Language=English
There was no progress information cached for search %1
.
MessageId=0x193C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_AUDIT_EMAIL_LDAP_SERVER
Language=English
Session (%1) email address lookup using LDAP Server (%2)
.
MessageId=0x193D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_WEBSERVICE_STARTED
Language=English
** The webservice is starting (Webservice version %1, Local Infrastructure version %2) **
.
MessageId=0x193E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_WEBSERVICE_SHUTDOWN
Language=English
The webservice has been shut down successfully, IIS Status Code (%1)
.
MessageId=0x193f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_MAPI_INIT_FAILED
Language=English
Unable to initialize MAPI. Please ensure a Microsoft Exchange-compatible email application such as Outlook is the default email application on the application server machine.
.
MessageId=0x1940
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FAILED_TO_GET_WIGAN_SESSION
Language=English
The IWgnSession interface pointer was NULL or invalid.
.
MessageId=0x1941
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FAILED_TO_GET_DATASTORE_SERVICES
Language=English
Unable to get datastore services.
.
MessageId=0x1942
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FAILED_TO_GET_DBEVENT_INTERFACE
Language=English
Unable to get IWgnDBEvent interface.
.
MessageId=0x1943
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FAILED_TO_GET_WKS_INTERFACE
Language=English
Unable to get IWgnWellKnownString interface.
.
MessageId=0x1944
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FAILED_TO_GET_CMS_FOR_IIS_SESSION
Language=English
The cached CMS details for this IIS session could not be found.
.
MessageId=0x1945
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FAILED_TO_GET_CACHED_DATA
Language=English
Unable to get cached data for the CMS.
.
MessageId=0x1946
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FAILED_TO_GET_DBEVENTAUDIT_INTERFACE
Language=English
Unable to get IWgnDBEventAudit interface.
.
MessageId=0x1947
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FAILED_TO_GET_DBUSER_INTERFACE
Language=English
Unable to get IWgnDBUser interface.
.
MessageId=0x1948
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FAILED_TO_GET_DBUSERGROUP_INTERFACE
Language=English
Unable to get IWgnDBUserGroup interface.
.
MessageId=0x1949
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FAILED_TO_READ_FROM_STREAM
Language=English
Unsufficient bytes were read from the source stream.
.
MessageId=0x194a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_WKSLIST_COUNT_INVALID
Language=English
Unexpected number of wellknown strings encountered. Please contact your administrator to ensure that this CMS has been configured correctly for auditing.
.
MessageId=0x194b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_WKSLIST_AUDIT_CONFIG_STRING_INVALID
Language=English
The format of the audit configuration string was not recognized.
.
MessageId=0x194c
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SEARCH_STARTED
Language=English
The following search was started, name:%1, spname:%2, major-version:%3, minor-version:%4, type:%5, ID:%6
.
MessageId=0x194d
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_USER_SSO_LOGON_FAILED
Language=English
SSO Login failed for user '%1' CMS Server '%2' (Reason: %3)
.
MessageId=0x194e
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_UNABLE_TO_GET_POLICY_ITEM_LIST
Language=English
The policy item list could not be retrieved.
.
MessageId=0x194f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_UNABLE_TO_GET_POLICY_ITEM_ENUM
Language=English
The policy item enumerated value could not be retrieved.
.
MessageId=0x1950
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_UNABLE_TO_GET_POLICY_ITEM_FROM_DISPLAY_NAME
Language=English
The policy item internal name could not be determined from the supplied display name.
.
MessageId=0x1951
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_UNABLE_TO_GET_POLICY_ITEM_DISPLAY_NAME_FROM_PATH_NAME
Language=English
The policy item display name path could not be determined from the supplied internal name.
.
MessageId=0x1952
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_POLICY_ID_INVALID
Language=English
The supplied policy id was not valid.
.
MessageId=0x1953
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_POLICY_NOT_LOADED
Language=English
The operation could not be performed because the policy has not been loaded yet.
.
MessageId=0x1954
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_POLICY_ITEM_ENUM_LIST_EMPTY
Language=English
The policy item could not be updated because the enumerated item list could not be retrieved.
.
MessageId=0x1955
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_POLICY_ITEM_ENUM_LINK_EMPTY
Language=English
The policy item could not be updated because an enumerated item was found to have no associated link text.
.
MessageId=0x1956
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_POLICY_ITEM_ENUM_LINK_INVALID
Language=English
The policy item could not be updated because the supplied action path was not found in the list of enumerated items.
.
MessageId=0x1957
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_POLICY_ITEM_LIST_COLUMN_INVALID
Language=English
The policy item could not be updated because a single list column was not supplied in the XML.
.
MessageId=0x1958
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_POLICY_ITEM_LIST_COLUMN_NOT_FOUND
Language=English
The policy item could not be updated because the first column tag could not be found.
.
MessageId=0x1959
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_UNABLE_TO_GET_POLICY_ITEM_NUMBER
Language=English
The policy item number value could not be retrieved.
.
MessageId=0x195a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_UNABLE_TO_GET_POLICY_ITEM_STRING
Language=English
The policy item string value could not be retrieved.
.
MessageId=0x195b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_UNABLE_TO_GET_POLICY_ITEM_BOOL
Language=English
The policy item boolean value could not be retrieved.
.
MessageId=0x195c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FILESYSTEM_SERVICES_NOT_AVAILABLE
Language=English
The web service filesystem services are not available.
.
MessageId=0x195d
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_REMOTE_CMS_NOT_AVAILABLE
Language=English
The remote CMS (%1) is currently not available.
.
MessageId=0x195e
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_CONTENT_SEARCH_LOGON_TIMED_OUT
Language=English
The content database did not respond when attempting to log in to the specified content proxy
.
MessageId=0x195f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_CONTENT_SEARCH_LOGOFF_TIMED_OUT
Language=English
The content database did not respond when attempting to log out from the specified content proxy
.
MessageId=0x1960
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_CONTENT_SEARCH_INIT_TIMED_OUT
Language=English
The content database did not respond when attempting to initialize a connection to the content proxy
.
MessageId=0x1961
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_CANNOT_FIND_SUBGROUP
Language=English
Failed to find subgroup %1.
.
MessageId=0x1962
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_PUT_ISSUE_SUCCEEDED_BUT_ID_WAS_ZERO
Language=English
A new issue could not be created (a zero issue id was returned from the database).
.
MessageId=0x1963
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_CANNOT_UPDATE_ISSUE_WITH_ID_OF_ZERO
Language=English
The issue could not be updated (the issue id was invalid or zero).
.
MessageId=0x1964
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_INVALID_SEARCH_PARAMETER_TYPE
Language=English
The search parameter type for parameter %1 is not supported.
.
MessageId=0x1965
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_APM_EMAIL_MASK_INVALID
Language=English
The email mask is invalid, defaulting to "", message '%2'.
.
MessageId=0x1966
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_WC_AUDIT_EMAIL_ADDRESS_SELECTED
Language=English
Using audit email 'from' address '%2'.
.
MessageId=0x1967
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SEARCH_CRITERIA
Language=English
Executing Search %1 SP=%2 ID=%3 Parameters:%4
.
MessageId=0x1968
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SEARCH_OUTCOME_SUCCEEDED
Language=English
Search %1 SP=%2 ID=%3 returned %4!d! results in %5 seconds
.
MessageId=0x1969
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_OUTCOME_FAILED
Language=English
Search %1 SP=%2 ID=%3 failed. Refer to error %4 below.
.
MessageId=0x1970
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SID_CONFIG
Language=English
Incorrect SID configuration. Please contact technical support.
.
MessageId=0x1971
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SID_CONFIG_DETAIL
Language=English
The SID facility is not configured correctly. Either the registry setting 'UserSIDAttribute' could not be read, or was blank.
.
MessageId=0x1972
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_NO_SID_COLUMN
Language=English
SID not present in the search definition. Please contact technical support.
.
MessageId=0x1973
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_NO_SID_COLUMN_DETAIL
Language=English
The search definition for %1 must have a $SID column defined in the results because it is defined as class="EventReview" and SID checking is enabled.
.
MessageId=0x1974
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_BAD_SID
Language=English
Mismatched SID in the result set. Please contact technical support.
.
MessageId=0x1975
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_BAD_SID_DETAIL
Language=English
The search results requested contained a result (%1) containing a SID that was not present in this users list of permitted SIDs (%2).
.
MessageId=0x1976
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCHID_NOT_FOUND_IN_QUERY_INFO_MAP
Language=English
The search id was not found in the query info map (it may have been removed already).
.
MessageId=0x1977
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_KEY_NOT_FOUND_IN_LOCKED_MAP
Language=English
The specified key string was not found in the map.
.
MessageId=0x1978
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_INFRASTRUCTURE_RETURNED_BLANK_CMS_NAME
Language=English
The local infrastructure returned a blank CMS name.
.
MessageId=0x1979
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_MULTIPLE_PARTICIPANTS_NOT_SUPPORTED
Language=English
The CMS does not support multiple participants per issue.
.
MessageId=0x197a
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_MULTIPLE_PARTICIPANTS_NOT_SET
Language=English
The multiple participants were not set for this issue.
.
MessageId=0x197b
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_OUTCOME_CANCELED
Language=English
Search %1 SP=%2 ID=%3 was canceled by the user.
.
MessageId=0x197c
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SEARCH_OUTCOME_COUNT
Language=English
Search %1 SP=%2 ID=%3 returned a record count of %4!d! in %5 seconds
.
MessageId=0x197d
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_QMGR_NOT_REGISTERED_FOR_RELEASE
Language=English
The email '%1' (eventuid = %2) could not be released from quarantine because a quarantine manager service is not registered.
.
MessageId=0x197e
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_AUDIT_NOT_CONFIGURED
Language=English
The CMS database has not been configured correctly to support auditing operations. Please contact your administrator.
.
MessageId=0x197f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_POLICY_ITEM_ENUM_DISPLAY_VALUE_INVALID
Language=English
The policy item could not be updated because the supplied display value was not found in the list of enumerated items.
.
MessageId=0x1980
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_POLICY_ITEM_ENUM_ENUMINDEX_VALUE_INVALID
Language=English
The policy item could not be updated because the supplied enumindex attribute value was not found in the list of enumerated items.
.
MessageId=0x1981
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCHES_LOCKED_FOR_UPGRADE
Language=English
The iConsole searches are currently unavailable because they are being upgraded to the latest version. Please try again later. If the problem persists contact your administrator.
.
MessageId=0x1982
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCHES_REQUIRE_UPGRADE
Language=English
The iConsole searches are currently unavailable because they need to be upgraded to the latest version. Please contact your administrator.
.
MessageId=0x1983
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SEARCH_UPGRADE_STARTED
Language=English
Upgrade of the iConsole searches to version %1!d! has started.
.
MessageId=0x1984
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SEARCH_UPGRADE_COMPLETE
Language=English
The iConsole searches were upgraded successfully.
.
MessageId=0x1985
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_UPGRADE_FAILED
Language=English
Upgrade of the iConsole searches failed: %1
.
MessageId=0x1986
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_UPGRADING_SEARCH_FOLDER
Language=English
The iConsole searches in folder %2 of %1 are being upgraded.
.
MessageId=0x1987
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SEARCH_FOLDER_UPGRADE_COMPLETE
Language=English
Successfully upgraded %3!d! of %5!d! searches in folder %2 of %1. %4!d! searches did not need upgrading.
.
MessageId=0x1988
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_FOLDER_UPGRADE_FAILED
Language=English
Upgrade of the iConsole searches in folder %2 of %1 failed: %3
.
MessageId=0x1989
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_UNABLE_TO_CONTACT_WEBSERVICE
Language=English
The iConsole Front-end web server was unable to contact the iConsole Application server: %1
.
MessageId=0x198a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_RUN_CONTENT_QUERY_FAILED
Language=English
The content query with ID=%1 failed to run successfully on content proxy %2:%3.
The error message returned was:  
%4.
.
MessageId=0x198b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_NO_GROUP_CONTENT_SEARCH
Language=English
Searching by groups was requested but this facility is not supported by the selected content proxy.
.
MessageId=0x198c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FAILED_TO_GZIP_TAR_FILE
Language=English
The tar file could not be compressed by gzip.
.
MessageId=0x198d
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_SEARCH_RESULTS_DOWNLOADED
Language=English
The results for search ID=%1 were downloaded in %2 format.
.
MessageId=0x198e
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_NO_SEARCH_RESULTS_DOWNLOAD_FORMAT
Language=English
A download of search results was requested but no format was specified.
.
MessageId=0x198f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FAILED_SEARCH_RESULTS_FILE_CREATION
Language=English
It was not possible to create a download file in %1 format.%t
Reason: %2
.
MessageId=0x1990
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_INVALID_SEARCH_RESULTS_ID
Language=English
There was a problem with the search identifier. This was probably because the search identifier specified (%2) does not belong to your current session (%1).
.
MessageId=0x1991
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_NOT_CACHED
Language=English
An attempt was made to get the temporary copy of the %1 search that you had modified, but it had been discarded because you haven't used it recently. 
It may still be possible to recover the customize page from the browser history.
.
MessageId=0x1992
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_NO_USERID_CONTENT_SEARCH
Language=English
Searching for users by ID was requested but this facility is not supported by the selected content proxy.
.
MessageId=0x1993
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FAILED_TO_CREATE_ZIP_FILE
Language=English
The zip file could not be created.
.
MessageId=0x1994
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FAILED_TO_CREATE_TAR_FILE
Language=English
The tar file could not be created.
.
MessageId=0x1995
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_AUDIT_OPERATION_STARTED
Language=English
Audit operation started - Pending(%1!d!).
.
MessageId=0x1996
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_AUDIT_OPERATION_FINISHED
Language=English
Audit operation completed - Updated(%1!d!), Skipped(%2!d!), Errors(%3!d!).
.
MessageId=0x1997
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_AUDIT_OPERATION_FINISHED_NOINFO
Language=English
Audit operation completed.
.
MessageId=0x1998
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_NO_FILE_EVENT_SEARCH
Language=English
Searching for file events was requested but this facility is not supported by the selected content proxy.
.
MessageId=0x1999
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_CUSTOM_SEARCH_EMPTY
Language=English
The custom search definition being saved was empty.
.
MessageId=0x199a
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_EMAIL_SENT
Language=English
Email was sent - %2 (session id %1)
.
MessageId=0x199b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_FILE_UPGRADE_FAILED
Language=English
Upgrade of the iConsole search file %3 in folder %2 of %1 failed: %4 %5
.
MessageId=0x199c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SESSION_TRACKING_INITIALIZATION_FAILED
Language=English
The iConsole session tracking initialization failed: %1
.
MessageId=0x199d
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_WC_DEFAULT_PREFS_READ_ERROR
Language=English
Failed to read the default preferences file: %1 Built-in default preferences have been used.
.
MessageId=0x199e
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_WC_DEFAULT_PREFS_INVALID_XML
Language=English
The default preferences file failed XML validation: %1 Built-in default preferences have been used.
.
MessageId=0x199f
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_WC_DEFAULT_PREFS_XML_EXCEPTION
Language=English
Reading the default preferences file caused an XML error: %1 Built-in default preferences have been used.
.
MessageId=0x19a0
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_WC_USER_PREFS_READ_ERROR
Language=English
Failed to read the user's preferences file: %1 Default preferences have been used.
.
MessageId=0x19a1
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_WC_USER_PREFS_XML_EXCEPTION
Language=English
Reading the user's preferences file caused an XML error: %1 Default preferences have been used.
.
MessageId=0x19a2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_COULD_NOT_BE_READ
Language=English
The '%1' search definition for query '%2' could not be retrieved, there was an error reading the search definition file from the file system: %3.
.
MessageId=0x19a3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_NAME_NOT_FOUND
Language=English
The '%1' search definition for query '%2' could not be retrieved, it wasn't possible to determine the name of the search definition file: %3. 
.
MessageId=0x19a4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_PREFERENCES_COULD_NOT_BE_READ
Language=English
The user preferences could not be retrieved: %1.
.
MessageId=0x19a5
;// iConsole PageTracker.cs references this messageid - do not change
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_DEFINITION_UNINSTALL_STATUS
Language=English
%1!d! search definitions were successfully deleted:%t
%2%t
%3!d! search definitions failed to be deleted:%t
%4
.
MessageId=0x19a6
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FAILED_SETTING_SIZE_OF_WEBSERVICE_THREADPOOL
Language=English
Failed to set the size of the webservice threadpool: %1. Default size of 2 * Num Processors will be used.
.
MessageId=0x19a7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_DOWNLOAD_CONVERTER_TIMED_OUT
Language=English
The file download converter %1 timed out before it could complete the conversion.
.
MessageId=0x19a8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_DOWNLOAD_CONVERTER_FAILED
Language=English
The file download converter %1 failed %2 %3.
.
MessageId=0x19a9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_LOAD_ENCRYPTION_CONFIG_FAILED
Language=English
Failed to load encryption configuration parameters due to error '%1'.
.
MessageId=0x19aa
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_LOGON_INVALID_TIMESTAMP
Language=English
The supplied login timestamp is invalid '%1'.
.
MessageId=0x19ab
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_DECRYPTION_FAILED
Language=English
Failed to decrypt supplied login credentials '%1'.
.
MessageId=0x19ac
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_FILE_ENUM_FAILED
Language=English
Failed to enumerate the next file item.
.
MessageId=0x19ad
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_INIT_LOGFILE_FAILED
Language=English
Failed to initialize the webservice log file.
.
MessageId=0x19ae
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_INIT_RESOURCES_FAILED
Language=English
Failed to initialize the webservice resources file.
.
MessageId=0x19af
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_FILE_VERSION_FAILED
Language=English
Failed to find the latest search file version.
.
MessageId=0x19b0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_ERROR_ALREADY_CACHED
Language=English
The search error had already been cached.
.
MessageId=0x19b1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_ERROR_NOT_CACHED
Language=English
The search error could not be retrieved from the cache.
.
MessageId=0x19b2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_PROGRESS_NOT_CACHED
Language=English
The search progress details could not be retrieved from the cache.
.
MessageId=0x19b3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_RESULTS_NOT_CACHED
Language=English
The search results could not be retrieved from the cache.
.
MessageId=0x19b4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_OBJECT_NOT_CACHED
Language=English
The object could not be retrieved from the cache.
.
MessageId=0x19b5
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_WC_CONNECT_TO_LDAPSERVER_USING_SECURE_AUTH_FAILED
Language=English
The connection to the specified LDAP Server failed using Secure Authentication. '%1'.
.
MessageId=0x19b6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_CONNECT_TO_LDAPSERVER_FAILED
Language=English
The connection to the specified LDAP Server failed '%1'. The LDAP server is Unavailable.
.
MessageId=0x19b7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_EXCEPTION_PARSING_LDAP_SERVER_CONNECTION_STRING
Language=English
An exception was thrown parsing the LDAP Server connection string registry key, the exception message was %1.
.
MessageId=0x19b8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_DOWNLOAD_CONVERTER_BLOCKED
Language=English
The file download converter %1 failed because it was blocked by the operating system. Check the file properties, unblock all converter files and restart IIS.
.
MessageId=0x19b9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_NO_TOKENIZER_LANGUAGE
Language=English
A non-generic language was requested for parsing the search term, but this facility is not supported by the selected content proxy.
.
MessageId=0x19ba
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_INVALID_SEARCH_DEFINITION_SCRIPT
Language=English
The search definition javascript has errors.
.
MessageId=0x19bb
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_INVALID_EVENT_REVIEW_TIME
Language=English
The event review time received from session '%1' was invalid: %2.
.
MessageId=0x19bc
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_QMGR_NOT_REGISTERED
Language=English
The email could not be released from quarantine because a quarantine manager service is not registered.
.
MessageId=0x19bd
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_UNEXPECTED_REGISTRY_SETTING
Language=English
The registry setting '%1' has an unexpected value '%2'.
.
MessageId=0x19be
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SESSION_TRACKING_ERROR
Language=English
iConsole session error. %1.
.
MessageId=0x19bf
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_WC_UNRECOGNIZED_POST_LOGON
Language=English
An attempt was made to log in to the iConsole using unrecognized POST variables; '%1'.
.
MessageId=0x19c0
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_WC_UNRECOGNIZED_QUERYSTRING_LOGON
Language=English
An attempt was made to log in to the iConsole using unrecognized querystring variables; '%1'.
.
MessageId=0x19c1
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_WC_NO_WINDOWS_AUTHENTICATION_MODULE_INSTALLED
Language=English
The iConsole web server installed on machine '%1' running IIS 7 (or above) does not have the windows authentication module installed, SSO will not be functional.
.
MessageId=0x19c2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_UNABLE_TO_DETERMINE_IIS_VERSION
Language=English
The iConsole failed to determine the version of IIS.
.
MessageId=0x19c3
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_REQUEST_MONITOR_STARTED
Language=English
The iConsole Request Monitor started successfully.
.
MessageId=0x19c4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_REQUEST_MONITOR_START_FAILED
Language=English
The iConsole Request Monitor failed to start due to the following error '%1'.
.
MessageId=0x19c5
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_REQUEST_MONITOR_STOPPED
Language=English
The iConsole Request Monitor stopped successfully.
.
MessageId=0x19c6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_REQUEST_MONITOR_ERROR
Language=English
The iConsole Request Monitor error '%1'.
.
MessageId=0x19c7
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_WC_REQUEST_MONITOR_STARTED_WARNING
Language=English
The iConsole Request Monitor started with the following warning '%1'.
.
MessageId=0x19c8
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_ASSOC_TRIGGERS_NOT_SET
Language=English
The associated incidents could not be set for this issue.
.
MessageId=0x19c9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_RESULTS_MERGE_FAILED
Language=English
Merging the results for a multi-query search failed
.
MessageId=0x19ca
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SAME_SESSION_DIFFERENT_USER
Language=English
Logging into the same session with different usernames is not supported.
.
MessageId=0x19cb
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_WC_ERROR_DETERMINING_LDAP_SERVER_TYPE
Language=English
The following error occurred determining the LDAP Server Type '%1', will default to Active Directory.
.
MessageId=0x19cc
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_UNABLE_TO_CONTACT_CMS
Language=English
The CMS machine could not be contacted.
.
MessageId=0x19cd
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_CABI_INTEGRATION
Language=English
BOE integration error: %2
.
MessageId=0x19ce
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_WC_CABI_INTEGRATION
Language=English
BOE integration warning: %2
.
MessageId=0x19cf
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_CABI_INTEGRATION
Language=English
BOE integration: %2
.
MessageId=0x19d0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_HOMEPAGE_COULD_NOT_BE_READ
Language=English
The homepage could not be retrieved: %1.
.
MessageId=0x19d1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_HOMEPAGE_COULD_NOT_BE_WRITTEN
Language=English
The homepage layout could not be saved: %1.
.
MessageId=0x19d2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_PORTLETS_COULD_NOT_BE_WRITTEN
Language=English
The homepage portlet definitions could not be saved: %1.
.
MessageId=0x19d3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_CABI_USER_MAPPING_COULD_NOT_BE_WRITTEN
Language=English
The BOE user alias could not be saved: %1.
.
MessageId=0x19d4
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_WC_CABI_INTEGRATION_UNAVAILABLE
Language=English
BOE integration is not available.
.
MessageId=0x19d5
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_WC_CABI_INTEGRATION_AVAILABLE
Language=English
BOE integration is available.
.
MessageId=0x19d6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_SEARCH_ARG_UNUSED
Language=English
There was no parameter defined for argument position '%1!d!'.
.
MessageId=0x19fd
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_UNEXPECTED_ERROR
Language=English
An unexpected error occurred in '%1': %2
.
MessageId=0x19fe
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_XML_EXCEPTION
Language=English
An XML Exception was thrown: "%1" %2
.
MessageId=0x19ff
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_WC_UNHANDLED_EXCEPTION
Language=English
An unexpected Exception was thrown: "%1"%n
%2%n
%n
InnerException: %3%n
%4
.


;
; // Policy Engine Hub log codes 0x1A00 - 0x1AFF
;

MessageId=0x1A00
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_HUB_SYSTEM_DEPRECATED
Language=English
SYSTEM: %1
.
MessageId=0x1A01
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_HUB_INFORMATIONAL_DEPRECATED
Language=English
INFORMATION: %1
.
MessageId=0x1A02
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_HUB_WARNING_DEPRECATED
Language=English
WARNING: %1
.
MessageId=0x1A03
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_HUB_ERROR_DEPRECATED
Language=English
ERROR: %1
.
MessageId=0x1A04
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_HUB_CRITICAL_ERROR_DEPRECATED
Language=English
CRITICAL ERROR: %1
.
MessageId=0x1A05
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_DISCONNECTING_SURPLUS_POLICY_ENGINES
Language = English
The %1!d! surplus Policy Engine connections(s) on queue %2!ls! will be disconnected.
.
MessageId=0x1A06
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_POLICY_ENGINE_CONNECTION_FAILED
Language = English
Connection to Policy Engine %1 failed. Error is %2.
.
MessageId=0x1A07
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_NO_MORE_STANDBY
Language = English
There are no more standby Policy Engines to replace %1, so it will be restarted. Shutdown reason %2.
.
MessageId=0x1A08
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_ACTIVE_ENGINE_RESTART
Language = English
Active Policy Engine connection %1 has been made inactive and will be restarted. Shutdown reason %2.
.
MessageId=0x1A09
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_NO_STANDBY_RESTART
Language = English
There are no more standby Policy Engines to replace %1, so it will be restarted. Shutdown reason %2.
.
MessageId=0x1A0A
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_POLICY_ENGINE_SUSPENDED
Language = English
Policy engine %1 has been suspended.
.
MessageId=0x1A0B
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_POLICY_ENGINE_RESUMED
Language = English
Policy engine %1 has resumed processing.
.
MessageId=0x1A0C
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_SURPLUS_ENGINES_DISCONNECTED
Language = English
The %1!d! surplus Policy Engine connections(s) on queue %2 will be disconnected.
.
MessageId=0x1A0E
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_POLICY_ENGINE_STOPPED_PROCESSING
Language = English
Policy engine %1 has stopped processing.
.
MessageId=0x1A0F
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_POLICY_ENGINE_STARTED_PROCESSING
Language = English
Policy engine %1 has started processing.
.
MessageId=0x1A10
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_POLICY_ENGINE_DEAD
Language = English
Policy engine %1 is dead.
.
MessageId=0x1A11
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_FAILED_TO_DISCONNECT
Language = English
Failed to disconnect a Policy Engine on machine %1. Error was %2.
.
MessageId=0x1A12
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_FAILED_TO_CREATE
Language = English
Failed to created Policy Engine proxy for machine %1 on queue %2. Error was %3
.
MessageId=0x1A15
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_START_MAKE_UP_REQUIREMENTS
Language = English
Starting up standby Policy Engine connection %1 to make up requirements.
.
MessageId=0x1A16
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_START_MAKE_UP_FAILING
Language = English
Starting up standby Policy Engine connection %1 to make up for failing active Policy Engine.
.
MessageId=0x1A18
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_NO_MORE_STANDBY_AT_ALL
Language = English
No more standby Policy Engines to connect to make up requirements.
.
MessageId=0x1A19
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_EVENT_DEALLOCATED_FROM_QUEUE
Language = English
Event '%1' has been deallocated from queue %2.
.
MessageId=0x1A1A
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_EVENT_TIMED_OUT_FROM_POLICY_ENGINE
Language = English
Event '%2' has been timed out while waiting for Policy Engine %1.
.
MessageId=0x1A1B
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_EVENT_UNABLE_TO_PROCESS
Language = English
Policy engine %1 is currently unable to process event '%2'. The event will be reassigned.
.
MessageId=0x1A1C
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_FAILED_TO_ANALYSE_EVENT
Language = English
Failed to analyze event from %1 state on Policy Engine %2.
.
MessageId=0x1A1D
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_CONFIG_CHANGED
Language = English
Config changed on Policy Engine %1.
.
MessageId=0x1A1E
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_SECURITY_CHANGED
Language = English
Security config changed on Policy Engine %1.
.
MessageId=0x1A1F
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_TIMEOUT_CHANGED
Language = English
Event timeout changed on Policy Engine %1.
.
MessageId=0x1A20
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_COMMON_CONFIG_CHANGED
Language = English
Common config changed on Policy Engine %1.
.
MessageId=0x1A21
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_PRIORITY_CHANGED
Language = English
Priority changed on Policy Engine %1.
.
MessageId=0x1A22
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_HEARTBEAT_FAILED
Language = English
Failed to respond to heartbeat on Policy Engine %1. Error was %2
.
MessageId=0x1A23
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_SHUTDOWN_INTENTION
Language = English
Policy engine %1 has signalled its intention to shut down.
.
MessageId=0x1A24
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_MANAGEMENT_THREAD_TIMEOUT
Language = English
Timed out waiting for management thread on %1 to die cleanly. Thread will be forced
.
MessageId=0x1A25
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_SHUTTING_DOWN
Language = English
Policy engine connection to %1 will now attempt to shut down
.
MessageId=0x1A26
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_HEARTBEAT_FAILED
Language = English
Heartbeat not received from Policy Engine %1. It will be retired.
.
MessageId=0x1A27
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_SUSPECT_HEARTBEAT_FAILURE
Language = English
Suspect heartbeat failure on Policy Engine %1. The Policy Engine will not be retired.
.
MessageId=0x1A28
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_POLICY_ENGINE_CONNECT_ATTEMPT
Language = English
Policy engine for %1 will now attempt to connect.
.
MessageId=0x1A29
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_POLICY_ENGINE_RECONNECT_ATTEMPT
Language = English
Attempting to reconnect to Policy Engine %1.
.
MessageId=0x1A2A
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_POLICY_ENGINE_MODIED_SETTINGS
Language = English
Policy engine %1 has been successfully loaded with modified settings.
.
MessageId=0x1A2B
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_LOGON_USER_FAILED
Language = English
Failed to log in as user %1\\%2. Error was %3
.
MessageId=0x1A2C
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_POLICY_ENGINE_CONNECT_FAILED
Language = English
Failed to connect to the Policy Engine %1. Error was %2.
.
MessageId=0x1A2D
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_POLICY_ENGINE_CONNECT_SUCCEEDED
Language = English
Successfully connected to Policy Engine %1.
.
MessageId=0x1A2E
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_SERVICE_NOT_STARTED
Language = English
The Policy Engine service has not been started on machine '%1'. Please manually start it.
.
MessageId=0x1A2F
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_SERVICE_NOT_REGISTERED
Language = English
The Policy Engine service is not registered on machine '%1'. Please reinstall it.
.
MessageId=0x1A30
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_NO_MACHINE_ACCESS
Language = English
Cannot contact machine '%1'. Please check for access.
.
MessageId=0x1A31
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_MACHINE_ACCESS_DENIED
Language = English
Access is denied contacting machine '%1' for service status. This may occur if the user account %2\%3 is not a member of the local administrators group on that machine.
.
MessageId=0x1A32
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_IMPERSONATION_FAILED
Language = English
Failed to impersonate user. Error was %1.
.
MessageId=0x1A33
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_OBTAIN_CALLBACK_FAILED
Language = English
Failed to obtain a monitor callback from PE on machine %1. Error was %2.
.
MessageId=0x1A34
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_REGISTER_CALLBACK_FAILED
Language = English
Failed to register monitor callback on %1. Error was %2.
.
MessageId=0x1A35
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_DEALLOCATING_ALL_EVENTS
Language = English
Deallocating all events on %1.
.
MessageId=0x1A36
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_TIMED_OUT_POLICY_ENGINE_SHUTDOWN
Language = English
Timed out waiting for events to process on Policy Engine %1 Outstanding events will be deallocated.
.
MessageId=0x1A37
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_SUCCESSFULL_POLICY_ENGINE_CLEANUP
Language = English
Successfully waited for all events to process on %1.
.
MessageId=0x1A38
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_DISCONNECTING_POLICY_ENGINE
Language = English
Disconnecting Policy Engine %1
.
MessageId=0x1A39
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_UNREGISTER_MONITOR_CALLBACK_FAILED
Language = English
Failed to unregister monitor callback on PE %1. Error was %2.
.
MessageId=0x1A3A
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_EVENT_DEALLOCATED_FROM_POLICY_ENGINE
Language = English
Event '%1' has been deallocated from Policy Engine %2.
.
MessageId=0x1A3B
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_REGISTERCLIENT_FAILED
Language = English
Failed to register client on Policy Engine %1. Error was %2.
.
MessageId=0x1A3C
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_UNREGISTERCLIENT_FAILED
Language = English
Failed to UnregisterClient on Machine %1. Error was %2.
.
MessageId=0x1A3D
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_SETCONFIG_FAILED
Language = English
SetConfig failed on %1. Error was %2.
.
MessageId=0x1A3F
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_CALL_WILL_BE_CANCELLED
Language = English
The method '%1' on Policy Engine %2 has taken too long to complete. The call may now be canceled.
.
MessageId=0x1A40
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_PREPROCESSING_THREADPOOL_CHANGE
Language = English
Pre-processing thread pool changing from %1!d! to %2!d! threads.
.
MessageId=0x1A41
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_COMPLETION_THREADPOOL_CHANGE
Language = English
Completion thread pool changing from %1!d! to %2!d! threads.
.
MessageId=0x1A42
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_OP_OVER_HIGH_MEMORY_WATERMARK
Language = English
Total item memory has gone over high watermark.
.
MessageId=0x1A43
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_UNDER_LOW_MEMORY_WATERMARK
Language = English
Total item memory has gone under low watermark.
.
MessageId=0x1A44
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_OP_OVER_HIGH_COUNT_WATERMARK
Language = English
Total event count has gone over high watermark.
.
MessageId=0x1A45
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_UNDER_LOW_COUNT_WATERMARK
Language = English
Total event count has gone under low watermark.
.
MessageId=0x1A46
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_FAILED_SETEVENTDETAILS
Language = English
SetEventDetails on pWgnHubWorkItem failed. Error was %1.
.
MessageId=0x1A47
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_ADDTOBACKOFQUEUEFAILED
Language = English
AddToBackofQueue failed to add pNewWorkItem to the back of queue. Error was %1.
.
MessageId=0x1A48
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_OP_EVENT_EVENT_ADDED_IN_MEMORY_THROTTLE_FAIL
Language = English
Event has been added to the hub while in memory throttling mode event will be returned.
.
MessageId=0x1A49
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_OP_EVENT_EVENT_ADDED_IN_MEMORY_THROTTLE_WAIT
Language = English
Event has been added to the hub while in memory throttling mode event processing will be delayed.
.
MessageId=0x1A4A
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_OP_EVENT_EVENT_ADDED_IN_COUNT_THROTTLE_FAIL
Language = English
Event has been added to the hub while in event count throttling mode. Event will be returned.
.
MessageId=0x1A4B
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_OP_EVENT_EVENT_ADDED_IN_COUNT_THROTTLE_WAIT
Language = English
Event has been added to the hub while in event count throttling mode. Event processing will be delayed.
.
MessageId=0x1A4C
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_EVENT_EVENT_FAILED_TO_ADD_TO_QUEUE
Language = English
Failed to add event '%1' of size %2!d! to a valid queue returning to input queue.
.
MessageId=0x1A4D
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_OP_NO_ACTIVE_QUEUES
Language = English
No active queues are defined so no events can be processed.
.
MessageId=0x1A4F
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_OP_NO_LOWEST_QUEUE
Language = English
The queue with the lowest byte limit '%1' is not set to 0. The limit will be forced to enable full coverage of events.
.
MessageId=0x1A50
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_OP_DUPLICATE_QUEUES
Language = English
Queue '%1' has the same byte limit as queue '%2' and will not be assigned events. Please reconfigure your queues.
.
MessageId=0x1A51
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_QUEUE_CREATE_SUCCESS
Language = English
Successfully created queue %1.
.
MessageId=0x1A52
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_REMOVING_QUEUE
Language = English
Removing queue %1.
.
MessageId=0x1A53
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_QUEUE_REMOVED
Language = English
Queue %1 has been removed.
.
MessageId=0x1A54
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_EVENT_FAILED_TO_ADD_TO_QUEUE
Language = English
Event has failed to be added to queue. Error is: %1
.
MessageId=0x1A55
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_THROTTLING_MODE_WAIT
Language = English
Hub throttling mode has been set to 'Wait'.
.
MessageId=0x1A56
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_THROTTLING_MODE_FAIL
Language = English
Hub throttling mode has been set to 'Fail'.
.
MessageId=0x1A57
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_COPYING_MODE_IMMEDIATE
Language = English
Event copying mode has been set to 'Immediate'.
.
MessageId=0x1A58
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_COPYING_MODE_ON_DEMAND
Language = English
Event copying mode has been set to 'On Demand'.
.
MessageId=0x1A59
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_COPYING_MODE_NEVER
Language = English
Event copying mode has been set to 'Never'.
.
MessageId=0x1A5A
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_COPYING_MODE_UNKNOWN
Language = English
Unknown type for event copying mode new mode will be ignored.
.
MessageId=0x1A5B
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_EVENT_ACCEPTED_EVENT
Language = English
Accepted event '%1'.
.
MessageId=0x1A5C
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_EVENT_ABOUT_TO_ANALYSE
Language = English
About to analyze event '%1' on %2
.
MessageId=0x1A5D
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_EVENT_ANALYSING
Language = English
Analyzing event '%1' on %2
.
MessageId=0x1A5E
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_EVENT_PROCESSING_FAILED_COMMS_FAULT
Language = English
Event '%1' cannot be processed due to a communication fault - it will be returned to the source. Error is: %2.
.
MessageId=0x1A5F
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_EVENT_FAILED_TO_ADD_EVENT
Language = English
Failed to add event '%1' to %2. Error was %3
.
MessageId=0x1A60
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_EVENT_COMPLETED_PROCESSING_ON
Language = English
Completed processing of event '%1' on %2 status %3.
.
MessageId=0x1A61
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_EVENT_COMPLETED_PROCESSING
Language = English
Completed processing of event '%1' status %2.
.
MessageId=0x1A62
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_EVENT_NO_COMPLETION_RESCHEDULE
Language = English
Event '%1' has previously been completed, possibly by a timeout.
.
MessageId=0x1A63
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_EVENT_NOT_PROCESSED_COMPLETED
Language = English
Event '%1' has not been processed but will be completed successfully. Reason is: %2.
.
MessageId=0x1A68
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_EVENT_FAILED_TO_GET_EMAILSTORE
Language = English
Failed to obtain the IWgnEMailEventStore from the email store. Error was %1.
.
MessageId=0x1A69
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_EVENT_FAILED_TO_GET_ENVELOPE
Language = English
Failed to obtain the email envelope from the email store. Error was %1.
.
MessageId=0x1A6A
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_EVENT_FAILED_TO_GET_SUBJECT
Language = English
Failed to obtain the subject from the email envelope. Error was %1.
.
MessageId=0x1A6B
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_EVENT_FAILED_PROCESSING_RETRY
Language = English
Event '%1' failed to be processed on Policy Engine %2 and will be retried. Retry count is %3!d!. See PE activity log for further details. Error was: %4.
.
MessageId=0x1A6C
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_EVENT_FAILED_PROCESSING
Language = English
Event '%1' failed to be processed on Policy Engine %2. See PE activity log for further details. Error was: %3.
.
MessageId=0x1A6D
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_EVENT_FAILED_PROCESSING_MAX_RETRY
Language = English
Event '%1' failed to be processed on Policy Engine %2 and has reached its maximum retry count. It will be returned. See PE activity log for further details. Error was: %3.
.
MessageId=0x1A6E
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_FAILED_TO_CREATE_COMBO_STREAM
Language = English
Failed to CoCreate a WgnComboStream. Error was %1.
.
MessageId=0x1A6F
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_FAILED_TO_GET_EVENTSTORE_FROM_EVENT
Language = English
Failed to obtain the IWgnEMailEventStore interface from iEvent. Error was %1.
.
MessageId=0x1A70
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_MARK_FAILED_ON_EVENT_STORE
Language = English
Failed to copy event '%1'. Error was %2.
.
MessageId=0x1A71
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_SAVESTREAM_FAILED_ON_EVENT_STORE
Language = English
SaveStream() on the Event failed. Error was %1.
.
MessageId=0x1A72
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_STAT_FAILED_ON_EVENT_STORE
Language = English
Stat() on the Event failed. Error was %1.
.
MessageId=0x1A73
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_FAILED_TO_CREATE_WGNEVENT
Language = English
Failed to CoCreate a WgnEvent. Error was %1.
.
MessageId=0x1A74
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_SEEK_ON_STREAM_FAILED
Language = English
Seek on pStream failed. Error was %1.
.
MessageId=0x1A75
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_LOADSTREAM_ON_EVENT_FAILED
Language = English
LoadStream on pNewWgnEvent failed. Error was %1.
.
MessageId=0x1A76
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_FAILED_TO_INITIALISE_COM_SECURITY
Language = English
Failed to initialize COM security. Error is %1.
.
MessageId=0x1A77
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_CANNOT_AUTHENTICATE_WITH_CREDENTIALS
Language = English
You must supply valid login credentials via the SetCredentials option before starting the Policy Engine Hub. Error is: %1.
.
MessageId=0x1A78
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_IGNORE_CREDENTIALS
Language = English
The Policy Engine Hub service is being run as a named user, but has the 'Credentials' user specified. The 'Credentials' user will be ignored.
.
MessageId=0x1A79
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_RUNNING_UNDER_CREDENTIALS
Language = English
The Policy Engine Hub is running in security context of '%1'.
.
MessageId=0x1A7A
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_FAILED_TO_OBTAIN_PASSWORD
Language = English
Failed to obtain password from LSA. Error is: %1.
.
MessageId=0x1A7B
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_TIMED_OUT_REMOVING_FROM_QUEUE
Language = English
Timed out removing event on queue %1.
.
MessageId=0x1A7C
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_EVENT_TIMED_OUT
Language = English
Event '%1' has been timed out.
.
MessageId=0x1A7D
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_ALWAYS_LOG
Language = English
%1
.
MessageId=0x1A7E
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_ALWAYS_LOG
Language = English
Critical Error: %1
.
MessageId=0x1A7F
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_IS_STARTING
Language = English
The Policy Engine Hub is starting.
.
MessageId=0x1A80
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_STOPPED
Language = English
The Policy Engine Hub stopped successfully.
.
MessageId=0x1A81
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_STARTED
Language = English
The Policy Engine Hub started successfully.
.
MessageId=0x1A82
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_DIVIDER
Language = English
********************************************************
.
MessageId=0x1A83
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_OP_ENTERING_NO_PE_FAILURE_MODE
Language = English
Queue %1 is entering failure mode.
.
MessageId=0x1A84
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_OP_LEAVING_NO_PE_FAILURE_MODE
Language = English
Queue %1 is leaving failure mode.
.
MessageId=0x1A85
Severity = Informational
Facility = Wigan
SymbolicName = WGN_W_HUB_OP_CLOSING_DISTRIBUTOR_AGENT
Language = English
Closing Distributor Agent ...
.
MessageId=0x1A86
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_NO_CREDENTIALS
Language = English
The Policy Engine Hub service is being run under the LocalSystem account and has no 'Credentials' user specified. Remote Policy Engines may not be accessible.
.
MessageId=0x1A87
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_VALID_CREDENTIALS
Language = English
The Policy Engine Hub service has been configured with the 'Credentials' user '%1\%2'.
.
MessageId=0x1A88
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_EVENT_FAILED_TO_NOTIFY_COMPLETION
Language = English
Failed to notify completion of '%1'. Error was %2.
.
MessageId=0x1A89
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_EVENT_SUCCESSFULLY_CALLED_BACK
Language = English
'%1' successfully called back into source.
.
MessageId=0x1A8A
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_FAILED_TO_INITIALISE_QUEUE
Language = English
Failed to initialize queue %1 are the registry entries complete?
.
MessageId=0x1A8B
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_POLICY_ENGINE_CONNECTED_SUCCESSFULLY
Language = English
Policy engine %1 connected successfully.
.
MessageId=0x1A8C
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_HUB_OP_SHUTTING_DOWN_SURPLUS_POLICY_ENGINE
Language = English
Shutting down standby Policy Engine connection %1 as it is surplus to requirements.
.
MessageId=0x1A8D
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_CANNOT_AUTHENTICATE_WITH_CREDENTIALS_EVENT
Language = English
You must supply valid login credentials via the SetCredentials option before starting the Policy Engine Hub.
.
MessageId=0x1A8E
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_OP_CANNOT_WRITE_TO_LOG_FILE
Language = English
An error occurred trying to write to the Policy Engine Hub Log file.
.
MessageId=0x1A8F
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_LOWWATERMARKCOUNT_EXCEEDS_HIGHWATERMARKCOUNT
Language = English
The LowWaterMarkEventCount registry value cannot be higher than the HighWaterMarkEventCount value.
.
MessageId=0x1A90
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_LOWWATERMARKMB_EXCEEDS_HIGHWATERMARKMB
Language = English
The LowWaterMarkMB registry value cannot be higher than the HighWaterMarkMB value.
.

MessageId=0x1A91
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_ACCESS_TO_PE_DENIED
Language = English
Access to the Policy Engine on machine %1 has been denied. This may occur if the user account %2\%3 is not a member of the local administrators group on that machine.
.
MessageId=0x1A92
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_EVENT_FAILED_TO_REQUEST_COMPLETION
Language = English
Failed to request second pass completion of '%1' from the client. Error was %2.
.
MessageId=0x1A93
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_EVENT_FAILED_TO_PROCESS_COMPLETION
Language = English
Failed to process second pass completion of '%1' in the PE. Error was %2.
.
MessageId=0x1A94
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_ATTEMPTED_CHANGE_CLIENT_TYPE
Language = English
Attempt to change major client type not supported on Policy Engine.
.
MessageId=0x1A95
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_ATTEMPTED_CHANGE_CLIENT_TYPE_EX
Language = English
Attempt to change client type from %1 to %2 on Policy Engine %3 not supported.
.
MessageId=0x1A96
Severity = Informational
Facility = Wigan
SymbolicName = WGN_W_HUB_OP_CLOSING_SOCKET_AGENT
Language = English
Closing Socket Agent ...
.
MessageId=0x1A97
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_LOG_FAILED_TO_INITIALISE_SMTP_S
Language = English
SMTP initialization failed in the Hub Extension, error %1.
.
MessageId=0x1A98
Severity = Warning
Facility = Wigan
SymbolicName = WGN_W_HUB_LOG_FAILED_TO_REGISTER_GENERIC_CLIENT
Language = English
Failed to register as generic client on Policy Engine %1. Error was %2
.
MessageId=0x1A99
Severity = Error
Facility = Wigan
SymbolicName = WGN_E_HUB_NO_POLICY_ENGINES_CONFIGURED
Language = English
There are no Policy Engines configured.  Please ensure that a valid Policy Engine has been specified.
.
MessageId=0x1A9A
Severity = Informational
Facility = Wigan
SymbolicName = WGN_W_HUB_OP_CLOSING_ICAP_AGENT
Language = English
Closing ICAP Agent ...
.
;
;// SMTP Sink Log Codes 0x1B00 to 0x1BFF
;//  Last reviewed for documentation accuracy in Nov/2010.
;
MessageId=0x1B00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_OPEN_MAPI_SESSION
Language=English
*Obsolete* Failed to open a MAPI message session, error %1.
.
MessageId=0x1B01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_GET_MAPI_ALLOCATOR
Language=English
*Obsolete* Failed to obtain the address of the MAPI memory allocation function, error %1. 
.
MessageId=0x1B02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_INITIALIZE_MAPI
Language=English
*Obsolete* Failed to initialize MAPI, error %1.
.
MessageId=0x1B03
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_EMAILS_OUTSTANDING_IN_HUB
Language=English
%1!d! emails are outstanding in the Policy Engine Hub.
.
MessageId=0x1B04
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SMTPSINK_LOG_FAILED_TO_RELOAD_PENDING_MAIL_WILL_RESUBMIT
Language=English
Re-loading the pending email with subject '%1!ls!' failed, error %2.
The email will re-load as if it had just been submitted.
.
MessageId=0x1B05
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_BLOCKED_EMAIL
Language=English
Blocked email with subject '%1!ls!'.
.
MessageId=0x1B06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_BLOCK_EMAIL
Language=English
Failed to block email with subject '%1!ls!'.
.
MessageId=0x1B07
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_DELETED_EMAIL
Language=English
Applying failure mode: Deleted email with subject '%1!ls!'.
.
MessageId=0x1B08
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_DELETE_EMAIL
Language=English
Applying failure mode: Should have deleted the email, but failed. Subject '%1!ls!'.
.
MessageId=0x1B09
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_INVALID_PARAMETER_DEPRECATED
Language=English
*Obsolete* SMTP Sink %1 invalid parameter %2.
.
MessageId=0x1B0A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_INVALID_DATA_DEPRECATED
Language=English
*Obsolete* SMTP Sink %1 invalid data %2.
.
MessageId=0x1B0B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_READCONTENT_DEPRECATED
Language=English
*Obsolete* SMTP Sink error reading email content. Bytes requested %1!d! does not match bytes read %2!d! error=%3.
.
MessageId=0x1B0C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_EXCEPTION_DEPRECATED_
Language=English
*Obsolete* Message number %1!lu! from Sender Firm ID %2!lu!. Error = %3.
.
MessageId=0x1B0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_POSTCAT_EXCEPTION_DEPRECATED
Language=English
*Obsolete* Exception processing message in Post Categorization. Error = %1.
.
MessageId=0x1B0E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_EXCEPTION_SETTING_DWORD_DEPRECATED
Language=English
*Obsolete* Exception setting custom email data.
.
MessageId=0x1B0F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_EXCEPTION_SENDMAIL_DEPRECATED
Language=English
*Obsolete* An exception occurred sending a email.
.
MessageId=0x1B10
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_FAILED_MESSAGE_DEPRECATED_
Language=English
*Obsolete* Message %1!lu! Firm ID %2!lu! '%3!ls!' failed to process:  %4.
.
MessageId=0x1B11
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_SSW
Language=English
Failed to issue a warning for email with subject '%1!ls!', error %2.
.
MessageId=0x1B12
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_FAILURE_MODE_ALLOW
Language=English
Applying failure mode: The email was allowed to go. Subject '%1!ls!'.
.
MessageId=0x1B13
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_POPULATE_WGNEVENT_FAILED
Language=English
Failed to create and populate the Wigan event for email with subject '%1!ls!', error %2.
.
MessageId=0x1B14
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_SSWARNING_OVER_80PERCENT
Language=English
The number of pending warned emails has exceeded 80%% of the maximum allowed by configuration (MaxPendingWarnings=%1!lu!).
Emails already pending will start heeding their warning automatically if the maximum is reached.
.
MessageId=0x1B15
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SMTPSINK_LOG_SSWARNING_OVERFLOW
Language=English
The number of pending warned emails has exceeded the maximum allowed by configuration (MaxPendingWarnings=%1!lu!).
Emails already pending have started heeding their warning automatically.
.
MessageId=0x1B16
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_READ_CONFIG
Language=English
Failed to read the configuration, error %1.
.
MessageId=0x1B17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_OPEN_REGISTRY_KEY_DEPRECATED
Language=English
*Obsolete* Failed to open registry key %1\\%2, error %3.
.
MessageId=0x1B18
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_OPEN_REGISTRY_KEY_AND_FAIL_DEPRECATED_
Language=English
*Obsolete* Failed to open registry key '%1', error %2.
.
MessageId=0x1B19
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_CREATE_NEW_REGISTRY_PARAMETERS_OBJECT_DEPRECATED_
Language=English
*Obsolete* Failed to create a new registry parameters object, error %1. The new registry parameters have not been applied.
.
MessageId=0x1B20
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_DETERMINE_SMTP_DNS_HOSTNAME_DEPRECATED_
Language=English
*Obsolete* Failed to determine SMTP DNS host name, error %1.
.
MessageId=0x1B21
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_POPULATE_LIST_OF_DNS_DOMAINS_DEPRECATED_
Language=English
*Obsolete* Failed to populate the list of DNS domains in the enterprise, error %1.
.
MessageId=0x1B22
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_ALLOCATE_BYTES_FOR_REGISTRY_DEPRECATED_
Language=English
*Obsolete* Failed to allocate %1!d! bytes for registry's '%2' value, error %3.
.
MessageId=0x1B23
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_CONVERT_REGISTRY_LIST_TO_UNICODE_DEPRECATED_
Language=English
*Obsolete* Failed to convert registry list entry '%1' to UNICODE, error %2.
.
MessageId=0x1B24
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_SENDER_INC_LIST_EMPTY_DEPRECATED_
Language=English
*Obsolete* The registry value '%1' is empty. All emails will be excluded.
.
MessageId=0x1B25
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_SENDER_INC_LIST_NOT_PRESENT_DEPRECATED_
Language=English
*Obsolete* The registry value '%1' is not present. All emails will be excluded. 
.
MessageId=0x1B26
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_REGISTRY_QUERY_FAILED_DEPRECATED_
Language=English
*Obsolete* Failed to query registry value '%1', error %2.
.
MessageId=0x1B27
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_REGISTRY_INVALID_VALUE_DEPRECATED_
Language=English
*Obsolete* The registry value '%1' is set to an invalid value.
.
MessageId=0x1B28
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_REGISTRY_READ_FAILED_DEPRECATED_
Language=English
*Obsolete* Failed to read the registry value '%1!ls!', error %2.
.
MessageId=0x1B29
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_GET_EMAIL_STORE
Language=English
Failed to query email event for email store interface, error %1. 
.
MessageId=0x1B2A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_CDO_MESSAGE
Language=English
Sending action email: failed to create a new CDO message, error %1.
.
MessageId=0x1B2B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_FAILURE_MODE_MARK_AND_ALLOW
Language=English
Applying failure mode: The email was marked and allowed to go. Subject '%1!ls!'.
.
MessageId=0x1B30
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_SAVE_EMAIL_CONTENTS
Language=English
Failed to save email contents to file '%1!ls!', error %2.
.
MessageId=0x1B31
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_SAVE_BYTES_OF_EMAIL_DEPRECATED_
Language=English
*Obsolete* Failed to save %1!lu! bytes of email to file '%2!ls!', error %3.
.
MessageId=0x1B32
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_HUB_NOT_INSTALLED
Language=English
Policy Engine Hub not installed.
.
MessageId=0x1B33
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_CREATE_HUB
Language=English
Failed to create Policy Engine Hub, error %1. Entering failure mode.
.
MessageId=0x1B34
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_GET_LOCAL_NAME
Language=English
Failed to retrieve local computer name, error %1. Entering failure mode.
.
MessageId=0x1B35
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_REGISTER_WITH_HUB
Language=English
Failed to register with Policy Engine Hub, error %1. Entering failure mode.
.
MessageId=0x1B36
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_CONNECTED_TO_HUB
Language=English
Successfully connected to the Policy Engine Hub.
.
MessageId=0x1B37
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_CONFIGURE_HUB
Language=English
Failed to configure the Policy Engine Hub, error %1. Entering failure mode.
.
MessageId=0x1B38
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_RETRIEVE_MESSAGE_STATUS
Language=English
Failed to retrieve message status, error %1.
.
MessageId=0x1B39
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_MAP_MAIL_CONTENTS_INTO_MEMORY
Language=English
Failed to map message contents into memory, error %1.
.
MessageId=0x1B3A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_BODY_FAILURE
Language=English
Sending action email: failed to get root Body Part interface for new message, error %1.
.
MessageId=0x1B3B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_ADD_BODY_PART
Language=English
Sending action email: failed to add Body Part to new message, error %1.
.
MessageId=0x1B3C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_GET_BODY_PART_DATASOURCE
Language=English
Sending action email: failed to get Data Source interface for original email, error %1.
.
MessageId=0x1B3D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_EMBED_MESSAGE
Language=English
Sending action email: failed to embed message, error %1.
.
MessageId=0x1B3E
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_LOG_ADD_SUBJECT
Language=English
Sending action email: error adding subject to message, error %1.
.
MessageId=0x1B3F
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_LOG_ADD_DSN_OPTION
Language=English
Sending action email: error setting DSN Option to 'Never', error %1.
.
MessageId=0x1B40
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_SKIPPING_MAIL_ALREADY_PROCESSED
Language=English
Skipping email already processed with subject '%1!ls!'.
.
MessageId=0x1B41
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_CANNOT_BE_PROCESSED_ASYNC
Language=English
SMTP On Message Submission event cannot be processed asynchronously.
.
MessageId=0x1B42
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_CREATE_EMAIL_CONTEXT
Language=English
Failed to create email context object, error %1.
.
MessageId=0x1B43
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_CREATE_CALLBACK
Language=English
Failed to create email callback object, error %1.
.
MessageId=0x1B44
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_CREATE_ADDITIONAL_INFO
Language=English
Failed to create email additional info object, error %1.
.
MessageId=0x1B45
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_PASS_EMAIL_TO_HUB
Language=English
Failed to pass email with subject '%1!ls!' to Policy Engine Hub, error %2. Retrying.
.
MessageId=0x1B46
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_GIVING_UP_EMAIL_NO_HUB
Language=English
Giving up on email with subject '%1!ls!' because the Policy Engine Hub won't start.
.
MessageId=0x1B47
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_GIVING_UP_EMAIL_HUB_ERROR
Language=English
Giving up on email with subject '%1!ls!' due to Policy Engine Hub error %2.
.
MessageId=0x1B48
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_CREATE_SYNC_OBJECT
Language=English
Initialization failure. Failed to create a synchronization event, error %1.
.
MessageId=0x1B49
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_CREATE_REG_PARAMS_OBJECT
Language=English
Initialization failure. Failed to create registry parameters object, error %1.
.
MessageId=0x1B4A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_BB_PROPERTY_COMMIT_DEPRECATED_
Language=English
*Obsolete* Committing email message properties to disk. Error = %1
.
MessageId=0x1B4C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_NOTIFY_MAIL_RESULT_DEPRECATED_
Language=English
*Obsolete* Mail Transport Notify Interface asynchronous notification failed. Message number %1!lu! from Sender Firm ID %2!lu!. Error = %3
.
MessageId=0x1B4D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_GET_MAIL_SIZE_DEPRECATED_
Language=English
*Obsolete* Error extracting email size. Message number %1!lu! from Sender Firm ID %2!lu!. Error = %3
.
MessageId=0x1B4E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_ADDRESS_TRANSLATE_ERR_DEPRECATED_
Language=English
*Obsolete* Converting email address to wide string. Message number %1!lu! from Sender Firm ID %2!lu!. Error = %3
.
MessageId=0x1B4F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_GET_RECIPIENT_DEPRECATED_
Language=English
*Obsolete* Get recipient address failed. Message number %1!lu! from Sender Firm ID %2!lu!. Error = %3
.
MessageId=0x1B50
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_STARTED
Language=English
SMTP Sink started in %1 mode.
.
MessageId=0x1B51
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_STOPPED
Language=English
SMTP Sink stopped.
.
MessageId=0x1B52
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_SUBMIT_AN_ACTION_MAIL
Language=English
Action on email with subject '%1!ls!' - Failed to submit an email to send to '%2!ls!', subject '%3!ls!', error %4.
.
MessageId=0x1B53
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_NOTIFICATION_EMAIL_IS_EMPTY
Language=English
Action on email with subject '%1!ls!' - A notification email sent to '%2!ls!' is empty.
.
MessageId=0x1B54
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_TO_BUILD_ACTION_EMAIL
Language=English
Action on email with subject '%1!ls!' - Failed to build an email to send to '%2!ls!', subject '%3!ls!', error %4.
.
MessageId=0x1B55
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_GET_RECIPIENT_COUNT_DEPRECATED_
Language=English
*Obsolete* Get recipient address count failed. Message number %1!lu! from Sender Firm ID %2!lu!. Error = %3
.
MessageId=0x1B56
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_PRIMARY_P1_SIZE_TOO_BIG
Language=English
The SMTP Mail Primary Recipient Size is too big for the message length.
.
MessageId=0x1B57
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_SECONDARY_MIME_SIZE_TOO_BIG
Language=English
The SMTP Mail Secondary Mime Size is too big for the remaining message length.
.
MessageId=0x1B58
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_SMTPMAIL_NOT_ASYNC
Language=English
The asynchronous header flag must be set on SMTP Mail messages.
.
MessageId=0x1B59
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FAILED_TO_SEND_TO_DISTRIBUTOR_DEPRECATED_
Language=English
*Obsolete* Failed to send email with subject '%1!ls!' to the distributor, error %2.
.
MessageId=0x1B5A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_THROTTLE_WAIT_DEPRECATED_
Language=English
*Obsolete* Throttle wait failed Thread id '%1!lu!', error %2.
.
MessageId=0x1B5B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_ADD_MSGMAP_EXIST_DEPRECATED_
Language=English
*Obsolete* Attempted to add Message '%1!lu!' to map, but it is already present.
.
MessageId=0x1B5E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_SET_CUSTOM_DWORD_DEPRECATED_
Language=English
*Obsolete* Failure setting custom email data. Message number %1!lu! from Sender Firm ID %2!lu!. Error = %3
.
MessageId=0x1B5F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_SET_SS_STATUS_DEPRECATED_
Language=English
*Obsolete* Failure setting SS status. Message number %1!lu! from Sender Firm ID %2!lu!. Error = %3
.
MessageId=0x1B60
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_SMTPMAPPER_FIRM_ID_REG_KEY_DEPRECATED_
Language=English
*Obsolete* The SMTP Sink has failed to read the Firm ID map filename from the registry.
.
MessageId=0x1B61
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_SMTPMAPPER_DUPLICATE_FIRM_ID_DEPRECATED_
Language=English
*Obsolete* The Distributor Agent Firm ID file contains duplicate entries for Firm ID.
.
MessageId=0x1B62
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_SMTPMAPPER_DUPLICATE_FIRM_ID_DEPRECATED_
Language=English
*Obsolete* The Distributor Agent Firm ID file contains duplicate entries for Firm ID %1.
.
MessageId=0x1B63
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_NO_SMTPFIRMID_MAPPING_DEPRECATED_
Language=English
*Obsolete* No hostname mapping for Firm ID %1.
.
MessageId=0x1B64
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_NO_SMTPFIRMID_MAPPING_DEPRECATED_
Language=English
*Obsolete* No hostname mapping for Firm ID %1.
.
MessageId=0x1B65
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_MAIL_TIMED_OUT_DEPRECATED_
Language=English
*Obsolete* Message timed out.
.
MessageId=0x1B66
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_MAIL_TIMED_OUT_DEPRECATED_
Language=English
*Obsolete* Message timed out - Message number %1!lu! from Sender Firm ID %2!lu!.
.
MessageId=0x1B67
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_CDO_MESSAGE_DEPRECATED_
Language=English
*Obsolete* Send Mail failed to create a new CDO message. Message number %1!lu! from Sender Firm ID %2!lu! Subject %3!ls!. Error = %4
.
MessageId=0x1B68
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_BODY_FAILURE_DEPRECATED_
Language=English
*Obsolete* Send Mail failed to get root Body Part Interface for new message. Message number %1!lu! from Sender Firm ID %2!lu! Subject %3!ls!. Error = %4
.
MessageId=0x1B69
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_ADD_BODY_PART_DEPRECATED_
Language=English
*Obsolete* Send Mail failed to add Body Part to new message. Message number %1!lu! from Sender Firm ID %2!lu! Subject %3!ls!. Error = %4
.
MessageId=0x1B6A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_GET_BODY_PART_DATASOURCE_DEPRECATED_
Language=English
*Obsolete* Send Mail Failed to get Data Source Interface for original email. Message number %1!lu! from Sender Firm ID %2!lu! Subject %3!ls!. Error = %4
.
MessageId=0x1B6B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DSM_FILE_DEPRECATED_
Language=English
*Obsolete* Failed to write DSM file. Message number %1!lu! from Sender Firm ID %2!lu!. Error = %3
.
MessageId=0x1B6C
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_BB_LOG_ADD_SUBJECT_DEPRECATED_
Language=English
*Obsolete* Send Mail add subject to message. Message number %1!lu! from Sender Firm ID %2!lu! Subject %3!ls!. Error = %4
.
MessageId=0x1B6D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_EMBED_MESSAGE_DEPRECATED_
Language=English
*Obsolete* Send Mail Failed to embed message. Message number %1!lu! from Sender Firm ID %2!lu! Subject %3!ls!. Error = %4
.
MessageId=0x1B6E
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_BB_LOG_ADD_DNS_OPTION_DEPRECATED_
Language=English
*Obsolete* Setting DSN Never Option. Message number %1!lu! from Sender Firm ID %2!lu!. Subject %3!ls!. Error = %4
.
MessageId=0x1B6F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_FAILED_TO_SEND_FIRM_ID_DEPRECATED_
Language=English
*Obsolete* Failed to send email with subject '%1!ls!' to the distributor, no Firm ID found for sender %2.
.
MessageId=0x1B70
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_THROTTLE_TIMED_OUT_DEPRECATED_
Language=English
*Obsolete* Messaging throttle time out - Message from Sender Firm ID %1!lu!.
.
MessageId=0x1B71
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_NOTIFY_CALLED_REPEATEDLY_DEPRECATED_
Language=English
*Obsolete* Message number %1!lu! from Sender Firm ID %2!lu! attempted to call back into Sink more than once. 
.
MessageId=0x1B72
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED_INITIALISE
Language=English
Failed to initialize due to error %1.
.
MessageId=0x1B73
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_READING_CONFIGURATION
Language=English
Reading the configuration parameters following the detection of a potential change.
.
MessageId=0x1B74
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_INTEGRATION_STAYING_OFF
Language=English
Integration is currently disabled.
.
MessageId=0x1B75
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_ENABLING_INTEGRATION
Language=English
Integration has been enabled.
.
MessageId=0x1B76
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_DISABLING_INTEGRATION
Language=English
Integration has been disabled.
.
MessageId=0x1B77
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_INVALID_CONFIGURATION_STAYING_OFF
Language=English
The configuration is invalid. Integration is staying disabled.
.
MessageId=0x1B78
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_INVALID_CONFIGURATION_STAYING_ON
Language=English
The new configuration is invalid and has been discarded. Integration is staying enabled with the previous configuration.
.
MessageId=0x1B79
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_CHANGED_CONFIGURATION_STAYING_ON
Language=English
The configuration has changed. Integration is staying enabled and is now using this new configuration.
.
MessageId=0x1B7A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_USING_DEFAULT_REGISTRY_SETTING_VALUE_2S
Language=English
The registry setting '%1' is not set. Using its default value %2!ls!.
.
MessageId=0x1B7B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_WRONG_REGISTRY_SETTING_FOR_OPERATION_MODE_2S
Language=English
The registry setting '%1' should not exist for the operation mode %2!ls!. This is invalid.
.
MessageId=0x1B7C
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SMTPSINK_LOG_CHANGED_REGISTRY_SETTING_NEEDS_IIS_RESTART
Language=English
The changed value of the registry setting '%1' will not be picked up until IIS is restarted.
.
MessageId=0x1B7D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_PROGRESS_COUNTERS_5S
Language=English
Progress Summary: Processed %1. Captured %2. Excluded %3. Failed %4. Interactive warn pending %5.
.
MessageId=0x1B7E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_CAPTURED
Language=English
Captured. Message: '%1!ls!'.
.
MessageId=0x1B7F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_EXCLUDED
Language=English
Excluded. Message: '%1!ls!'. Reason: %2.
.
MessageId=0x1B80
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_FAILED
Language=English
Failed. Message: '%1!ls!'. Reason: %2.
.
MessageId=0x1B81
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPSINK_LOG_DOMAIN_MAPPING_CONFLICTING_DOMAIN_3S
Language=English
Domain Mapping: Conflict: The domain '%1' in '%2' is already defined in '%3'.
.
MessageId=0x1B82
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPSINK_LOG_DOMAIN_MAPPING_SENDER_NOT_FOUND_S
Language=English
Domain Mapping: The sender email address '%1' does not map to a domain.
.

MessageId=0x1BFF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BB_LOG_DEBUG_MESSAGE_DEPRECATED_
Language=English
*Obsolete* DEBUG - Message Number %1!lu!: %2  %3.
.

;
; //SMTP Utilities Codes 0x1C00 to 0x1CFF
;

MessageId=0x1C00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_NOT_INIT
Language=English
SMTP Utility Library not initialized.
.
MessageId=0x1C01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_ALREADY_ACTIVE
Language=English
SMTP Utility Library already active.
.
MessageId=0x1C02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_INITIALIZING
Language=English
SMTP Utility Library is already in initialization.
.
MessageId=0x1C03
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_TERMININATING_DEPRECATED_
Language=English
*Obsolete* SMTP Utility Library currently closing down.
.
MessageId=0x1C04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_TERMINATED_DEPRECATED_
Language=English
*Obsolete* SMTP Utility Library has shut down.
.
MessageId=0x1C05
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_INIT_FAILED
Language=English
SMTP Utility Library initialization failed.
.
MessageId=0x1C06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_FAILED_TO_GET_MODULE_FILENAME_DEPRECATED_
Language=English
*Obsolete* Initialization failure. Failed to get module filename, error %1. 
.
MessageId=0x1C07
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_FOLDER_TOO_DEEP_DEPRECATED_
Language=English
*Obsolete* Initialization failure. Installation folder too deep, error %1. 
.
MessageId=0x1C08
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_FAILED_TO_LOAD_REDEMPTION_DEPRECATED_
Language=English
*Obsolete* Initialization failure. Failed to load redemption.dll, error %1. 
.
MessageId=0x1C09
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_PATH_HAS_NO_BACKSLASH_DEPRECATED_
Language=English
*Obsolete* Initialization failure. Module pathname '%1' has no backslash char, error %2.
.
MessageId=0x1C10
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_FAILED_TO_GET_REDEMPTION_ENTRYPOINT_DEPRECATED_
Language=English
*Obsolete* Initialization failure. Failed to get entry point address for HrRFC822MessageToIMessage, error %1. 
.
MessageId=0x1C11
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_FAILED_TO_CREATE_WGNIMPORTIMESSAGE_DEPRECATED_
Language=English
*Obsolete* Initialization failure. Failed to CoCreate WgnImportIMessage, error %1. 
.
MessageId=0x1C12
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_FAILED_TO_CREATE_ARRAY_OF_SYNC_DEPRECATED_
Language=English
*Obsolete* Initialization failure. Failed to allocate an array of %1!lu! synchronisation events, error %2.
.
MessageId=0x1C13
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_INIT_FAILED_TO_CREATE_SYNC_OBJECT_DEPRECATED_
Language=English
*Obsolete* Initialization failure. Failed to create a synchronisation event, error %1. 
.
MessageId=0x1C14
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_LOADING_REDEMPTION_DEPRECATED_
Language=English
*Obsolete* Initialization failure. Module pathname '%1' has no backslash char, error %2.
.
MessageId=0x1C15
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_INIT_FAILED_TO_CREATE_SEMAPHORE_DEPRECATED_
Language=English
*Obsolete* Initialization failure. Failed to create a semaphore, error %1. 
.
MessageId=0x1C16
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_INIT_FAILED_TO_CREATE_WORK_QUEUE_OBJECT_DEPRECATED_
Language=English
*Obsolete* Initialization failure. Failed to create work queue object, error %1. 
.
MessageId=0x1C17
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPUTIL_STARTED_DEPRECATED_
Language=English
*Obsolete* SMTP Utilities successfully initialized.
.
MessageId=0x1C18
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SMTPUTIL_STOPPED_DEPRECATED_
Language=English
*Obsolete* SMTP Utilities successfully terminated.
.
MessageId=0x1C19
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_FAILED_TO_CREATE_CDO_MESSAGE_DEPRECATED_
Language=English
*Obsolete* Failed to create a CDO message object, error %1.
.
MessageId=0x1C20
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_FAILED_TO_EXTRACT_FROM_REDEMPTION_DEPRECATED_
Language=English
*Obsolete* Failed to extract email contents via Redemption, error %1.
.
MessageId=0x1C21
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_INVALID_PARAMETER_DEPRECATED_
Language=English
*Obsolete* Smtp Utility EMail To WgnEvent invalid parameter %1.
.
MessageId=0x1C22
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_FAILED_TO_CREATE_MAPI_MESSAGE_DEPRECATED_
Language=English
*Obsolete* Failed to create a MAPI message object, error %1.
.
MessageId=0x1C23
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_FAILED_TO_PROCESS_TNEF_DEPRECATED_
Language=English
*Obsolete* Failed to process TNEF data within an email, error %1.
.
MessageId=0x1C24
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_FAILED_TO_CREATE_WGN_EVENT_DEPRECATED_
Language=English
*Obsolete* Failed to create a WgnEvent object, error %1. 
.
MessageId=0x1C25
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_FAILED_TO_GET_DATE_FROM_ENVELOPE_DEPRECATED_
Language=English
*Obsolete* Failed to retrieve the email date from the envelope information, error %1. 
.
MessageId=0x1C26
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_FAILED_TO_SET_TIMESTAMP_DEPRECATED_
Language=English
*Obsolete* Failed to set the timestamp on the email event, error %1. 
.
MessageId=0x1C27
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_FAILED_TO_EXTRACT_FROM_REDEMPTION_EXCEPTION_DEPRECATED_
Language=English
*Obsolete* Failed to extract email contents via Redemption, exception %1.
.
MessageId=0x1C28
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_FAILED_TO_RETRIEVE_ENVELOPE_DEPRECATED_
Language=English
*Obsolete* Failed to retrieve the email envelope information, error %1. 
.
MessageId=0x1C30
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_OPENING_MAPI_SESSION_DEPRECATED_
Language=English
*Obsolete* Failed to open a MAPI message session, error %1. 
.
MessageId=0x1C31
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_MAPI_MEMORY_ALLOCATOR_DEPRECATED_
Language=English
*Obsolete* Failed to obtain the address of the MAPI memory allocation function, error %1. 
.
MessageId=0x1C32
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_SMTPUTIL_MAPI_INITIALIZATION_DEPRECATED_
Language=English
*Obsolete* Failed to initialize MAPI, error %1. 
.
MessageId=0x1C33
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_NO_COMBO_STREAM_DEPRECATED_
Language=English
*Obsolete* Interface IWgnComboStream not loaded. 
.
MessageId=0x1C34
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_LOAD_COMBO_STREAM_DEPRECATED_
Language=English
*Obsolete* Error loading Interface IWgnComboStream - %1
.
MessageId=0x1C35
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_SETTING_PAGE_THRESHOLD_DEPRECATED_
Language=English
*Obsolete* Error setting Combo Stream Paging Threshold - %1
.
MessageId=0x1C36
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_CREATE_DOCFILE_DEPRECATED_
Language=English
*Obsolete* Creating Storage Document file on ILockBytes - %1
.
MessageId=0x1C37
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_OPEN_DOCFILE_IMSG_DEPRECATED_
Language=English
*Obsolete* Error on OpenIMsgOnIStg - %1
.
MessageId=0x1C38
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_LOCKBYTE_STREAM_DEPRECATED_
Language=English
*Obsolete* Error on Lock Bytes Query Stream Interface - %1
.
MessageId=0x1C39
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMTPUTIL_MAPI_INITIALIZATION_FAILED
Language=English
Failed to initialize MAPI for the SMTP Utility library.
.
MessageId=0x1C3A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_SMTPUTIL_MAPI_INITIALIZATION_FAILED
Language=English
Failed to initialize MAPI for the SMTP Utility library. Initialization was otherwise successful.
.

;
;// MIME Processor status codes
;//  Although currently part of the SMTP Utility library, this will eventually be its own component.
;//  In prevision of this, all the status codes are in a section of their own.
;
MessageId=0x1C80
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MIMEPP_ERROR
Language=English
The Hunny Software MIME++ toolkit failed to initialize.
.
MessageId=0x1C81
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICU_ERROR
Language=English
The International Components for Unicode library is not available, maybe because it is not installed properly.
.
;
;// MIME Processor status codes - Invalid MIME codes.
;//  WGN_E_INVALID_MIME is the generic reporting code.
;//  WGN_E_INVALID_MIME_XXX are specific codes.
;
MessageId=0x1C90
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_MIME
Language=English
Invalid MIME format or content.
.
MessageId=0x1C91
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_MIME_MAILBOX
Language=English
Invalid MIME format or content: a mailbox address is invalid (local or domain part missing).
.
MessageId=0x1C92
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_MIME_MULTIPART_NO_PART
Language=English
Invalid MIME format or content: multipart media type with zero parts.
.
MessageId=0x1C93
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_MIME_MESSAGE_RFC822
Language=English
Invalid MIME format or content: no actual message detected in a message/rfc822 body part.
.
MessageId=0x1C94
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_MIME_MULTIPART_SIGNED
Language=English
Invalid MIME format or content in a multipart/signed entity.
.
MessageId=0x1C95
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_MIME_UNKNOWN_ENCODING
Language=English
Invalid MIME format or content: unknown content-transfer-encoding.
.
MessageId=0x1C96
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_MIME_INVALID_ENCODING
Language=English
Invalid MIME format or content: invalid content-transfer-encoding for a media type.
.
MessageId=0x1C97
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_MIME_DECODING_ERROR
Language=English
Invalid MIME format or content: error during decoding (content-transfer-encoding) because data may be invalid or corrupted.
.
MessageId=0x1C98
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_MIME_RAW_BODY_FROM_DECODING_ERROR
Language=English
Invalid MIME format or content: the MIME data stream for the email's body failed to be decoded. It is stored raw (encoded).
.
MessageId=0x1C99
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_MIME_RAW_ATTACH_FROM_DECODING_ERROR
Language=English
Invalid MIME format or content: the MIME data stream for the attachment failed to be decoded. It is stored raw (encoded).
.
;
;// MIME Processor status codes - Unsupported MIME codes.
;//  WGN_E_UNSUPPORTED_MIME is the generic reporting code.
;//  WGN_E_UNSUPPORTED_MIME_XXX are specific codes.
;
MessageId=0x1CA0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNSUPPORTED_MIME
Language=English
Unsupported MIME media type or syntax.
.
MessageId=0x1CA1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNSUPPORTED_MIME_MESSAGE_PARTIAL_EXTERNAL_BODY
Language=English
Unsupported MIME media type or syntax: message/partial and message/external-body are not supported.
.
;
;// MIME Processor status codes - TNEF error codes.
;//  WGN_E_TNEF_ERROR is the generic reporting code.
;//  WGN_E_TNEF_ERROR_XXX are specific codes.
;
MessageId=0x1CB0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TNEF_ERROR
Language=English
TNEF emails: Invalid TNEF data or error while processing it.
.
MessageId=0x1CB1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TNEF_ERROR_READING_DATA
Language=English
TNEF emails: could not successfully read and/or decode the TNEF data.
.
MessageId=0x1CB2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TNEF_ERROR_EXTRACTING_PROPS
Language=English
TNEF emails: failed to extract properties from the TNEF data. The data might be corrupted.
.
MessageId=0x1CB3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TNEF_ERROR_RAW_TNEF_FROM_DECODING_ERROR
Language=English
TNEF emails: the MIME data stream containing the TNEF data failed to be decoded. It is stored raw (encoded).
.

;
; // Quarantine Manager Codes 0x1D00 to 0x1DFF
;

MessageId=0x1D00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_NO_EMAIL_CONFIG_LOG
Language=English
No email id or email server has been configured. The Quarantine Manager on machine %1 will not be able to resend messages.
.
MessageId=0x1D01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_FAILED_LOGON_LOG
Language=English
The Quarantine Manager on machine %3 could not access the email server %1 using the supplied configuration information. The error returned was %2.
.
MessageId=0x1D02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_EMAIL_SERVER_UNAVAILABLE_LOG
Language=English
The Quarantine Manager on machine %3 could not access the email server %1 as it is unavailable. The error returned was %2.
.
MessageId=0x1D03
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_SENDFAILURE_LOG
Language=English
The Quarantine Manager on machine %3 could not submit message with ID %1. The error returned was %2. Submission of the message will be retried later.
.
MessageId=0x1D04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_MSG_BLOCKED_LOG
Language=English
The Quarantine Manager on machine %3 could not submit message with ID %1 after %2 attempts. The message will not be resubmitted.
.
MessageId=0x1D05
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_QMGR_MSG_SUBMITTED_LOG
Language=English
The Quarantine Manager on machine %2 successfully submitted message with ID %1 after a previous failure.
.
MessageId=0x1D06
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_QMGR_ACTIVE_LOG
Language=English
The Quarantine Manager on machine %1 is now active.
.
MessageId=0x1D07
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_CMS_LOGON_FAILURE_LOG
Language=English
The Quarantine Manager could not log in to CMS %1. The error returned was %2.
.
MessageId=0x1D09
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_QMGR_CMS_CONNECTED_LOG
Language=English
The Quarantine Manager on machine %2 has connected to CMS %1.
.
MessageId=0x1D0a
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_QMGR_CMS_DISCONNECTED_LOG
Language=English
The Quarantine Manager has lost contact with CMS %1.
.
MessageId=0x1D0b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_MSG_INVALID_LOG
Language=English
The message with ID %1 is incomplete/invalid and the Quarantine Manager on machine %2 cannot send this message. The message will not be resubmitted.
.
MessageId=0x1D0c
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_QMGR_EMAIL_SERVER_AVAILABLE_LOG
Language=English
The Quarantine Manager on machine %2 successfully accessed the email server %1.
.
MessageId=0x1D0d
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_SENDFAILURE_ACCESS_DENIED_LOG
Language=English
The Quarantine Manager on machine %2 could not submit message with ID %1 as it does not have permission to do so. Submission of the message will be retried later.
.
MessageId=0x1D0e
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_DATABASE_ERROR_LOG
Language=English
The Quarantine Manager on machine %2 encountered an error when querying the database. The error returned was %1.
.
MessageId=0x1D0f
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_QMGR_CMS_CONNECTING_LOG
Language=English
The Quarantine Manager is attempting to connect to CMS %1.
.
MessageId=0x1D10
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_CMS_REGISTRATION_FAILURE_LOG
Language=English
The Quarantine Manager on machine %3 could not register with the CMS %1. The error returned was %2.
.
MessageId=0x1D11
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_CMS_CONNECTION_FAILURE_LOG
Language=English
The Quarantine Manager on machine %3 failed to connect to the CMS %1. The error returned was %2.
.
MessageId=0x1D12
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_CMS_INSUFFICIENT_PRIVILEGES_LOG
Language=English
The Quarantine Manager on machine %2 does not have enough privileges to use the CMS %1.
.
MessageId=0x1D13
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_FAILED_TO_GET_HELPER_LOG
Language=English
The Quarantine Manager on machine %1 failed to get the IWgnEMailHelper
.
MessageId=0x1D14
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_NOTES_NOT_INSTALLED_LOG
Language=English
The Quarantine Manager on machine %1 cannot send Lotus Notes emails because Lotus Notes is not installed.
.
MessageId=0x1D15
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_MAPI_NOT_INSTALLED_LOG
Language=English
The Quarantine Manager on machine %1 cannot send MAPI emails because Microsoft Outlook is not installed.
.
MessageId=0x1D16
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_QMGR_NO_CONFIGURATION_LOG
Language=English
The Quarantine Manager on machine %1 will not be started because it has not been configured.
.
MessageId=0x1D17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_NO_NOTES_CONFIG_LOG
Language=English
The Quarantine Manager on machine %1 cannot send Lotus Notes emails because no mailbox information has been configured.
.
MessageId=0x1D18
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_NO_MAPI_CONFIG_LOG
Language=English
The Quarantine Manager on machine %1 cannot send MAPI emails because no mailbox information has been configured.
.
MessageId=0x1D19
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_NO_EMAIL_CONFIG
Language=English
No email id or email server has been configured.
.
MessageId=0x1D1A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_EMAIL_SERVER_UNAVAILABLE
Language=English
The email server is unavailable.
.
MessageId=0x1D1B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_CMS_INSUFFICIENT_PRIVILEGES
Language=English
The Quarantine Manager CMS session has insufficient privileges.
.
MessageId=0x1D1C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_NOTES_NOT_INSTALLED
Language=English
Lotus Notes Client is not installed.
.
MessageId=0x1D1D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_MAPI_NOT_INSTALLED
Language=English
Microsoft Outlook is not installed.
.
MessageId=0x1D1E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_NO_NOTES_CONFIG
Language=English
No Lotus Notes mailbox information has been configured.
.
MessageId=0x1D1F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_NO_MAPI_CONFIG
Language=English
No MAPI mailbox information has been configured.
.
MessageId=0x1D20
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_MOVETOBCC_ACTION
Language=English
Move recipients to BCC has failed.
.
MessageId=0x1D21
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_NO_SMTP_CONFIG_LOG
Language=English
The Quarantine Manager on machine %1 cannot send Internet emails because no SMTP server information has been configured.
.
MessageId=0x1D22
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_QMGR_NO_SMTP_CONFIG
Language=English
No SMTP server information has been configured.
.
; /////////////////////////////////////////////////
; // *** UNIVERSAL ADAPTER ***
; //
; // Universal Adapter Log Codes 0x1E00 to 0x1EFF
;
MessageId=0x1E00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLIST_ALLOC_MEMORY
Language=English
Error allocating %1!lu! bytes for %2 - %3
.
MessageId=0x1E01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLIST_MODIFY_RECIPIENTS
Language=English
Error adding recipients to an email recipient table - %1
.
MessageId=0x1E03
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLIST_GET_ADDRESS_DATA
Language=English
Error extracting recipient table - %1
.
MessageId=0x1E04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLIST_MODIFY_DLIST
Language=English
Error adding distribution list members to the email address list - %1
.
MessageId=0x1E05
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLIST_GET_RECIPIENT_TABLE
Language=English
Error accessing recipient table - %1
.
MessageId=0x1E06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLIST_QUERY_ROWS
Language=English
Error querying recipient table rows - %1
.
MessageId=0x1E07
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLIST_SETDIRATTRIBS
Language=English
Error setting directory attributes - %1
.
MessageId=0x1E08
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLIST_GET_OBJECT_ATTRIBUTES
Language=English
%1 error getting object attributes for %2!ls! - %3
.
MessageId=0x1E09
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLIST_SEARCH_FOR_OBJECTS
Language=English
%1 error searching for %2!ls! object %3!ls! - %4
.
MessageId=0x1E0A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLIST_SEARCH_FOR_OBJECTS_ALT
Language=English
%1 error search alternate for %2!ls! object %3!ls! - %4
.
MessageId=0x1E0B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLIST_UNSUPPORTED_DIRTYPE
Language=English
Unsupported Directory Type %1!d!
.
MessageId=0x1E0C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLOOK_ADDRESS_NOT_EXPANDED
Language=English
Expecting SMTP address.  Cannot expand %1:%2!ls!
.
MessageId=0x1E0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLIST_DELETE_RECIPIENTS
Language=English
Error deleting old email recipient table rows - %1
.
MessageId=0x1E0F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_STARTED
Language=English
The Universal Adapter has started.
.
MessageId=0x1E10
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_STOPPED
Language=English
The Universal Adapter has stopped.
.
MessageId=0x1E11
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_PROCESSING_MAILBOX
Language=English
The Universal Adapter has started processing mailbox "%1!ls!".
.
MessageId=0x1E12
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_PROCESSING_MAILBOX_STOPPED
Language=English
The Universal Adapter has stopped processing mailbox "%1!ls!".
.
MessageId=0x1E13
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_UAMAILBOX_OPEN_FAILED
Language=English
The Universal Adapter could not access the configured UA mailbox (username: %1!ls!, server: %2!ls!). The error returned was %3.
.
MessageId=0x1E15
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_PROFILE_FAILED
Language=English
The Universal Adapter could not create a MAPI profile to access the UA mailbox (username: %1!ls!, server: %2!ls!). The error returned was %3.
.
MessageId=0x1E16
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_INIT_DLOOK_FAILED
Language=English
The Universal Adapter could not initialize the DirectoryLookup component. The error returned was %1.
.
MessageId=0x1E17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_INIT_DDUP_FAILED
Language=English
The Universal Adapter could not initialize the 'De-duplication' database component. The error returned was %1.
.
MessageId=0x1E18
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_MESSAGE_SUCCESSFULLY_PROCESSED
Language=English
The message "%1!ls!" from mailbox "%2!ls!" was successfully processed.
.
MessageId=0x1E19
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_MESSAGE_ADD_TO_FAILED_QUEUE
Language=English
The message "%1!ls!" from mailbox "%2!ls!" has failed, and will be retried.
.
MessageId=0x1E1A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_CONNECT_SUCCEED
Language=English
Connected to mailbox "%1!ls!".
.
MessageId=0x1E1C
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_OUTPUT_FAIL
Language=English
Failed to output message to "%1!ls!". The error returned was %2.
.
MessageId=0x1E1E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_MOVE_TO_FAILED_FOLDER_UNRECOVERABLE_ERROR
Language=English
Moving message "%1!ls!" from mailbox "%2!ls!" to the failed folder due to an unrecoverable error.
.
MessageId=0x1E1F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_MOVE_TO_FAILED_FOLDER
Language=English
The message "%1!ls!" from mailbox "%2!ls!" has been moved to the failed folder.
.
MessageId=0x1E20
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_FAILED_MOVE_TO_FAILED_FOLDER
Language=English
The message "%1!ls!" from mailbox "%2!ls!" could not be moved to the failed folder: The error returned was %3.
.
MessageId=0x1E23
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_MESSAGE_FILTERED
Language=English
NoteID 0x%1!x!: Filtered message "%2!ls!" from mailbox "%3!ls!".
.
MessageId=0x1E24
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_MESSAGE_DUPLICATE
Language=English
Duplicated message "%1!ls!" from mailbox "%2!ls!".
.
MessageId=0x1E25
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_OPENING_REGISTRY_KEY
Language=English
Failed to open registry key "%1\%2" - "%3".
.
MessageId=0x1E26
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_INITIALIZE_PERFMON
Language=English
Failed to initialize Perfmon Total counter - "%1".
.
MessageId=0x1E27
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_INITIALIZE_APP_FAILED
Language=English
Failed to initialize the application - error was "%1".
.
MessageId=0x1E28
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_PROCESSING_MAILBOX_STOPPED_WILL_RETRY
Language=English
The Universal Adapter has stopped processing mailbox "%1!ls!" - will reconnect in %2!lu! seconds
.
MessageId=0x1E29
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_CREATING_PST_PROFILE
Language=English
Error creating PST Profile "%1!ls!" "%2!ls!" "%3!ls!" - %4
.
MessageId=0x1E30
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_FAILED_TO_CHANGE_WORKER_THREAD_COUNT
Language=English
Failed to change the worker thread count from %1!lu! to %2!lu! - keeping at %3!lu!. The error returned was %4
.
MessageId=0x1E32
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_CHANGED_WORKER_THREAD_COUNT
Language=English
Changed the worker thread count from %1!lu! to %2!lu!
.
MessageId=0x1E33
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_CHANGED_LOG_LEVEL
Language=English
Changed the log level from %1!lu! to %2!lu!
.
MessageId=0x1E35
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_FAILED_TO_DELETE_MESSAGE
Language=English
NoteID 0x%1!x!: The Universal Adapter failed to delete the message "%2!ls!" from mailbox "%3!ls!". The error returned was %4. The message will be deleted later.
.
MessageId=0x1E36
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_SUCCESSFULLY_DELETED_MESSAGE
Language=English
NoteID 0x%1!x!: The Universal Adapter failed has successfully deleted the message "%2!ls!" from mailbox "%3!ls!" after a previous failure.
.
MessageId=0x1E37
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_CANNOT_OPEN_MESSAGE
Language=English
The Universal Adapter could not open a message from mailbox "%1!ls!". The error returned was %2.
.
MessageId=0x1E38
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_ID_PROPERTY_NOT_FOUND
Language=English
The Universal Adapter could not access the property "0x%1!x!" on the message "%2!ls!" in mailbox "%3!ls!". The error returned was %4.
.
MessageId=0x1E39
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_CANNNOT_WRITE_ID_PROPERTY
Language=English
The Universal Adapter could not write the unique ID property "%1!ls!" on the message "%2!ls!" in mailbox "%3!ls!". The error returned was %4.
.
MessageId=0x1E3A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_CHANGED_LOG_MAX_SIZE
Language=English
The maximum log size has changed from %1!lu! to %2!lu!.
.
MessageId=0x1E3B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_CHANGED_LOG_MAX_COUNT
Language=English
The maximum log count has changed from %1!lu! to %2!lu!.
.
MessageId=0x1E3C
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_CHANGED_LOG_LIMIT_FAILURE
Language=English
The UA was unable to change the log size/count values. The error returned was %1.
.
MessageId=0x1E3D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_NO_DDUP
Language=English
The input mailbox "%1!ls!" has been configured to use 'De-duplication' but no 'De-duplication' object is available.
.
MessageId=0x1E3E
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_NO_DSN
Language=English
No 'De-duplication' database specified. De-duplication will not be available.
.
MessageId=0x1E3F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_USING_DSN
Language=English
The Universal Adapter has been configured to use the server "%1!ls!" as the 'De-duplication' database.
.
MessageId=0x1E40
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_REG_UPDATE_SUCCESS
Language=English
The Universal Adapter has successfully updated its configuration.
.
MessageId=0x1E41
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_REG_UPDATE_FAILED
Language=English
The Universal Adapter has failed to update its configuration.
.
MessageId=0x1E42
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_SQL_ERROR
Language=English
The De-duplication component detected a database error - State %1 (Code %2!u!) - %3.
.
MessageId=0x1E43
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLIST_EXCH55_ADDRESS
Language=English
An error occurred converting an email address from DN to Exchange 5.5 format (%1!ls!) - %2.
.
MessageId=0x1E44
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLIST_EXCHDN_ADDRESS
Language=English
An error occurred converting an email address from Exchange 5.5 to DN format (%1!ls!) - %2.
.
MessageId=0x1E45
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_FAILEDMESSAGE_ON_SHUTDOWN
Language=English
The Universal Adapter failed to completely process the message "%1!ls!" from mailbox "%2!ls!" before shutting down. This message will be processed again.
.
MessageId=0x1E46
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_INVALID_STATE
Language=English
Invalid state: Message "%1!ls!" from mailbox "%2!ls!" has been processed but the state is unexpected so will be reprocessed:  State is %3!lu!
.
MessageId=0x1E47
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_CHANGED_FAILED_RETRY_INTERVAL_MINUTES
Language=English
FailedRetryIntervalMinutes has changed from %1!lu! to %2!lu!.
.
MessageId=0x1E48
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_CHANGED_TOTAL_RETRY_TIME_MINUTES
Language=English
TotalRetryTimeMinutes has changed from %1!lu! to %2!lu!
.
MessageId=0x1E49
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_CANNOT_WRITE_JOURNAL_TYPE
Language=English
The Universal Adapter could not write the journal type property on the message "%1!ls!" in mailbox "%2!ls!". The error returned was %3.
.
MessageId=0x1E4a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_NO_SUCH_OUTPUT_POOL
Language=English
The outpool pool "%1!ls!" specified in mailbox "%2!ls!" does not exist
.
MessageId=0x1E4c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_INVALID_OUTPUTS
Language=English
The outpools specified for mailbox "%1!ls!" are either empty or invalid, mailbox has been disabled.
.
MessageId=0x1E4d
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_REPROCESS_FAILED_MESSAGES_START
Language=English
The Universal Adapter is about to start moving failed messages back to the Inbox for mailbox "%1!ls!".
.
MessageId=0x1E4e
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_REPROCESS_FAILED_MESSAGES_COMPLETED
Language=English
The Universal Adapter has finished moving failed messages back to the Inbox for mailbox "%1!ls!". %2!lu! messages were moved.
.
MessageId=0x1E4f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_REPROCESS_FAILED_MESSAGES_FAILED
Language=English
The Universal Adapter encountered an error when moving failed messages back to the Inbox for mailbox "%1!ls!". The error returned was %2.
.
MessageId=0x1E50
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_DUMP_BLOCKED_MESSAGES_START
Language=English
The Universal Adapter is about to start moving messages to the failed folder for mailbox "%1!ls!".
.
MessageId=0x1E51
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_DUMP_BLOCKED_MESSAGES_COMPLETED
Language=English
The Universal Adapter has finished moving messages to the failed folder for mailbox "%1!ls!". %2!lu! messages were moved.
.
MessageId=0x1E52
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DUMP_BLOCKED_MESSAGES_FAILED
Language=English
The Universal Adapter encountered an error when moving messages to the failed folder for mailbox "%1!ls!". The error returned was %2.
.
MessageId=0x1E53
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_ISDUPLICATE_CALL_FAILED
Language=English
IsDuplicate failed for message "%1!ls!" from mailbox "%2!ls!".  The error was %3.
.
MessageId=0x1E55
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_CHANGED_LOG_PATH
Language=English
Changed the log path from "%1!ls!" to "%2!ls!"
.
MessageId=0x1E56
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_CHANGED_LOG_PATH_FAILURE
Language=English
The UA was unable to change the log file path to "%1!ls!". The error returned was %2.
.
MessageId=0x1E57
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_CHANGING_LOG_PATH
Language=English
Changing the log file path to "%1!ls!".
.
MessageId=0x1E58
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_INPUT_MAILBOX_TARGET_CHANGED
Language=English
The input mailbox "%1!ls!" has changed its target. Connecting to new target.
.
MessageId=0x1E59
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_INVALID_SUBJECT_FILTER
Language=English
The input mailbox "%1!ls!" has an invalid subject filter. The mailbox has been disabled. Filter is: "%2!ls!".  Error is: "%3!ls!"
.
MessageId=0x1E5A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_MAILBOX_INVALID_CONFIG
Language=English
The input mailbox "%1!ls!" has an invalid configuration. The mailbox has been disabled.
.
MessageId=0x1E5B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_MAILBOX_BASE_TEMPLATE_NOT_FOUND
Language=English
The input mailbox "%1!ls!" has an invalid configuration. The base template "%2!ls!" does not exist.
.
MessageId=0x1E5C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_MAILBOX_BASE_TEMPLATE_INVALID
Language=English
The input mailbox "%1!ls!" has an invalid configuration. The base template "%2!ls!" is invalid.
.
MessageId=0x1E5D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_CYCLIC_TEMPLATE_MAILBOX
Language=English
The template mailbox "%1!ls!" is in a cyclic dependency. It will be disabled.
.
MessageId=0x1E5E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_INVALID_FILTER
Language=English
The mailbox "%1!ls!" has an invalid %2!ls! It will be disabled.
.
MessageId=0x1E5F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_INPUT_MAILBOX_SAME_SOURCE
Language=English
The mailbox "%1!ls!" has the same source as mailbox "%2!ls!". Both will be disabled.
.
MessageId=0x1E60
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_INPUT_MAILBOX_NOW_ENABLED
Language=English
The input mailbox "%1!ls!" has become enabled.
.
MessageId=0x1E61
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_OUTPUT_POOL_FAILED
Language=English
All outputs in output pool "%1!ls!" have failed.  Last error was: "%2".
.
MessageId=0x1E62
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_INPUT_MAILBOX_FAILED_TO_INITIALIZE
Language=English
The input mailbox "%1!ls!" failed to initialize and has not been added. Error was: "%2".
.
MessageId=0x1E63
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_INPUT_MAILBOX_FAILED_TO_INITIALIZE_PERFMON_COUNTERS
Language=English
The input mailbox "%1!ls!" failed to initialize its perfmon counters. No perfmon info will be available for this mailbox.
.
MessageId=0x1E64
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_OUTPUT_FAILED_TO_INITIALIZE_PERFMON_COUNTERS
Language=English
The output "%1!ls!" failed to initialize its perfmon counters. No perfmon info will be available for this mailbox.
.
MessageId=0x1E65
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_OUTPUT_INVALID_CONFIG
Language=English
The output pool "%1!ls!" has invalid configuration. It will not be available for selection.
.
MessageId=0x1E66
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_OUTPUT_POOL_INVALID_PARAMETER
Language=English
The output pool "%1!ls!" has an invalid value for parameter "%2!ls!". Value is "%3!ls!"
.
MessageId=0x1E68
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_OUTPUT_LOCATION_MISSING_PARAMETER
Language=English
The output location "%1!ls!" has a missing parameter. Parameter is "%2!ls!"
.
MessageId=0x1E71
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_INVALID_MAPI_PROPERTY
Language=English
Invalid property id "%1!ls!", Property not added to the unique property ID list for "%2!ls!".
.
MessageId=0x1E79
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_COULD_NOT_GENERATE_HASH
Language=English
Could not generate hash for message "%1!ls!" from mailbox "%2!ls!".  Error was "%3".
.
MessageId=0x1E80
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_JOURNAL_MAIL_HAS_TOO_MANY_ATTACHMENTS_DEPRECATED
Language=English
*Obsolete* Too many attachments for journal message "%1!ls!" from mailbox "%2!ls!".
.
MessageId=0x1E85
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_IDPROPLIST_PARAMETER_UNKNOWN_ENTRY
Language=English
The "%1!ls!" parameter contains an invalid entry, "%2!ls!".
.
MessageId=0x1E86
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_ALL_IDPROPLIST_ORDERS_EMPTY
Language=English
All hash ordering parameters are empty.
.
MessageId=0x1E88
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_EMPTY_HASH_ORDER
Language=English
HashOrder is empty - non-envelope journal emails will fail if de-duplication is set.
.
MessageId=0x1E89
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_EMPTY_ENVELOPE_HASH_ORDER
Language=English
EnvelopeInnerOrder and EnvelopeOuterOrder are empty. Envelope journal emails will fail if de-duplication is set.
.
MessageId=0x1E8A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DSN_ERROR
Language=English
There was an error initializing the 'De-duplication' database "%1!ls!".
.
MessageId=0x1E8C
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_FAILED_CONNECT_DEDUP_DATABASE
Language=English
Failed to connect to the 'De-duplication' database on "%1!ls!", as it may be down.
.
MessageId=0x1E8D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_NO_DEDUP_DATABASE
Language=English
Input mailbox "%1!ls!" has specified 'DeDuplicate', but no database has been specified. The mailbox will be disabled.
.
MessageId=0x1E8E
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_TOO_MANY_THREADS
Language=English
Too many threads specified: Will only create %1!d!
.
MessageId=0x1E8F
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_REPROCESSING_FAILED_MESSAGES
Language=English
Configuration has changed - %1!d! Failing messages are being reprocessed: Could produce duplicates.
.
MessageId=0x1E90
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_OUTPUT_POOL_EMPTY
Language=English
The output pool "%1!ls!" has no locations specified and is therefore invalid.
.
MessageId=0x1E91
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_NO_MAILBOX_ON_SERVER
Language=English
The UA could not find the mailbox "%1!ls!" on the server "%2" (the mailbox is located on the server whose DN is "%3"). 
.
MessageId=0x1E92
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_CONNECT_INPUT_MAILBOX_FAIL
Language=English
Failed to connect to the input mailbox "%1!ls!" (mailbox name = "%2!ls!", server = "%3!ls!"). The error returned was %4.
.
MessageId=0x1E93
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_CONNECT_OUTPUT_MAILBOX_FAIL
Language=English
Failed to connect to the output mailbox "%1!ls!" (mailbox name = "%2!ls!", server = "%3!ls!"). The error returned was %4.
.
MessageId=0x1E95
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_EMPTY_HASH_ORDER_PROCESSING_NON_ENV_MAIL
Language=English
Cannot process non-envelope message "%1!ls!" from mailbox "%2!ls!", as HashOrder is empty.
.
MessageId=0x1E97
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_EMPTY_HASH_ORDER_PROCESSING_ENV_MAIL
Language=English
Cannot process envelope message "%1!ls!" from mailbox "%2!ls!", as EnvelopeInnerOrder and EnvelopeOuterOrder are empty.
.
MessageId=0x1E99
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_INPUT_MAILBOX_NOW_DISABLED
Language=English
The input mailbox "%1!ls!" has been disabled.
.
MessageId=0x1E9A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_DUMP_BLOCKED_MESSAGES_STARTUP
Language=English
The Universal Adapter will not move any messages to the failed folder for mailbox "%1!ls!", as the UA has not completely initialized.
.
MessageId=0x1E9B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_DUMP_BLOCKED_MESSAGES_DISABLED
Language=English
The Universal Adapter is unable to move any messages to the failed folder for mailbox "%1!ls!", as the mailbox is disabled.
.
MessageId=0x1E9C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_RETRY_FAILED_MESSAGES_DISABLED
Language=English
The Universal Adapter is unable to move any failed messages back to the Inbox for mailbox "%1!ls!", as the mailbox is disabled. 
.
MessageId=0x1E9D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_MAILBOX_ACCESS_FAILURE
Language=English
The Universal Adapter encountered an error when accessing mailbox "%1!ls!". The error returned was %2.
.
MessageId=0x1E9E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_OUTPUT_MAILBOX_DISCONNECTED
Language=English
The Universal Adapter has disconnected from the output mailbox "%1!ls!".
.
MessageId=0x1E9F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_OUTPUT_MAILBOX_DISCONNECT_FAILED
Language=English
The Universal Adapter failed to disconnect from the output mailbox "%1!ls!" (mailbox name = "%2!ls!", server = "%3!ls!"). The error returned was %4.
.
MessageId=0x1EA0
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_OUTPUT_POOL_INVALID_SECONDARY_OUTPUT
Language=English
The output pool "%1!ls!" has a SecondaryOutput value of "%2!ls!", which is not a valid output pool. The pool will not be available for selection.
.
MessageId=0x1EA1
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_OUTPUT_POOL_SET_TO_SELF
Language=English
The output pool "%1!ls!" has set the SecondaryOutput value to itself. The pool will not be available for selection.
.
MessageId=0x1EA2
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_OUTPUT_POOL_SECONDARY_OUTPUT_HAS_SECONDARY_OUTPUT
Language=English
The output pool "%1!ls!" has a SecondaryOutput value of "%2!ls!", which has a SecondaryOutput set. The pool will not be available for selection.
.
MessageId=0x1EA3
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_OUTPUT_POOL_SECONDARY_OUTPUT_NOT_EVF_POOL
Language=English
The output pool "%1!ls!" has a SecondaryOutput value of "%2!ls!", which is not an EVF Output Pool. The pool will not be available for selection.
.
MessageId=0x1EA4
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_OUTPUT_POOL_NOT_DLL_OR_EXCH
Language=English
The output pool "%1!ls!" has specified a SecondaryOutput value but it is not a DLL or an Exchange Output Pool. The pool will not be available for selection.
.
MessageId=0x1EA5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_OUTPUT_POOL_FAILED_SECONDARY_OUTPUT_FAILURE
Language=English
The output pool "%1!ls!" has had a secondary output failure. Secondary output: "%2!ls!". Error was "%3".
.
MessageId=0x1EA6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_OUTPUT_LOCATION_FAILED_SECONDARY_OUTPUT_FAILURE
Language=English
The output location "%1!ls!" has had a secondary output failure. Secondary output: "%2!ls!".  Error was "%3".
.
MessageId=0x1EA7
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_BULK_DELETE_FAILED
Language=English
The bulk message delete failed with error: "%1"
.
MessageId=0x1EA8
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_INDIVIDUAL_DELETE_MESSAGE_NOT_FOUND
Language=English
Individual delete returned "%1"; open message returned "%2". Treating as successful delete.
.
MessageId=0x1EA9
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_INVALID_PROP_TAG
Language=English
The message "%1!ls!" from mailbox "%2!ls!" does not have the property tag: "%3!x!", defined in registry value "%4!ls!".
.
MessageId=0x1EAA
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_INVALID_NAMED_PROP_TAG
Language=English
The message "%1!ls!" from mailbox "%2!ls!" does not have the property tag: "%3!ls!", defined in registry value "%4!ls!"
.
MessageId=0x1EAB
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_NO_WORKER_THREAD_COUNT
Language=English
Worker thread count not specified. Defaulting to %1!d!.
.
MessageId=0x1EAC
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_OUTPUT_POOL_TYPE_NOT_EXCH
Language=English
The output pool "%1!ls!" has specified a SecondaryOutputDataType value, but it is not an Exchange Output Pool. The pool will not be available for selection.
.
MessageId=0x1EAD
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_ZERO_THREADS_SPECIFIED
Language=English
Zero threads were specified. Will actually create %1!d!
.
MessageId=0x1EAE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_MAILBOX_NAME_NOT_SPECIFIED
Language=English
The registry value "UAMailboxName" has not been specified.
.
MessageId=0x1EAF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_MAILBOX_SERVER_NOT_SPECIFIED
Language=English
The registry value "UAMailboxServer" has not been specified.
.
MessageId=0x1EB0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_MAILBOX_NAME_CHANGED
Language=English
The registry value "UAMailboxName" has changed.
.
MessageId=0x1EB1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_MAILBOX_SERVER_CHANGED
Language=English
The registry value "UAMailboxServer" has changed.
.
MessageId=0x1EB2
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_ADDED_UNIQUE_PROPERTY
Language=English
Property "%1!ls!" added to the unique property ID list for "%2!ls!".
.
MessageId=0x1EB3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_SMART_TAG_POOL_INVALID___DEPRECATED__
Language=English
The smart tag pool "%1!ls!" has invalid configuration. It will not be available for selection.
.
MessageId=0x1EB4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_ST_INVALID_RESOLVE_MULTIPLE_VALUES
Language=English
The smart tag identifier "%1!ls!" within smart tag pool "%2!ls!" has a ResolveMultipleValues value of "%3!ls!, which is invalid.
.
MessageId=0x1EB5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_FAILED_TO_GET_SMART_TAGS___DEPRECATED__
Language=English
Failed to get smart tags for message "%1!ls!" from mailbox "%2!ls!. Error was: "%3"
.
MessageId=0x1EB6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_INPUT_MAILBOX_INVALID_TYPE
Language=English
Input mailbox "%1!ls!" has a type of "%2!ls!". This is invalid.
.
MessageId=0x1EB7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_INPUT_MAILBOX_CANT_OPEN_REG_KEY
Language=English
Can't open registry key for input mailbox "%1!ls!".
.
MessageId=0x1EB8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_INPUT_TYPE_CHANGED
Language=English
Input "%1!ls!" has changed its type. This is not allowed. Therefore, the input will be disabled.
.
MessageId=0x1EB9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_NOTES_ERROR
Language=English
Message "%1!ls!" from input "%2!ls!" has encountered a notes error - %3.
.
MessageId=0x1EBA
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_EMPTY_HASH_ORDER_PROCESSING_NOTES_MAIL
Language=English
Cannot process notes message "%1!ls!" from mailbox "%2!ls!" as hashorder is empty.
.
MessageId=0x1EBB
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_ID_NOTES_PROPERTY_NOT_FOUND
Language=English
The Universal Adapter could not access the property '%1!ls!' on the message '%2!ls!' in mailbox '%3!ls!'. The error returned was %4.
.
MessageId=0x1EBC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_CANNNOT_WRITE_NOTES_PROPERTY
Language=English
The Universal Adapter could not write the Notes ID property "%1!ls!" on the message "%2!ls!" in mailbox "%3!ls!". The error returned was %4.
.
MessageId=0x1EBD
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_CANNNOT_REMOVE_NOTES_PROPERTY
Language=English
The Universal Adapter could not remove the Notes ID property "%1!ls!" on the message "%2!ls!" in mailbox "%3!ls!". The error returned was %4.
.
MessageId=0x1EBE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_CANNOT_FIND_NOTES_FOLDER
Language=English
Could not find folder "%1!ls!" in mailbox "%2!ls!" on server "%3!ls!". The error returned was %4
.
MessageId=0x1EBF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_CANNOT_OPEN_NOTES_FOLDER
Language=English
Could not open folder "%1!ls!" in mailbox "%2!ls!" on server "%3!ls!". The error returned was %4
.
MessageId=0x1EC0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_CANNOT_READ_FOLDER_ENTRIES
Language=English
Could not read the entries of folder "%1!ls!" in mailbox "%2!ls!" on server "%3!ls!".  The error returnedwas %4
.
MessageId=0x1EC1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_CANNOT_CREATE_NOTES_FOLDER
Language=English
Could not create folder "%1!ls!" in mailbox "%2!ls!" on server "%3!ls!". The error returned was %4
.
MessageId=0x1EC2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_CANNOT_COPY_NOTE_TO_OUTPUT_DATABASE
Language=English
Could not copy note "%1!ls!" to destination database: mailbox "%2!ls!" on server "%3!ls!" Error was %4
.
MessageId=0x1EC3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_COULD_NOT_CAST_POINTER
Language=English
Could not cast pointer correctly.
.
MessageId=0x1EC4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_ERROR_MOVING_NOTE
Language=English
Could not move note "%1!ls!" to folder "%2!ls!" in mailbox "%3!ls!" on server "%4!ls!". The error returned was %5
.
MessageId=0x1EC5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_ERROR_REMOVING_TEMP_NOTE
Language=English
Could not remove temporary note "%1!ls!" from mailbox "%2!ls!" on server "%3!ls!":   Error was %4
.
MessageId=0x1EC6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_FAILED_INITILISE_MAPI
Language=English
The Universal Adapter failed to initialize MAPI (%1). Please ensure a Microsoft Exchange-compatible email application such as Outlook is the default email application. 
.
MessageId=0x1EC7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_INCOMPATIBLE_OUTPUTPOOL
Language=English
Mailbox "%1!ls!" has specified the output pool "%2!ls!" which has an incompatible type.  Mailbox will be disabled. 
.
MessageId=0x1EC8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_NOTES_PASSWORD_NOT_DEFINED
Language=English
Notes password not defined in LSA.
.
MessageId=0x1EC9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_NOTES_PASSWORD_NOT_OBTAINED
Language=English
Unable to obtain Notes password from LSA.
.
MessageId=0x1ED0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_DLIST_NOTES_ADDRESS
Language=English
An error occurred building a Notes Address for '%2!hs!' - %1.
.
MessageId=0x1EDE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_BASE_TEMPLATE_NOT_EXIST
Language=English
The template/input %ls is invalid because its base template %ls does not exist"
.
MessageId=0x1EDF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_SET_DATA_LOCATION_FAILURE
Language=English
The attempt to set the Remote Data Location in the Policy Engine for message '%1!ls!' failed. (%2!ls!)"
.
MessageId=0x1EE0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_COMMIT_FAILURE
Language=English
The attempt to commit message '%1!ls!' in the Policy Engine failed. (%2!ls!)"
.
MessageId=0x1EE1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_NOTES_PROPERTY_ENCRYPTED
Language=English
The property '%1!ls! could not be retrieved for message '%2!ls!' in mailbox "%3!ls!". Check that the property is excluded from encryption in the journal."
.
MessageId=0x1EE2
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_DLIST_NOT_EXPANDED
Language=English
Distribution List was not expanded - %1
.
MessageId=0x1EE3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_MESSAGE_ADD_TO_FAILED_QUEUE_WITH_STATUS
Language=English
The message "%1!ls!" from mailbox "%2!ls!" has failed and will be retried. Error %3.
.
MessageId=0x1EE4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_OUTPUT_RDL_ALREADY_EXISTS
Language=English
The output pool "%1!ls!" has returned a Remote Data Location when a previous pool has already done so. The input "%2!ls!" will be disabled.  Error was "%3".
.
MessageId=0x1EE5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_ACCOUNT_RIGHTS_INSUFFICIENT
Language=English
The service account has insufficient rights to initialize the Universal Adapter.  Check that the account is a member of the Domain Users group and the Local Administrators group.  The account must also have sufficient rights to access any configured mailboxes.
.
MessageId=0x1EE6
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_INPUT_DISABLED
Language=English
The input mailbox "%1!ls!" is disabled.
.
MessageId=0x1EE7
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_ALL_INPUTS_DISABLED
Language=English
All input mailboxes are currently disabled. Nothing will happen!
.
MessageId=0x1EE8
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_PE_NO_SMART_TAGS_AVAILABLE
Language=English
The Policy Engine did not return any smart tags for this message, although no error was indicated.
.
MessageId=0x1EE9
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_PE_NO_DEFERRED_COMPLETION_OBJECT
Language=English
The Policy Engine did not return a deferred completion object for this message.
.
MessageId=0x1EEA
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_PE_FAILED_TO_GET_SMART_TAGS
Language=English
The smart tag request to the Policy Engine for message "%1!ls!" from mailbox "%2!ls!" returned error was "%3".
.
MessageId=0x1EEB
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_LOG_MAIL_UNIQUE_BY_DEFAULT
Language=English
The message "%1!ls!" from mailbox "%2!ls!" has been declared unique by default because the required property '%3!ls!'  was not found.  This message cannot therefore be considered for de-duplication.
.
MessageId=0x1EEC
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_LOG_MESSAGE_NOT_FOUND
Language=English
NoteID 0x%1!x!: Message not found in mailbox "%2!ls!".
.
MessageId=0x1EED
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_CREATED_DUPLICATES_DBASE
Language=English
Created duplicates database '%1!ls!'".
.
MessageId=0x1EEE
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_FAILED_MOVE_DUPLICATES
Language=English
Failed to move message '%1!ls!' to the duplicates database. Error was %2".
.

; // End of Universal Adapter Log Codes 0x1E00 to 0x1EFF
; //


; // Universal Adapter Status Codes 0x2000 to 0x20FF
;
MessageId=0x2000
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_SI_DBMS_INITIALISE_ERROR
Language=English
The De-duplication component failed to initialize its database connection.
.
MessageId=0x2001
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_SI_SP_CALL_FAILURE
Language=English
The De-duplication component call to the DBMS failed.
.
MessageId=0x2002
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_SI_INVALID_HASH_LENGTH
Language=English
The De-duplication component was passed an unsupport hash code length.
.
MessageId=0x2003
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_SI_COMMIT_FAILURE
Language=English
The De-duplication component failed to commit changes on the DBMS.
.
MessageId=0x2004
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_SI_ROLLBACK_FAILURE
Language=English
The De-duplication component failed to rollback changes on the DBMS.
.
MessageId=0x2005
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_INVALID_CONFIG
Language=English
The UA encountered a problem with the supplied configuration.
.
MessageId=0x2006
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_NO_DDUP_OBJ
Language=English
The UA could not obtain a De-duplication object.
.
MessageId=0x2007
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_MAILBOX_NOT_AVAILABLE
Language=English
The mailbox is not available.
.
MessageId=0x2008
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_EVF_OUTPUT
Language=English
An EVF file could not be generated from this message.
.
MessageId=0x2009
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_MULTIPLE_RECIPIENTS
Language=English
There is more than one entry that matches the user/mailbox name.
.
MessageId=0x200A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_NO_MAILBOX_ON_SERVER
Language=English
The mailbox does not exist on the configured email server.
.
MessageId=0x200B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_MAPI_SERVICE_NOT_FOUND
Language=English
The newly created MAPI service could not be found.
.
MessageId=0x200C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_MAPI_STORE_NOT_FOUND
Language=English
The required MAPI store could not be found.
.
MessageId=0x200D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_MAPI_UNEXPECTED_TYPE
Language=English
The returned MAPI property is not of the expected type.
.
MessageId=0x200E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_UNABLE_TO_CREATE_TIMER_QUEUE
Language=English
The UA was unable to create the timer queue
.
MessageId=0x200F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_INVALID_MAPI_PROPERTY_DEFINITION
Language=English
Invalid MAPI property definition
.
MessageId=0x2010
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_INVALID_PROP_TAGS
Language=English
Invalid property tags
.
MessageId=0x2011
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_MAIL_HAS_MORE_THAN_ONE_ATTACHMENT_DEPRECATED
Language=English
*Obsolete* Mail has more than one attachment
.
MessageId=0x2012
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_NOT_AN_OUTPUT_MAILBOX
Language=English
Expected an output mailbox
.
MessageId=0x2013
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_COULD_NOT_CONVERT_TO_UTF8
Language=English
Could not convert string to UTF8
.
MessageId=0x2014
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_COULD_NOT_GET_IDS_FROM_NAMES
Language=English
Could not get IDs from names
.
MessageId=0x2015
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_UNIQUEIDPROPLIST_PARAMETER_INVALID
Language=English
One or more UniqueIDPropList parameters are invalid
.
MessageId=0x2016
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_PROPERTY_NOT_FOUND
Language=English
A MAPI property was not found
.
MessageId=0x2017
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_EMPTY_HASH_ORDER_PROCESSING_NON_ENV_MAIL_HRESULT
Language=English
Tried to dedup a envelope message but EnvelopeInnerOrder and EnvelopeOuterOrder are empty 
.
MessageId=0x2018
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_INVALID_OUTPUT_STRING
Language=English
The outpool pool string specified in the mailbox is not valid
.
MessageId=0x2019
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_INVALID_FILTER
Language=English
The input mailbox has an invalid filter
.
MessageId=0x201A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_OUTPUT_POOL_FAILED
Language=English
All outputs in an output pool have failed
.
MessageId=0x201B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_OUTPUT_POOL_INVALID_PARAMETER
Language=English
Invalid parameter in output pool
.
MessageId=0x201C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_OUTPUT_LOCATION_MISSING_PARAMETER
Language=English
Output location has a missing parameter.
.
MessageId=0x201D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_JOURNAL_MAIL_HAS_TOO_MANY_ATTACHMENTS
Language=English
Too many attachments for journal message
.
MessageId=0x201E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_DEDUP_TRANSACTION_ALREADY_OPEN
Language=English
The dudup transaction is already open.
.
MessageId=0x201F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_SECONDARY_OUTPUT_FAILED
Language=English
The secondary output of the output mailbox failed.
.
MessageId=0x2020
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_INVALID_GLOBAL_PARAMETER
Language=English
Invalid global parameter
.
MessageId=0x2021
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_CANNOT_OPEN_MESSAGE
Language=English
Cannot open message
.
MessageId=0x2023
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_NOTES_ERROR
Language=English
Notes Error
.
MessageId=0x2024
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_EMPTY_HASH_ORDER_PROCESSING_NOTES_MAIL
Language=English
Tried to de-duplicate a Notes message but HashOrder is empty.
.
MessageId=0x2025
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_CANNNOT_WRITE_NOTES_PROPERTY
Language=English
The Universal Adapter could not write to a Notes property.
.
MessageId=0x2026
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_CANNNOT_REMOVE_NOTES_PROPERTY
Language=English
The Universal Adapter could not write to a Notes property.
.
MessageId=0x2027
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_NOTE_DELETED
Language=English
The notes message could not be found.
.
MessageId=0x2028
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_BAD_CAST
Language=English
Could not cast pointer.
.
MessageId=0x2029
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_FAILED_INITILISE_MAPI
Language=English
Failed to initialize MAPI.
.
MessageId=0x2030
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_INCOMPATIBLE_OUTPUTPOOL
Language=English
An incompatible output pool has been specified.
.
MessageId=0x20D0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_DLIST_NOTES_ADDRESS
Language=English
An error occurred building a Notes Address.
.
MessageId=0x20D1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_RDL_ALREADY_EXISTS
Language=English
Only one DLL output may return a Remote Data Location.  More than one is doing so.
.
MessageId=0x20D6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_PE_RDI_NOT_AVAILABLE
Language=English
A connection object for the Policy Engine could not be created.  It is likely that WgnRDI.dll is not installed or registered.
.
MessageId=0x20D7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_PE_COULD_NOT_CONFIGURE_CONNECTOR
Language=English
A connection object for the Policy Engine could not be configured.
.
MessageId=0x20DB
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_NOTES_NOT_INSTALLED
Language=English
The Notes API could not be found, so the Universal Adapter is unable to connect to the "%1!ls!" mailbox.  This input will be disabled.  Please ensure that the Lotus Notes client is installed and configured correctly. 
.
MessageId=0x20DC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_NOTES_NOT_CONFIGURED
Language=English
The Notes API is not configured correctly, so the Universal Adapter is unable to connect to the '%1!ls!' mailbox.  This input will be disabled.  Please run and configure the Lotus Notes client to ensure that the User ID file is created and installed correctly. 
.
MessageId=0x20DD
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UA_NO_DEFAULT_CONFIG
Language=English
No default configuration value was found.
.
MessageId=0x20DE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_EXCEPTION_OCCURRED
Language=English
An exception occurred while processing the message.
.
MessageId=0x20DF
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_UA_MESSAGE_STATE_INVALID
Language=English
The message is in an invalid state.
.
MessageId=0x20E0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_LOG_IMPORT_OBJECT_FAIL_STATUS
Language=English
The failed import of message %1!ls! into the DLL output was due to the error "%2!ls!".
.
MessageId=0x20E1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UA_JOURNALING_TYPE_NOT_DETECTED
Language=English
The journaling type of the message could not be determined.
.
; // End of Universal Adapter Status Codes 0x2000 to 0x20FF
; //
; // end of UA messages
; //
; // *** UNIVERSAL ADAPTER ***
; /////////////////////////////////////////////////


; ///////////////////////////////////////////////////////////////////////////////////////
; // SEV Integration Codes 0x2100 to 0x217F
;
;
MessageId=0x2100
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_LOG_FAILED_TO_OPEN_REGISTRY_KEY_DEPRECATED_
Language=English
*Obsolete* Failed to open registry key %1\\%2, error %3. Entering failure mode.
.
MessageId=0x2101
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_LOG_FAILED_TO_OPEN_REGISTRY_KEY_AND_FAIL_DEPRECATED_
Language=English
*Obsolete* Failed to open registry key '%1', error %2. Entering failure mode.
.
MessageId=0x2102
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_LOG_FAILED_TO_CREATE_NEW_REGISTRY_PARAMETERS_OBJECT	
Language=English
Failed to create a new registry parameters object, error %1. The new registry parameters have not been applied.
.
MessageId=0x2103
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_LOG_FAILED_TO_ALLOCATE_BYTES_FOR_REGISTRY_DEPRECATED_
Language=English
Failed to allocate %1!d! bytes for registry's '%2' value, error %3.
.
MessageId=0x2104
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_LOG_FAILED_TO_CONVERT_REGISTRY_LIST_TO_UNICODE_DEPRECATED_	
Language=English
Failed to convert registry list entry '%1' to UNICODE, error %2.
.
MessageId=0x2105
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_LOG_REGISTRY_INVALID_VALUE	
Language=English
The registry value '%1' is set to an invalid value.
.
MessageId=0x2106
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_LOG_REGISTRY_READ_FAILED	
Language=English
Failed to read the registry value '%1', error %2.
.
MessageId=0x2107
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_LOG_HUB_NOT_INSTALLED	
Language=English
Policy Engine Hub not installed.
.
MessageId=0x2108
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_LOG_FAILED_TO_CREATE_HUB	
Language=English
Failed to create Policy Engine Hub, error %1. Entering failure mode. 
.
MessageId=0x2109
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_LOG_FAILED_TO_GET_LOCAL_NAME	
Language=English
Failed to retrieve local computer name, error %1. Entering failure mode. 
.
MessageId=0x210A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_LOG_FAILED_TO_REGISTER_WITH_HUB	
Language=English
Failed to register with Policy Engine Hub, error %1. Entering failure mode. 
.
MessageId=0x210B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEV_LOG_CONNECTED_TO_HUB	
Language=English
Successfully connected to the Policy Engine Hub.
.
MessageId=0x210C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_LOG_FAILED_TO_CONFIGURE_HUB	
Language=English
Failed to configure the Policy Engine Hub, error %1. Entering failure mode. 
.
MessageId=0x210D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_LOG_FAILED_TO_READ_MULTIPLE_RESOLUTION
Language=English
Failed to interpret "MultipleResolution" value for SmartTag %1. Default will be used. 
.
MessageId=0x210E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEV_ADDED_SMART_TAG
Language=English
Added SmartTag "%1", Value "%2" to email "%3".
.
MessageId=0x210F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEV_ADDED_RETENTION_CATEGORY
Language=English
Added Retention Category "%1" to email "%2".
.
MessageId=0x2110
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_FAILED_TO_ADD_SMART_TAG
Language=English
Failed to add SmartTag "%1", Value "%2" to email "%3". Error is "%4".
.
MessageId=0x2111
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_FAILED_TO_ADD_RETENTION_CATEGORY
Language=English
Failed to add Retention Category "%1" to email "%2". Error is "%3"
.
MessageId=0x2112
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_EMPTY_RETENTION_CATEGORY
Language=English
Illegal empty retention category specified for email "%1". It will be ignored.
.
MessageId=0x2113
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEV_EMPTY_SMART_TAG_VALUE
Language=English
Illegal empty SmartTag value specified for email "%1", SmartTag "%2"". The Smart Tag will be ignored.
.
MessageId=0x2114
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEV_PROCESSING_EMAIL
Language=English
Processing email with subject "%1", GUID "%2".
.
MessageId=0x2115
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEV_PROCESSED_EMAIL
Language=English
Successfully processed email with subject "%1", GUID "%2".
.
MessageId=0x2116
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_FAILED_EMAIL
Language=English
Failed email with subject "%1", GUID "%2". Error was %3.
.
MessageId=0x2117
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_FAILED_EMAIL_NO_ARCHIVE
Language=English
Request that failed email with subject "%1", GUID "%2", is not archived by Enterprise Vault.
.
MessageId=0x2118
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NO_PRIORITY_LIST
Language=English
No Priority list defined for SmartTag "%1", SmartTag will be ignored.
.
MessageId=0x2119
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SMARTTAG_VALUE_NOT_NUMERIC
Language=English
SmartTag "%1" has non-numeric value "%2", it will be ignored."
.
MessageId=0x211A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_FAILED_TO_CONVERT_RETENTION_CATEGORY
Language=English
Failed to convert requested retention category "%1" to a Enterprise Vault type for email "%2". The default Enterprise Vault retention category will be used.
.
MessageId=0x211B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_FAILED_TO_PROCESS_EVENT_FILTER_IN_FAILURE_MODE
Language=English
Failed to process event as filter is in Failure Mode. 
.
MessageId=0x211C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_FAILED_TO_PROCESS_EVENT_FILTER_IN_FAILURE_MODE_LOG
Language=English
Failed to process event %1 as filter is in Failure Mode. 
.
MessageId=0x211D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_FAILED_TO_OBTAIN_MAPI_MSG_LOG
Language=English
Failed to obtain MAPI message from Enterprise Vault. Error was: %1. 
.
MessageId=0x211E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_ENTERING_FAILURE_MODE_LOG
Language=English
Entering failure mode, no more emails will be processed until the system is reconfigured. Reason was: %1. 
.
MessageId=0x211F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_SEV_DISCARDING_EVENT_LOG
Language=English
Event with subject "%1", GUID "%2" has been requested to be not archived in Enterprise Vault.
.
MessageId=0x2120
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_ERROR_CREATING_RETENTION_CATEGORISER
Language=English
Could no create Enterprise Vault Retention categoriser component. Reason was: %1. 
.
MessageId=0x2121
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_SEV_REPLACEMENT_EMPTY_SMART_TAG_VALUE
Language=English
Empty SmartTag value specified for email "%1", SmartTag "%2", the replacement value "%3" will be used.
.
MessageId=0x2122
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_INVALID_PROPETY_SET_NAME
Language=English
The configured PropertySet "%1" contained non-alphanumeric or uppercase characters, or was empty. The default PropertySet of "%2" will be used.
.
MessageId=0x2123
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEV_STARTED_RESULT_LOGGING
Language=English
SmartTag result logging has been started. Results are stored in file %1.
.
MessageId=0x2124
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEV_STOPPED_RESULT_LOGGING
Language=English
SmartTag result logging has been stopped because the maximum number of logged results has been reached.
.
MessageId=0x2125
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEV_NEW_RESULT_LOGGING_FILE
Language=English
SmartTag result logging has created a new results file %1.
.
MessageId=0x2126
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEV_REMOVING_EXISTING_TEST_FILES
Language=English
SmartTag result logging is removing existing test logs in preparation for a new test run.
.
MessageId=0x2127
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEV_STOPPED_RESULT_LOGGING_NOT_MAX
Language=English
SmartTag result logging has been stopped.
.
MessageId=0x2128
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_SEV_STARTED
Language = English
The Enterprise Vault Custom Filter has loaded successfully.
.
MessageId=0x2129
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_SEV_STOPPED
Language = English
The Enterprise Vault Custom Filter has unloaded successfully.
.
MessageId=0x212A
Severity = Informational
Facility = Wigan
SymbolicName = WGN_I_SEV_DIVIDER
Language = English
********************************************************
.
MessageId=0x212B
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEV_TEST_MODE_RESULT_LOGGED
Language=English
Email '%1' was processed in test mode. Smart Tags were not returned to Enterprise Vault but can be viewed in the Test Mode Report.
.
MessageId=0x212C
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEV_TEST_MODE_NOT_LOGGED
Language=English
Email '%1' was processed in test mode. Smart Tags were not returned to Enterprise Vault. They were also omitted from the Test Mode Report because the maximum number of test mode messages had been exceeded.
.
MessageId=0x212D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEV_EMAIL_NOT_PROCESSED
Language=English
The email '%1', GUID '%2' cannot be processed.
.
MessageId=0x212E
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEV_NO_BCC_RECIPIENTS_AVAILABLE
Language=English
No Bcc recipient information is available from this version of Enterprise Vault.
.
MessageId=0x212F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEVLD_STARTED
Language=English
The Enterprise Vault Custom Domino filter (WgnSEVLD) has started.
.
MessageId=0x2130
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEVLD_LOG_CREATED_IMPORT_CONNECTOR
Language=English
The SEVLD Adapter has successfully created the DLP Import Connector.
.
MessageId=0x2131
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEVLD_COULD_NOT_CONFIGURE_CONNECTOR
Language=English
The SEVLD Adapter Import Connector configuration failed.
.
MessageId=0x2132
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEVLD_LOG_CONFIGURED_IMPORT_CONNECTOR
Language=English
The SEVLD Adapter has successfully configured the DLP Import Connector.
.
MessageId=0x2133
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEVLD_FAILED_TO_CONNECT_PE
Language=English
The SEVLD Adapter was unable to connect to the DLP policy engine. %1
.
MessageId=0x2134
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEVLD_SMART_TAGS_FAILED
Language=English
The SEVLD Adapter was unable to add smart tags to the email '%1'. Error: %2
.
MessageId=0x2135
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEVLD_STOPPED
Language=English
The Enterprise Vault Custom Domino filter (WgnSEVLD) has shut down.
.
MessageId=0x2136
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_FAILED_EMAIL_SYSTEM_EXCEPTION
Language=English
Failed email, caught a System Exception
.
MessageId=0x2137
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEV_FAILED_EMAIL_UNEXPECTED_EXCEPTION
Language=English
Failed email, caught an Unexpected Exception 
.



;///////////////////////////////////////////////////////////////////////////////////////////////////
;// ABT 04Nov09 SEVDD integration codes 0x2280 to 0x22FF
;// ------------------------------------------------------------------------------------------------
;// 

MessageId=0x2180
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEVDD_LOG_BAD_REGISTRY
Language=English
Essential registry configuration is missing; the filter has been disabled
.
MessageId=0x2181
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_SEVDD_LOG_LOADED
Language=English
The filter has loaded successfully
.
MessageId=0x2182
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEVDD_LOG_NOT_ENABLED
Language=English
The filter is not Enabled in the registry.  No de-duplication will take place
.
MessageId=0x2183
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEVDD_LOG_TEST_MODE
Language=English
The filter is configured for TestMode in the registry.  No de-duplication will take place
.
MessageId=0x2184
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEVDD_LOG_NO_HASH_ORDER
Language=English
No HashOrder properties are configured in the registry.  No de-duplication will take place
.
MessageId=0x2185
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_SEVDD_LOG_UNLOADED
Language=English
The filter has unloaded 
.
MessageId=0x2186
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEVDD_IARCHIVINGCONTROL3_NOT_AVAIL
Language=English
The IArchivingControl3 interface not available, IArchivingControl will be used instead
.
MessageId=0x2187
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEVDD_PROCESSING_MAIL_SUBJECT
Language=English
Processing email '%1'
.
MessageId=0x2188
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEVDD_LOG_DUPLICATE_MAIL
Language=English
Email '%1' will not be imported because it is a duplicate
.
MessageId=0x2189
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEVDD_LOG_DUPLICATE_MAIL
Language=English
Email '%1' will not be imported because it is a duplicate
.
MessageId=0x218a
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEVDD_LOG_TEST_MODE_DUPLICATE_MAIL
Language=English
In TEST MODE, otherwise email '%1' would not have been imported because it is a duplicate
.
MessageId=0x218b
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEVDD_LOG_TEST_MODE_DUPLICATE_MAIL
Language=English
In TEST MODE, otherwise email '%1' would not have been imported because it is a duplicate
.
MessageId=0x218c
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEVDD_LOG_NOT_ARCHIVED
Language=English
Email '%1' will not be archived in Enterprise Vault because it is a duplicate
.
MessageId=0x218d
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEVDD_LOG_NOT_ARCHIVED
Language=English
Email '%1' will not be archived in Enterprise Vault because it is a duplicate
.
MessageId=0x218e
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEVDD_LOG_TEST_MODE_NOT_ARCHIVED
Language=English
In TEST MODE, otherwise email '%1' would not have been archived in Enterprise Vault because it is a duplicate
.
MessageId=0x218f
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEVDD_LOG_TEST_MODE_NOT_ARCHIVED
Language=English
In TEST MODE, otherwise email '%1' would not have been archived in Enterprise Vault because it is a duplicate
.
MessageId=0x2190
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEVDD_LOG_PROCESS_FILTER_EXCEPTION
Language=English
The email processing function caused an unexpected exception while processing email '%1'
.
MessageId=0x2191
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEVDD_LOG_UNIQUE_BY_DEFAULT_FAIL
Language=English
The duplicate check for email '%1' failed with error %2. This email will be considered unique by default
.
MessageId=0x2192
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEVDD_LOG_DUPLICATE_CHECK_HASH
Language=English
The email '%1' has a dup-check value of %2!hs!.  (Duplicate=%3!d!)
.
MessageId=0x2193
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEVDD_LOG_UNIQUE_BY_DEFAULT_NO_PROPS
Language=English
Email '%1' will be considered unique by default because not all the configured properties could be read from it
.
MessageId=0x2194
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEVDD_LOG_UNIQUE_BY_DEFAULT_NO_CONFIG
Language=English
No HashOrder properties are configured in the registry. Email '%1' will be considered unique by default
.
MessageId=0x2195
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEVDD_LOG_MAIL_PROP_NOT_FOUND
Language=English
Message property %1 was not found in email '%2'
.
MessageId=0x2196
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEVDD_LOG_MAIL_PROP_NOT_SUPPORTED
Language=English
Message property %1 cannot be handled by this filter.  Please configure a different property in the HashOrder registry value
.
MessageId=0x2197
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEVDD_LOG_MISSING_PROPERTY
Language=English
Not all of the configured properties could be retrieved from email '%1'
.
MessageId=0x2198
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SEVDD_LOG_REG_KEY_FAIL
Language=English
Failed to open registry key %1, Error %2
.
MessageId=0x2199
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SEVDD_LOG_REG_VALUE_FAIL
Language=English
Failed to read registry value %1, Error %2, defaulting to %3
.
MessageId=0x219a
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SEVDD_LOG_REG_UPDATED
Language=English
The registry configuration has been updated
.


;///////////////////////////////////////////////////////////////////////////////////////////////////
;// ABT 28Nov05 IRM integration codes 0x2200 to 0x22FF
;// ------------------------------------------------------------------------------------------------
;// 

;// Web Exception error codes returned by calls to Web Services

MessageId=0x2200
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_IRM_WEB_EXCEPTION_SUCCESS
Language=English
The Web Services operation completed successfully.
.
MessageId=0x2201
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_HOST_NAME_RESOLVE_FAILED
Language=English
The Web Services host name could not be resolved by the name resolver service. %1
.
MessageId=0x2202
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_CONNECT_FAILURE
Language=English
The Web Services connection point could not be contacted; it is probably not running. %1
.
MessageId=0x2203
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_RECEIVE_FAILURE
Language=English
A complete response was not received from the Web Services server. The server may have failed. %1 
.
MessageId=0x2204
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_SEND_FAILURE
Language=English
A complete request could not be sent to the Web Services server. The server may have failed, or the client may have run out of memory to form up the request. %1
.
MessageId=0x2205
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_PIPELINE_FAILURE
Language=English
This member supports the .NET Framework infrastructure and is not intended to be used directly from code. %1 
.
MessageId=0x2206
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_REQUEST_CANCELLED
Language=English
The request was canceled, the WebRequest.Abort method was called, or an unclassifiable error occurred. %1 
.
MessageId=0x2207
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_PROTOCOL_ERROR
Language=English
The response received from the Web Services server was complete but indicated a protocol-level error. See the adjacent entry for details of the HTTP error string. %1
.
MessageId=0x2208
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_CONNECTION_CLOSED
Language=English
The Web Services connection was prematurely closed. %1
.
MessageId=0x2209
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_TRUST_FAILURE
Language=English
A certificate from the Web Services server could not be validated. %1 
.
MessageId=0x220A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_SECURE_CHANNEL_FAILURE
Language=English
An unknown error occurred in a secure channel link. %1 
.
MessageId=0x220B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_SERVER_PROTOCOL_VIOLATION
Language=English
The Web Services server response was not a valid HTTP response. %1 
.
MessageId=0x220C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_KEEP_ALIVE_FAILURE
Language=English
The Web Services connection for a request that specifies the Keep-alive header was closed unexpectedly. %1 
.
MessageId=0x220D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_PENDING
Language=English
The Web Services connection has an asynchronous request pending. %1
.
MessageId=0x220E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_TIMEOUT
Language=English
No response was received from the Web Services server during the time-out period for a request. %1 
.
MessageId=0x220F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_PROXY_NAME_RESOLVE_FAILED
Language=English
The name resolver service could not resolve the proxy host name. %1 
.
MessageId=0x2210
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_UNKNOWN_ERROR
Language=English
An exception of unknown type has occurred. %1 
.
MessageId=0x2211
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_EXCEPTION_MSG_LENGTH_EXCEEDED
Language=English
The Web Services connection sent or received a message that exceeded the specified limit for the server. %1 
.

;// Generic Remote Data Manager Adapter (IRM/ZDS/FNET) basic error codes

MessageId=0x2220
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDMA_MISSING_BASE_REGISTRY_KEY
Language=English
The registry does not contain a key for the archive adapter. The adapter will be inactive until this is rectified.
.
MessageId=0x2221
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_NO_WEB_SERVICE_URL_SPECIFIED
Language=English
The registry does not contain a URL for the archive's web service.
.
MessageId=0x2222
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_CLIENT_CERTIFICATE_NOT_FOUND
Language=English
No certificate could be found with a subject string that matches the ClientCertificateIdentifier
.
MessageId=0x2223
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IRM_UNABLE_TO_SAVE_COPY
Language=English
Unable to save a copy of the asset as '%1'
.
MessageId=0x2224
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_IRM_WRONG_OUTLOOK_VERSION
Language=English
The adapter requires Outlook 2003 or later to convert MAPI messages. The adapter will be inactive until this is rectified.
.

;//IRM web service codes

MessageId=0x2230
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_SERVICE_SYSTEM_EXCEPTION
Language=English
The Web Service server failed to process the request.
.
MessageId=0x2231
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_SERVICE_SOAP_EXCEPTION
Language=English
An error occurred in parsing the SOAP request or response.
.
MessageId=0x2232
Severity=Informational
Facility=Wigan
SymbolicName=WGN_IRM_WEB_SERVICE_STATUS
Language=English
Web services status request returned status 0x%1!08x!
.

;// IRM ingestion error codes

MessageId=0x2238
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_INGESTION_EXCEPTION
Language=English
The adapter failed to process (ingestion) the asset.
.
MessageId=0x2239
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_MAX_ASSET_SIZE_EXCEEDED
Language=English
The maximum allowed size has been exceeded for asset:%1
.
MessageId=0x223A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_SERVICE_ATTACHMENT_EXCEPTION
Language=English
An exception occurred while creating the message attachment.
.
MessageId=0x223B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_IRM_INGESTION_STATUS
Language=English
Ingestion of asset '%1' [asset name '%2'] returned status 0x%3!08x!
.
MessageId=0x223C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_INGESTION_SERVICE_NOT_RUNNING
Language=English
The Iron Mountain ingestion service is not running.
.


;// IRM conversion error codes

MessageId=0x2240
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_MAPI_TO_TNEF_INITIALISE_FAILED
Language=English
Failed to initialize the MAPI-TNEF converter module. The adapter will be inactive until this is rectified.
.
MessageId=0x2241
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_MAPI_TO_TNEF_CONVERSION_EXCEPTION
Language=English
An exception occurred during the MAPI-TNEF conversion function for asset:%1
.
MessageId=0x2242
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_MAPI_TO_TNEF_CONVERSION_ERROR
Language=English
The MAPI-TNEF conversion process for asset:%1 returned the error 0x%2!08x! :%3
.
MessageId=0x2243
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_TNEF_TO_MIME_CONVERSION_EXCEPTION
Language=English
An exception occurred during the TNEF-MIME conversion function for asset:%1
.
MessageId=0x2244
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_TNEF_TO_MIME_CONVERSION_ERROR
Language=English
The TNEF-MIME conversion process for asset:%1 returned the error 0x%2!08x! :%3
.

;// IRM retrieval error codes

MessageId=0x2250
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_WEB_SERVICE_NO_ATTACHMENT
Language=English
No attachment was present in the retrieval message for asset:%1..
.
MessageId=0x2251
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_RETRIEVAL_EXCEPTION
Language=English
The adapter failed to process (retrieval) the asset.
.
MessageId=0x2252
Severity=Informational
Facility=Wigan
SymbolicName=WGN_IRM_RETRIEVAL_STATUS
Language=English
Retrieval of asset '%1' [subject '%2'] returned status 0x%3!08x!
.
MessageId=0x2253
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_IRM_RETRIEVAL_SERVICE_NOT_RUNNING
Language=English
The Iron Mountain retrieval service is not running.
.

;// ZDS specific error codes

MessageId=0x2280
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ZDS_NO_WEB_SERVICE_DOMAIN_SPECIFIED
Language=English
The registry does not contain an entry for the ZANTAZ web services domain.
.

MessageId=0x2281
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ZDS_MISSING_BASE_REGISTRY_KEY
Language=English
The registry does not contain a key for the ZANTAZ Digital Safe adapter. The adapter will be inactive until this is rectified.
.
MessageId=0x2282
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ZDS_NO_WEB_SERVICE_URL_SPECIFIED
Language=English
The registry does not contain a URL for the ZANTAZ Digital Safe web service.
.
MessageId=0x2283
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ZDS_WEB_SERVICE_NOT_RUNNING
Language=English
The ZANTAZ Digital Safe web service is not running.
.
MessageId=0x2284
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ZDS_INGESTION_EXCEPTION
Language=English
The adapter failed to process the asset.
.
MessageId=0x2285
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ZDS_RETRIEVAL_EXCEPTION
Language=English
The adapter failed to process the asset.
.

;// ZDS conversion error codes

MessageId=0x2290
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ZDS_MAPI_INITIALISE_FAILED
Language=English
Failed to initialize the MAPI subsystem. The adapter will be inactive until this is rectified.
.
MessageId=0x2291
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ZDS_MAPI_TO_STREAM_CONVERSION_EXCEPTION
Language=English
An exception occurred during the MAPI serialization to stream function for asset:%1.
.
MessageId=0x2292
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ZDS_MAPI_TO_STREAM_CONVERSION_ERROR
Language=English
The MAPI serialization to stream process for asset:%1 returned the error 0x%2!08x! :%3.
.
MessageId=0x2293
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ZDS_STREAM_TO_MAPI_CONVERSION_EXCEPTION
Language=English
An exception occurred during the stream to MAPI serialization function for asset:%1.
.
MessageId=0x2294
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ZDS_STREAM_TO_MAPI_CONVERSION_ERROR
Language=English
The stream to MAPI serialization process for asset:%1 returned the error 0x%2!08x! :%3.
.
MessageId=0x2295
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ZDS_CONVERT_GENERAL_ERROR
Language=English
The adapter was unable to convert the email due to an internal error.
.
MessageId=0x2296
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ZDS_CONVERT_INVALID_DATA
Language=English
The adapter was unable to convert the email because it was given invalid data.
.
MessageId=0x2297
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ZDS_EVENT_CONVERT
Language=English
The Remote Data Manager failed to process the email: 0x%1!08x!.
.
MessageId=0x2298
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ZDS_EVENT_CREATION_FAILED
Language=English
The Remote Data Manager was unable to create an event from the supplied data.
.

;
;// EMail Helper Status Codes 0x2300 to 0x23FF
;// 
;// WARNING: A lot of these codes have an equivalent log code in the range 0x2400 - 0x24FF, however there is no
;// one-to-one match because as a result of bad management quite a few codes meant to be generic were made specific to
;// a EMail Helper, and vice versa.
;//
;// NOTEWELL: The codes below are STATUS codes and their messages describe their meaning.
;// They are not meant to be used for logging, except as a parameter of a log message.
;//
;// SPECIFIC CODE: Use NOTES, MAPI, SMTP, etc. in the symbolic name, e.g. WGN_E_MAILHELP_NOTES_TEMPLATE_NOT_FOUND.
;// GENERIC CODE:  Do NOT use NOTES, etc. in the symbolic name, e.g. WGN_E_MAILHELP_EMAIL_EXISTS
;//
;// If you need to define a Log Code, go to section 0x2400-0x24FF.
;
MessageId=0x2300
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_CREATE_EMAIL
Language=English
An error occurred creating the email.
.
MessageId=0x2301
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_INITERR
Language=English
Failed to initialize the Notes API.
.
MessageId=0x2302
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_MAILBOX_CREATE
Language=English
Error creating mailbox.
.
MessageId=0x2303
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_MAILBOX_FULL
Language=English
Mailbox is full.
.
MessageId=0x2304
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_MAILBOX_OPEN
Language=English
Error opening mailbox.
.
MessageId=0x2305
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_MAILBOX_DELETE
Language=English
Error deleting mailbox.
.
MessageId=0x2306
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_MAILBOX_CLOSE
Language=English
Error closing Mailbox.
.
MessageId=0x2308
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_CLOSE
Language=English
Error closing email.
.
MessageId=0x2309
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_CREATE
Language=English
Error creating email.
.
MessageId=0x230A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_ATTACH_DBALLOC
Language=English
Unable to allocate storage for an attachment object in the Notes mailbox.
.
MessageId=0x230B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_ATTACH_MEMALLOC
Language=English
Unable to allocate memory for an attachment.
.
MessageId=0x230C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_ATTACH_APPEND
Language=English
Unable to append attachment object to Notes email.
.
MessageId=0x230D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_ATTACH_WRITE
Language=English
Unable to write into a Notes attachment object.
.
MessageId=0x230E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_SAVE
Language=English
Unable to save email.
.
MessageId=0x230F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_ALLOC_RECIPIENTS
Language=English
Error allocating recipient list.
.
MessageId=0x2310
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_COCREATE_FAILED
Language=English
An error occurred creating an instance of a desired COM object.
.
MessageId=0x2314
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_BODY_CLOSE
Language=English
An error occurred closing the set email body.
.
MessageId=0x2315
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_ADD_RECIPIENTS
Language=English
Error adding recipient email address(es).
.
MessageId=0x2316
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_POPULATE
Language=English
Error populating email.
.
MessageId=0x2317
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_SEND
Language=English
An error occurred sending an email.
.
MessageId=0x2319
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_BODY_CREATE
Language=English
An error occurred creating the email body.
.
MessageId=0x231A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_MAILBOX_OPEN_SERVER
Language=English
Error opening mailbox on server.
.
MessageId=0x231C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_BODY_DATATYPE
Language=English
The format of the body data is not supported or is not present.
.
MessageId=0x231D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_ATTACHMENT_DATATYPE
Language=English
The format of the attachment data is not supported or is not present.
.
MessageId=0x231E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_RECIPIENT_TYPE
Language=English
The message recipient type is not supported.
.
MessageId=0x231F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_BODYHTML_APPEND
Language=English
An error occurred adding the email HTML body text.
.
MessageId=0x2320
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_ATTACH_STGCREATE
Language=English
An error occurred creating storage for attachment.
.
MessageId=0x2321
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_ATTACH_STGSTAT
Language=English
An error occurred retrieving storage status for attachment.
.
MessageId=0x2322
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_ATTACHMENT_TEXT
Language=English
An error occurred appending text to an attachment.
.
MessageId=0x2323
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_INIT323
Language=English
Failed to initialize the Notes API. A different Notes client process terminated abnormally. To resolve, please close your current windows session and log in again.
.
MessageId=0x2324
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_MAILHELP_NOTES_NO_DEFAULT_DB
Language=English
No default Notes database is available.
.
MessageId=0x2325
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_MAILHELP_NOTES_NO_DEFAULT_MAILBOX
Language=English
No default Notes Mailbox is available.
.
MessageId=0x2326
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_MAILBOX_PATH
Language=English
An error occurred resolving the Server Mailbox path.
.
MessageId=0x2327
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_ACL_CREATE
Language=English
An error occurred creating a Notes ACL (Access Control List).
.
MessageId=0x2328
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_ACL_STORE
Language=English
An error occurred storing the new Notes ACL (Access Control List).
.
MessageId=0x2329
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_ACL_ADDENTRY
Language=English
An error occurred creating Notes ACL entry (ACL - Access Control List).
.
MessageId=0x232A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_PASSWORD_ERR
Language=English
The password is invalid.
.
MessageId=0x232B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_DESIRED_ACCESS
Language=English
Create email requested, but mailbox is Read-Only.
.
MessageId=0x232C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_INIT_EXCEPTION
Language=English
An exception occurred during Notes initialization.
.
MessageId=0x232D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_ATTACH_STGEMBED
Language=English
An error occurred creating embedded storage for attachment.
.
MessageId=0x232E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_ATTACH_STGCOPY
Language=English
An error occurred copying attachment to embedded temporary storage.
.
MessageId=0x232F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_ATTACH_STAT
Language=English
An error occurred retrieving storage status for attachment.
.
MessageId=0x2330
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_ACL_READUPDATE
Language=English
An error occurred reading the Notes ACL for update (Access Control List).
.
MessageId=0x2331
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_ACL_UPDATEDEFAULT
Language=English
An error occurred updating the default entry in the Notes ACL (Access Control List).
.
MessageId=0x2332
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_ACL_UPDATESTORE
Language=English
An error occurred string the updated Notes ACL (Access Control List).
.
MessageId=0x2333
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_MAILBOX_ALREADY_EXISTS
Language=English
The specified mailbox already exists.
.
MessageId=0x2334
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_MAILBOX_OPEN_EXCEPTION
Language=English
An exception occurred opening a mailbox.
.
MessageId=0x2335
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_FOLDER_ALREADY_EXISTS
Language=English
Folder already exists.
.
MessageId=0x2336
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_MAILBOX_DOES_NOT_EXIST
Language=English
Mailbox does not exist.
.
MessageId=0x2337
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_NO_ERROR_MESSAGE
Language=English
Could not find the Notes message for an error.
.
MessageId=0x2338
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_ERROR_MESSAGE_EXCEPTION
Language=English
An exception occurred trying to retrieve the Notes message for an error.
.
MessageId=0x2339
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_INIT_THREAD
Language=English
Notes Thread Initialization failed.
.
MessageId=0x233A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_APPEND_LIST_ITEM
Language=English
A Notes error occurred appending to an email list item.
.
MessageId=0x233B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_NTF_APPEND
Language=English
A Notes error occurred adding compound text to an email NTF item.
.
MessageId=0x233C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_NTF_ALLOC
Language=English
A Notes error occurred allocating memory for email NTF body text.
.
MessageId=0x233D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_NTF_ENUM
Language=English
An error occurred parsing the Notes CD Data for email NTF body text.
.
MessageId=0x233E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_NTF_ITEMINFO
Language=English
A Notes error occurred querying the info of an email item.
.
MessageId=0x2340
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_LOGON_EXCEPTION
Language=English
An exception occurred trying to set the Notes Login password.
.
MessageId=0x2341
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_POPULATE_CALLED_AGAIN
Language=English
The EMail Helper's PopulateFromWgnEvent function can be called only once for each email.
.
MessageId=0x2342
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_SEND_CALLED_AGAIN
Language=English
The EMail Helper's Send function can be called only once for each email.
.
MessageId=0x2343
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NO_NOTES_INI
Language=English
Failed to initialize the Notes API. Could not find Notes.ini.
.
MessageId=0x2344
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_NTF_CREATE
Language=English
A Notes error occurred creating compound text for email NTF item.
.
MessageId=0x2345
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_NTF_CLOSE
Language=English
A Notes error occurred closing an email NTF item.
.
MessageId=0x2346
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_FOLDER_OPEN
Language=English
An error occurred opening the folder.
.
MessageId=0x2347
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_FOLDER_CREATE
Language=English
An error occurred creating the folder.
.
MessageId=0x2348
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_FOLDER_SPECIAL
Language=English
An error occurred opening the special folder.
.
MessageId=0x2349
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_GETID
Language=English
A Notes error occurred getting the ID of the message. The message must be persisted prior to this call.
.
MessageId=0x234A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_FOLDER_NAME_INVALID
Language=English
The folder name must contain characters other than spaces, slashes and backslashes.
.
MessageId=0x234C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_DELETE
Language=English
An error occurred deleting an email.
.
MessageId=0x234D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_STORE
Language=English
A Notes error occurred storing an email in a mailbox.
.
MessageId=0x234E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_TABLE
Language=English
A Notes error occurred creating a table to move emails to a folder.
.
MessageId=0x234F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_TABLE_INSERT
Language=English
A Notes error occurred inserting an email into the table to move to a folder.
.
MessageId=0x2350
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_TABLE_DELETE
Language=English
A Notes error occurred deleting a table after moving emails to a folder.
.
MessageId=0x2351
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_FOLDER_ADD
Language=English
An error occurred adding an email to a folder.
.
MessageId=0x2352
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_FOLDER_DRAFTS
Language=English
An error occurred opening the Drafts folder.
.
MessageId=0x2353
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_FOLDER_REMOVE
Language=English
An error occurred removing the email from the Drafts folder.
.
MessageId=0x2354
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_BODYTEXT_ADD
Language=English
An error occurred adding text to email body.
.
MessageId=0x2355
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_BODYTEXT_EMBED
Language=English
A Notes error occurred adding an email to embed into body text.
.
MessageId=0x2357
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_BODYTEXT_CREATE
Language=English
An error occurred creating the email body text.
.
MessageId=0x2358
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_BODY_ALREADY_SET
Language=English
An error occurred adding the email body text: Body text is already set.
.
MessageId=0x235B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_SHM_MAPPING
Language=English
An error occurred mapping the data passed to Notes Extension.
.
MessageId=0x235C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_SHM_MODULE_ADDRESS
Language=English
Returned Notes Extension data does not contain module address. The Notes Extension may not be installed correctly.
.
MessageId=0x235D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NULL_CLASS_FACTORY
Language=English
NULL class factory returned for a desired COM object.
.
MessageId=0x235E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_CLASS_FACTORY
Language=English
An error occurred querying the class factory of a desired COM object.
.
MessageId=0x2360
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_SETMAILITEM
Language=English
A Notes error occurred setting text of an email item.
.
MessageId=0x2361
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_NAME_INVALID
Language=English
Mailbox name must not start with a space.
.
MessageId=0x2362
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_EMAIL_CSLD_IMPORT
Language=English
CSLD returned an error importing an email.
.
MessageId=0x2363
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_FILE_DELETE
Language=English
A file system error occurred deleting temporary file.
.
MessageId=0x2364
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_FILE_CREATE
Language=English
A file system error occurred creating a temporary file.
.
MessageId=0x2365
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_FILE_WRITE
Language=English
A file system error occurred writing temporary file.
.
MessageId=0x2366
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_FILE_CLOSE
Language=English
A file system error occurred closing temporary file.
.
MessageId=0x2367
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_SWITCH_PASSWORD
Language=English
The password for this User ID File is invalid.
.
MessageId=0x2368
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_SWITCH_USER
Language=English
An error occurred switching to User ID File.
.
MessageId=0x2369
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_CALLED_AFTER_SEND
Language=English
The Email Helper's function cannot be called after Send has been called.
.
MessageId=0x236A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NATIVE_ATTACHMENT_DATATYPE
Language=English
The format of the 'native' attachment data is not supported.
.
MessageId=0x236B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_TERMINATE
Language=English
An exception occurred during Notes Termination.
.
MessageId=0x236E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_GETNOTETABLE
Language=English
A Notes error occurred getting the Note ID table from a Notes Database.
.
MessageId=0x236F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_REPLICAINFO
Language=English
A Notes error occurred getting replication information from a Notes Database.
.
MessageId=0x2370
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_NOTECOPY
Language=English
A Notes error copying Note from a Notes Database to another.
.
MessageId=0x2371
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_OPEN_TEMPLATE
Language=English
A Notes error occurred opening a Notes Template.
.
MessageId=0x2372
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_LIST_ADD
Language=English
An error occurred adding to a Notes List.
.
MessageId=0x2373
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_LIST_LOCK
Language=English
An error occurred locking a Notes List.
.
MessageId=0x2374
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_LIST_CREATE
Language=English
An error occurred creating a Notes List's content.
.
MessageId=0x2375
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_ITEM_DELETE
Language=English
A Notes error occurred deleting an item from an email.
.
MessageId=0x2376
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_ITEM_APPEND
Language=English
A Notes error occurred appending an item to an email.
.
MessageId=0x2377
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_CREATE_EXCEPTION
Language=English
An exception occurred copying a Notes template while creating a mailbox.
.
MessageId=0x2378
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_INFOGET
Language=English
A Notes error occurred getting database info while creating a mailbox.
.
MessageId=0x2379
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_INFOSET
Language=English
A Notes error occurred setting database info while creating a mailbox.
.
MessageId=0x237A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_ICONNOTEOPEN
Language=English
A Notes error occurred opening icon note while creating a mailbox.
.
MessageId=0x237B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_ICONNOTECLOSE
Language=English
A Notes error occurred closing icon note while creating a mailbox.
.
MessageId=0x237C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_ICONNOTESET
Language=English
A Notes error occurred setting icon note title while creating a mailbox.
.
MessageId=0x237D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_ICONNOTEUPDATE
Language=English
An error occurred updating icon note while creating a mailbox.
.
MessageId=0x237E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_ICONNOTECOPY
Language=English
A Notes error occurred copying icon note while creating a mailbox.
.
MessageId=0x237F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_ICONNOTEGENOID
Language=English
A Notes error occurred generating new icon note Originator ID (OID) while creating a mailbox.
.
MessageId=0x2380
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_COPYACL
Language=English
A Notes error occurred copying the template ACL while creating a mailbox.
.
MessageId=0x2381
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_MAILBOX_USERNAME
Language=English
An error occurred getting the Notes' username while creating a mailbox.
.
MessageId=0x2382
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_FOLDER_OPEN_EXCEPTION
Language=English
An exception occurred opening a mailbox folder.
.
MessageId=0x2383
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_INVALID_ADDRESS
Language=English
The event contained an invalid address.
.
MessageId=0x2385
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_SET_SUBJECT
Language=English
An error occurred setting the email subject.
.
MessageId=0x2387
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_ATTACHMENT_PROPERTIES
Language=English
An error occurred getting the attachment properties interface.
.
MessageId=0x2388
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_ATTACHMENT_DISPLAYNAME
Language=English
An error occurred getting the attachment display name.
.
MessageId=0x2389
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_ATTACHMENT_PATHNAME
Language=English
An error occurred getting the attachment path name.
.
MessageId=0x238A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_UNKNOWN_ERR
Language=English
Unknown Notes API initialization error.
.
MessageId=0x238B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_SWITCH_NOKEYFILE
Language=English
There is no Notes User ID File associated with this Windows NT User. Please log in to Notes before trying again.
.
MessageId=0x238C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_FOLDER_OPENEXISTING
Language=English
An error occurred opening an existing folder.
.
MessageId=0x238F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_FOLDER_DELETE
Language=English
An error occurred deleting a folder.
.
MessageId=0x2390
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NOTES_FOLDER_DOCCOUNT
Language=English
An error occurred getting the count of documents in a Notes folder.
.
MessageId=0x2391
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_MAILHELP_NOTES_MAILBOX_LIST_FULL
Language=English
An error occurred adding to a Notes List, Notes List is Full.
.
MessageId=0x2392
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_MAILHELP_NOTES_MAILBOX_LIST_MAX
Language=English
Adding text to a Notes list would exceed the maximum Notes summary list size.
.
MessageId=0x2393
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_MAPI_SEND_MSG_FILE_NOT_ALLOWED
Language=English
Send not permitted on an MSG file.
.
MessageId=0x2394
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_SMTP_MAIL_FROM
Language=English
The SMTP MAIL FROM command failed.
.
MessageId=0x2395
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_SMTP_MAIL_INCOMPLETE
Language=English
Failed to send due to incomplete email data.
.
MessageId=0x2396
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_SMTP_MAIL_RCPT
Language=English
The SMTP MAIL RCPT command failed.
.
MessageId=0x2397
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_SMTP_MAIL_DATA_SEND
Language=English
Failed to send the SMTP MAIL DATA.
.
MessageId=0x2398
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_SMTP_MAIL_DATA
Language=English
The SMTP MAIL DATA command failed.
.
MessageId=0x2399
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_SMTP_CONNECT
Language=English
Failed to connect to SMTP server.
.
MessageId=0x239A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_SMTP_NO_COMMANDS
Language=English
The SMTP server is not accepting commands.
.
MessageId=0x239B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_SMTP_EHLO_FAILED
Language=English
Failed to send SMTP EHLO/HELO command.
.
MessageId=0x239C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_SMTP_EHLO_HELO
Language=English
The SMTP MAIL EHLO/HELO command failed.
.
MessageId=0x239D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_SMTP_AUTHTYPE
Language=English
The SMTP AUTH type is invalid.
.
MessageId=0x239E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NO_USERID
Language=English
No UserID has been specified.
.
MessageId=0x239F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NO_PASSWORD
Language=English
No password has been specified.
.
MessageId=0x23A0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_SMTP_AUTHENTICATION_FAILED
Language=English
The SMTP AUTH command failed.
.
MessageId=0x23A1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_COCREATE_EXCEPTION
Language=English
An exception occurred while creating an instance of a COM object (includes querying for an interface).
.
MessageId=0x23A2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NO_RECIPIENTS
Language=English
Failed to send because there are no recipients.
.
MessageId=0x23A3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_NO_SENDER
Language=English
Failed to send because no sender was specified.
.

;
;// EMail Helper Log Codes 0x2400 to 0x24FF
;// 
;// WARNING: These codes are NOT equivalent to 0x2400 - 0x24FF, because as a result of bad management
;// quite a few codes meant to be generic were made specific to a EMail Helper, and vice versa.
;//
;// NOTEWELL: The codes below are LOG codes and their messages are meant to be used with insertion variables.
;// They are not meant to be reported to customer programs - use STATUS codes for that purpose.
;//
;// SPECIFIC CODE: Use NOTES, MAPI, SMTP, etc. in the symbolic name which includes "LOG", e.g. WGN_E_MAILHELP_LOG_NOTES_TEMPLATE_NOT_FOUND.
;// GENERIC CODE:  Do NOT use NOTES, etc. in the symbolic name, e.g. WGN_E_MAILHELP_LOG_EMAIL_EXISTS
;//
;// If you need to define a Status Code, go to section 0x2300-0x23FF.
;
MessageId=0x2400
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_CREATE_EMAIL
Language=English
An error occurred creating the email - %1.
.
MessageId=0x2401
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_INITERR
Language=English
Failed to initialize the Notes API - %1.
.
MessageId=0x2402
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_CREATE
Language=English
Error creating mailbox '%2!ls!', Notes template '%3!ls!' - %1.
.
MessageId=0x2403
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_MAILBOX_FULL
Language=English
Mailbox '%2!ls!' is full - %1.
.
MessageId=0x2404
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_MAILBOX_OPEN
Language=English
Error opening mailbox '%2!ls!' - %1.
.
MessageId=0x2405
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_MAILBOX_DELETE
Language=English
Error deleting mailbox '%2!ls!' - %1.
.
MessageId=0x2406
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_MAILBOX_CLOSE
Language=English
Error closing mailbox '%2!ls!' - %1.
.
MessageId=0x2407
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NO_MESSAGE
Language=English
No message found for error - %1.
.
MessageId=0x2408
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_CLOSE
Language=English
Error closing email (Note ID=%2) - %1.
.
MessageId=0x2409
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_CREATE
Language=English
Error creating email - %1.
.
MessageId=0x240A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_ATTACH_DBALLOC
Language=English
Unable to allocate storage for an attachment object in the Notes mailbox '%2!ls!' - %1.
.
MessageId=0x240B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_ATTACH_MEMALLOC
Language=English
Unable to allocate memory for an attachment - %1.
.
MessageId=0x240C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_ATTACH_APPEND
Language=English
Unable to append attachment object to Notes email - %1.
.
MessageId=0x240D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_ATTACH_WRITE
Language=English
Unable to write into a Notes attachment object - %1.
.
MessageId=0x240E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_SAVE
Language=English
Unable to save email (Mailbox '%2!ls' Note ID=%3) - %1.
.
MessageId=0x240F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_ALLOC_RECIPIENTS
Language=English
Error allocating recipient list - %1.
.
MessageId=0x2410
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_COCREATE_FAILED
Language=English
An error occurred creating an instance of the COM object to query for the interface %2 - %1.
.
MessageId=0x2411
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_LOGON
Language=English
A Notes error occurred during the logging in to the email Provider - %1.
.
MessageId=0x2412
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_STREAM_READ_FAILED
Language=English
An error occurred reading from a stream object - %1.
.
MessageId=0x2413
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_STREAM_SEEK_FAILED
Language=English
An error occurred seeking into a stream object (origin=%2!u!) - %1.
.
MessageId=0x2414
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_BODY_CLOSE
Language=English
An error occurred closing the set email body - %1.
.
MessageId=0x2415
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_ADD_RECIPIENTS
Language=English
Error adding recipient email address(es) - %1.
.
MessageId=0x2416
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_POPULATE
Language=English
Error populating email from event - %1.
.
MessageId=0x2417
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_SEND
Language=English
A Notes error occurred sending an email (Note ID=%2) - %1
.
MessageId=0x2418
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_SEND
Language=English
An error occurred sending an email - %1
.
MessageId=0x2419
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_BODY_CREATE
Language=English
An error occurred creating the email body - %1.
.
MessageId=0x241A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_MAILBOX_OPEN_SERVER
Language=English
Error opening Mailbox '%2!ls!' on Server '%3!ls!'  - %1.
.
MessageId=0x241B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_ERR_CONTINUE
Language=English
Continue.
.
MessageId=0x241C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_BODY_DATATYPE
Language=English
The format (%1!d!) of the body data is not supported.
.
MessageId=0x241D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_ATTACHMENT_DATATYPE
Language=English
The format (%1!d!) of the attachment data is not supported.
.
MessageId=0x241E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_RECIPIENT_TYPE
Language=English
The message recipient type (%1!d!) is not supported.
.
MessageId=0x241F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_BODYHTML_APPEND
Language=English
An error occurred adding the email HTML body text - %1
.
MessageId=0x2420
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_LOG_ATTACH_STGCREATE
Language=English
An error occurred creating storage for attachment %2!hs! - %1.
.
MessageId=0x2421
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_LOG_ATTACH_STGSTAT
Language=English
An error occurred retrieving temporary storage status for attachment %2!hs! - %1.
.
MessageId=0x2422
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_ATTACHMENT_TEXT
Language=English
An error occurred appending text to an attachment %2!hs! - %1.
.
MessageId=0x2426
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_MAILBOX_PATH
Language=English
An error occurred resolving the Server '%2!ls!' Mailbox '%3!ls!' path - %1.
.
MessageId=0x2427
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_ACL_CREATE
Language=English
An error occurred opening a Notes ACL (Access Control List) - %1.
.
MessageId=0x2428
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_ACL_STORE
Language=English
An error occurred storing the new Notes ACL (Access Control List) - %1.
.
MessageId=0x2429
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_ACL_ADDENTRY
Language=English
An error occurred creating Notes ACL entry for '%2!ls!' (ACL - Access Control List) - %1
.
MessageId=0x242A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_PASSWORD_ERR
Language=English
The password is invalid, accessing Mailbox '%2!ls!' - %1.
.
MessageId=0x242B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_DESIRED_ACCESS
Language=English
Create Email requested, but Mailbox '%1!ls!' is Read-Only.
.
MessageId=0x242C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_INIT_EXCEPTION
Language=English
An exception occurred during Notes initialization.
.
MessageId=0x242D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_LOG_ATTACH_STGEMBED
Language=English
An error occurred creating embedded storage for attachment %2!hs! - %1.
.
MessageId=0x242E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_LOG_ATTACH_STGCOPY
Language=English
An error occurred copying attachment %2!hs! to embedded temporary storage - %1.
.
MessageId=0x242F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_EMAIL_LOG_ATTACH_STAT
Language=English
An error occurred retrieving storage status for attachment %2!hs! - %1.
.
MessageId=0x2430
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_ACL_READUPDATE
Language=English
An error occurred reading the Notes ACL for update (Access Control List) - %1.
.
MessageId=0x2431
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_ACL_UPDATEDEFAULT
Language=English
An error occurred updatng the default entry in the Notes ACL (Access Control List) - %1.
.
MessageId=0x2432
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_ACL_UPDATESTORE
Language=English
An error occurred string the updated Notes ACL (Access Control List) - %1.
.
MessageId=0x2433
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_MAILBOX_ALREADY_EXISTS
Language=English
The mailbox '%1!ls!' already exists.
.
MessageId=0x2435
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_FOLDER_ALREADY_EXISTS
Language=English
The folder '%1!ls!' already exists.
.
MessageId=0x2436
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_MAILBOX_DOES_NOT_EXIST
Language=English
The mailbox '%1!ls!' does not exist.
.
MessageId=0x2439
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_INIT_THREAD
Language=English
Notes Thread Initialization failed - %1.
.
MessageId=0x243A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_APPEND_LIST_ITEM
Language=English
A Notes error occurred appending to email list item '%2!hs!' - %1.
.
MessageId=0x243B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_NTF_APPEND
Language=English
A Notes error occurred adding compound text to email NTF item '%2!hs!' - %1.
.
MessageId=0x243C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_NTF_ALLOC
Language=English
A Notes error occurred allocating %1!ld! bytes for email NTF body text. Setting Notes Status=0x%2!x!.
.
MessageId=0x243D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_NTF_ENUM
Language=English
An error occurred parsing the Notes CD Data for email NTF body text - %1.
.
MessageId=0x243E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_NTF_ITEMINFO
Language=English
A Notes error occurred querying the info of email item '%2!hs!' - %1.
.
MessageId=0x2444
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_NTF_CREATE
Language=English
A Notes error occurred creating compound text for email NTF item '%2!hs!' - %1.
.
MessageId=0x2445
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_NTF_CLOSE
Language=English
A Notes error occurred closing the email NTF item '%2!hs!' - %1.
.
MessageId=0x2446
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_FOLDER_OPEN
Language=English
An error occurred opening the folder '%2!ls!' - %1.
.
MessageId=0x2447
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_FOLDER_CREATE
Language=English
An error occurred creating the folder '%2!ls!' - %1.
.
MessageId=0x2448
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_FOLDER_SPECIAL
Language=English
An error occurred opening the special folder '%2!ls!' - %1.
.
MessageId=0x2449
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_GETID
Language=English
A Notes error occurred getting the ID of the message. The message must be persisted prior to this call.
.
MessageId=0x244A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_FOLDER_NAME_INVALID
Language=English
Folder name '%1!ls!' must contain characters other than spaces, slashes and backslashes.
.
MessageId=0x244B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_MAILTYPE_INVALID
Language=English
Message Helper was called to process an email whose client type (0x%1!08x!) is not correct.
.
MessageId=0x244C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_DELETE
Language=English
An error occurred deleting an email - %1.
.
MessageId=0x244D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_STORE
Language=English
An error occurred storing email (Note ID=%3 UNID=%4!hs!) in mailbox '%2!ls!' - %1.
.
MessageId=0x244E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_TABLE
Language=English
An error occurred creating a table to move email (Note ID=%2) to a folder - %1.
.
MessageId=0x244F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_TABLE_INSERT
Language=English
An error occurred inserting an email (Note ID=%2) into the table to move to a folder - %1.
.
MessageId=0x2450
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_TABLE_DELETE
Language=English
An error occurred deleting a table after moving email (Note ID=%2) to a folder - %1.
.
MessageId=0x2451
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_FOLDER_ADD
Language=English
An error occurred adding email (Note ID=%4) to folder '%3!ls!' of mailbox '%2!ls!' - %1.
.
MessageId=0x2452
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_FOLDER_DRAFTS
Language=English
An error occurred opening the Drafts folder - %1.
.
MessageId=0x2453
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_FOLDER_REMOVE
Language=English
An error occurred removing the email from the Drafts folder - %1.
.
MessageId=0x2454
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_BODYTEXT_ADD
Language=English
An error occurred adding text to email body - %1.
.
MessageId=0x2455
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_BODYTEXT_EMBED
Language=English
A Notes error occurred adding an email to embed into body text - %1.
.
MessageId=0x2458
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_BODY_ALREADY_SET
Language=English
An error occurred adding the email body text: Body text is already set.
.
MessageId=0x2459
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_BODYTEXT_NOBODY
Language=English
An error occurred removing the email from the Drafts folder: No body text.
.
MessageId=0x245B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_SHM_MAPPING
Language=English
An error occurred mapping the data passed to Notes Extension - %1.
.
MessageId=0x245C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_SHM_MODULE_ADDRESS
Language=English
Returned Notes Extension data does not contain module address. The Notes Extension may not be installed correctly.
.
MessageId=0x245D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NULL_CLASS_FACTORY
Language=English
NULL class factory returned for the COM object to instanciate to query the interface %1.
.
MessageId=0x245E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_CLASS_FACTORY
Language=English
An error occurred querying the class factory of the COM object to instanciate to query the interface %2 - %1.
.
MessageId=0x245F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_MEMALLOC_FAILED
Language=English
An error occurred allocating %2!u! bytes of memory - %1.
.
MessageId=0x2460
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_SETMAILITEM
Language=English
A Notes error occurred setting text of email item '%2!hs!' - %1.
.
MessageId=0x2461
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_NAME_INVALID
Language=English
Mailbox name '%1!ls!' must not start with a space.
.
MessageId=0x2462
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_CSLD_IMPORT
Language=English
CSLD returned an error importing an email from file '%4!ls!' - CSLD Error: %3!ld!. %2 translation: %1.
.
MessageId=0x2463
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_FILE_DELETE
Language=English
A file system error occurred deleting file '%2' - %1.
.
MessageId=0x2464
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_FILE_CREATE
Language=English
A file system error occurred creating file '%2' - %1.
.
MessageId=0x2465
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_FILE_WRITE
Language=English
A file system error occurred writing %3!ld! bytes to file '%2' - %1.
.
MessageId=0x2466
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_FILE_CLOSE
Language=English
A file system error occurred closing file '%2' - %1.
.
MessageId=0x2467
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_SWITCH_PASSWORD
Language=English
The password for this User ID File '%2!ls!' is invalid - %1.
.
MessageId=0x2468
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_SWITCH_USER
Language=English
An error occurred switching to User ID File '%2!ls!' - %1.
.
MessageId=0x246E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_GETNOTETABLE
Language=English
A Notes error occurred getting the Note ID table from the Notes Database '%2!ls!' - %1.
.
MessageId=0x246F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_REPLICAINFO
Language=English
A Notes error occurred getting replication information from the Notes Database '%2!ls!' - %1.
.
MessageId=0x2470
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_NOTECOPY
Language=English
A Notes error copying Note (Note ID=%4) from the Notes Database '%2!ls!' to '%3!ls!' - %1.
.
MessageId=0x2471
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_OPEN_TEMPLATE
Language=English
A Notes error occurred opening Notes Template '%3!ls!' - %1.
.
MessageId=0x2472
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_LIST_ADD
Language=English
An error occurred adding to Notes List '%2!hs!' - %1.
.
MessageId=0x2473
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_LIST_LOCK
Language=English
An error occurred locking Notes List '%1!hs!' (Note ID=%2).
.
MessageId=0x2474
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_LIST_CREATE
Language=English
An error occurred creating a Notes List's content - %1.
.
MessageId=0x2475
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_ITEM_DELETE
Language=English
A Notes error occurred deleting item '%2!hs!' from email (Note ID=%3) - %1.
.
MessageId=0x2476
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_ITEM_APPEND
Language=English
A Notes error occurred appending item '%2!hs!' to email (Note ID=%3) - %1.
.
MessageId=0x2477
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_CREATE_EXCEPTION
Language=English
An exception occurred copying the Notes template '%2!ls!' while creating the mailbox '%1!ls!'.
.
MessageId=0x2478
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_INFOGET
Language=English
A Notes error occurred getting database info while creating mailbox '%2!ls!' - %1.
.
MessageId=0x2479
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_INFOSET
Language=English
A Notes error occurred setting database info while creating mailbox '%2!ls!' - %1.
.
MessageId=0x247A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_ICONNOTEOPEN
Language=English
A Notes error occurred opening '%2!ls!' icon note while creating mailbox '%3!ls!' - %1.
.
MessageId=0x247B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_ICONNOTECLOSE
Language=English
A Notes error occurred closing '%2!ls!' icon note while creating mailbox '%3!ls!' - %1.
.
MessageId=0x247C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_ICONNOTESET
Language=English
An error occurred setting icon note title ('%3!ls!') while creating mailbox '%2!ls!' - %1.
.
MessageId=0x247D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_ICONNOTEUPDATE
Language=English
A Notes error occurred updating icon note while creating mailbox '%2!ls!' - %1.
.
MessageId=0x247E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_ICONNOTECOPY
Language=English
A Notes error occurred copying '%2!ls!' icon note while creating mailbox '%3!ls!' - %1.
.
MessageId=0x247F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_ICONNOTEGENOID
Language=English
A Notes error occurred generating new icon note Originator ID (OID) while creating mailbox '%2!ls!' - %1.
.
MessageId=0x2480
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_COPYACL
Language=English
A Notes error occurred copying the template ACL while creating mailbox %2!ls! - %1.
.
MessageId=0x2481
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_MAILBOX_USERNAME
Language=English
An error occurred getting Notes' username while creating mailbox '%2!ls!' - %1.
.
MessageId=0x2482
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_FOLDER_OPEN_EXCEPTION
Language=English
An exception occurred opening folder '%1!ls!'.
.
MessageId=0x2484
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_FORMAT_ADDRESS
Language=English
A Notes error occurred formatting an address - %1.
.
MessageId=0x2485
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_EMAIL_SET_SUBJECT
Language=English
An error occurred setting the email subject - %1.
.
MessageId=0x2486
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_ATTACHMENT_GETTYPE
Language=English
An error occurred getting the attachment type - %1.
.
MessageId=0x2487
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_ATTACHMENT_PROPERTIES
Language=English
An error occurred getting the attachment properties interface - %1.
.
MessageId=0x2488
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_ATTACHMENT_DISPLAYNAME
Language=English
An error occurred getting the attachment display name - %1.
.
MessageId=0x2489
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_ATTACHMENT_PATHNAME
Language=English
An error occurred getting the attachment path name - %1.
.
MessageId=0x248B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_SWITCH_NOKEYFILE
Language=English
There is no Notes User ID File associated with this Windows NT User. Please log in to Notes before trying again.
.
MessageId=0x248C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_FOLDER_OPENEXISTING
Language=English
An error occurred opening existing folder '%2!ls!' - %1.
.
MessageId=0x248D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_MAILHELP_LOG_MAILBOX_SERVER
Language=English
'%1!ls!' on '%2!ls!'.
.
MessageId=0x248E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_MAILHELP_LOG_MAILBOX_LOCAL
Language=English
'%1!ls!' (Local).
.
MessageId=0x248F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_FOLDER_DELETE
Language=English
An error occurred deleting folder '%2!ls!' - %1.
.
MessageId=0x2490
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_FOLDER_DOCCOUNT
Language=English
An error occurred getting the count of documents in Notes folder '%2!ls!' - %1.
.
MessageId=0x2491
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_MAILHELP_LOG_NOTES_MAILBOX_LIST_FULL
Language=English
An error occurred adding to Notes List '%2!hs!' - Notes List is full - %1.
.
MessageId=0x2492
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_MAILHELP_LOG_NOTES_MAILBOX_LIST_MAX
Language=English
Adding text to Notes list '%1!hs!' would exceed the maximum Notes summary list size (%2!u! > %3!u!).
.
MessageId=0x2494
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_SMTP_MAIL_FROM
Language=English
The SMTP MAIL FROM command failed: Error code %1 - %2.
.
MessageId=0x2496
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_SMTP_MAIL_RCPT
Language=English
The SMTP MAIL RCPT command failed for '%1': Error code %2 - %3.
.
MessageId=0x2497
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_SMTP_MAIL_DATA_SEND
Language=English
Failed to send the SMTP MAIL DATA: Error code %1 - %2.
.
MessageId=0x2498
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_SMTP_MAIL_DATA
Language=English
The SMTP MAIL DATA command failed: Error code %1 - %2.
.
MessageId=0x2499
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_SMTP_CONNECT
Language=English
Failed to connect to SMTP server %1 port %2: Error code %3 - %4.
.
MessageId=0x249A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_SMTP_NO_COMMANDS
Language=English
The SMTP server is not accepting commands: Reply code %1 - %2.
.
MessageId=0x249B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_SMTP_EHLO_FAILED
Language=English
Failed to send SMTP EHLO/HELO command: Error code %1 - %2.
.
MessageId=0x249C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_SMTP_EHLO_HELO
Language=English
The SMTP MAIL EHLO/HELO command failed: Reply code %1 - %2.
.
MessageId=0x24A0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_SMTP_LOG_AUTHENTICATION_FAILED
Language=English
The SMTP AUTH command failed: Error code %1 - %2.
.
MessageId=0x24A1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MAILHELP_LOG_NOTES_EMAIL_DELETE
Language=English
An error occurred deleting an email (Note ID=%2) - %1.
.
;
; // EMail Helper CSLD Log Messages 0x24F0 to 0x24FF
;
MessageId=0x24F0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CSLD_LOG_UNKNOWN_ERROR
Language=English
An unknown error ('%1!d!') occurred processing the CSLD File.
.
MessageId=0x24F1 ; CSLD Error -1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CSLD_LOG_OPENOUTFILE
Language=English
An error occurred opening the CSLD File.
.
MessageId=0x24F2 ; CSLD Error -2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CSLD_LOG_WRITEFILE
Language=English
An error occurred writing the CSLD File.
.
MessageId=0x24F3 ; CSLD Error -3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CSLD_LOG_MEMALLOC
Language=English
An error occurred allocating memory for the CSLD File.
.
MessageId=0x24F4 ; CSLD Error -4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CSLD_LOG_OPENINFILE
Language=English
An error occurred opening the CSLD File.
.
MessageId=0x24F5 ; CSLD Error -5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CSLD_LOG_WRITENOTE
Language=English
An error occurred writing the Note extracted from the CSLD File.
.
MessageId=0x24F6 ; CSLD Error -6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CSLD_LOG_READFILE
Language=English
An error occurred reading the CSLD File.
.
MessageId=0x24F7 ; CSLD Error -7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CSLD_LOG_FILENOTCSN
Language=English
The file is not a CSLD File.
.

;
; // Task Manager / Scheduler Log Codes 0x2500 to 0x25FF
;
MessageId=0x2500
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_TASK_USAGE
Language=English
Usage: WgnTask <task definition filename> [options]%n
       where options are from :%n
       -?, -h    : print this help text.%n
       -e        : show error codes.%n
       -l <ll>   : set logging level to <ll> [1-4] (Default 2).%n
       -v        : verbose output (normally quiet except for errors).
.
MessageId=0x2501
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_TASK_PARSE_FILE
Language=English
Parsing the %1 file: '%2'.
.
MessageId=0x2502
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_TASK_FILE_PARSED
Language=English
The %1 file: '%2' was successfully parsed.
.
MessageId=0x2503
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TASK_READING_FILE
Language=English
There was an error reading %1 file '%2'.
%3
.
MessageId=0x2504
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TASK_PARSING_FILE
Language=English
Parse error at line %2!d! of the %1 file.
%3
.
MessageId=0x2505
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TASK_OPENING_FILE
Language=English
Unable to open the %1 '%2'.
.
MessageId=0x2506
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TASK_SEMANTICS_FILE
Language=English
Parser semantic error at line %2 of the %1 file.
%3
.
MessageId=0x2507
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_TASK_EXECUTING_TASK
Language=English
Executing task '%1' using task definition file '%2'.
.
MessageId=0x2508
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TASK_FAILED_EXECUTION
Language=English
Failed to execute task '%1'.
.
MessageId=0x2509
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TASK_INITIALIZING_PROGRESS
Language=English
Failed to initialize the task progress component.%n
%1
.
MessageId=0x250a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TASK_INITIALIZING_MODULE
Language=English
Failed to initialize the dll for module %1.%n
%2
.
MessageId=0x250b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TASK_NO_MODULE_SPECIFIED
Language=English
The task definition file did not specify a module_name or GUID for the module to be executed. 
.
MessageId=0x250c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TASK_FAILED
Language=English
WgnTask failed with errors. 
.
MessageId=0x250d
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_TASK_STARTED
Language=English
Started task '%1'. 
.
MessageId=0x250e
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_TASK_COMPLETED
Language=English
Completed task '%1'. 
.
MessageId=0x250f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_TASK_NO_FILE_BUFFER
Language=English
An error occurred when trying to allocate a buffer of %!d! characters for reading the task definition file.
.
;
; // Universal Extractor Log Codes 0x2600 to 0x26FF
;
MessageId=0x2600
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_TASK_DEFINITION_PARSED
Language=English
The task definition file: '%1' was successfully parsed in the UE module.
.
MessageId=0x2601
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_SP_FAILED
Language=English
Failed to run the stored procedure '%1.%2'. %3.
.
MessageId=0x2602
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_NULL_RESULTSET
Language=English
The stored procedure returned a NULL resultset.
.
MessageId=0x2603
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_NO_DATASTORE_OBJECT
Language=English
A failure occurred trying to initialize the datastore services object.
.
MessageId=0x2604
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_NO_QUERY_OBJECT
Language=English
A failure occurred trying to initialize the database query object.
.
MessageId=0x2605
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_SP_PARAMS
Language=English
A failure occurred trying to initialize the database query parameters object.
.
MessageId=0x2606
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_NO_DIR_ACCESS
Language=English
Failed to access %1 directory '%2'.
.
MessageId=0x2607
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_NO_DIR
Language=English
%1 directory '%2' does not exist.
.
MessageId=0x2608
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_NO_REMOTE_PREFIX
Language=English
No remote prefix was specified. The prefix used to identify the archive system must be defined.
.
MessageId=0x2609
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_NOT_LOGGED_ON
Language=English
Failed to log in to the infrastructure.
.
MessageId=0x260a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_READ_RESULTS_FAILED
Language=English
Unable to read the results from '%1.%2' stored procedure.
.
MessageId=0x260b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_RENAMING_XML_FILE
Language=English
Unable to rename file '%1' to '%2'.%n
%3
.
MessageId=0x260c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_WRITING_XML_FILE
Language=English
Failed to write the exported event XML file(s).%n
%1
.
MessageId=0x260d
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_ACK_EVENT
Language=English
Acknowledging event %1!d!.
.
MessageId=0x260e
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_ACK_FILE_DELETED
Language=English
Acknowledgment file '%1' deleted.
.
MessageId=0x260f
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_ACK_OK
Language=English
Acknowledged %1!d! exported events.
.
MessageId=0x2610
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_COMMIT_OK
Language=English
Committed %1!d! exported events.
.
MessageId=0x2611
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_NO_ACK_EVENTS
Language=English
No events were found in acknowledgement file '%1'.
.
MessageId=0x2612
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_NO_ACK_FILES
Language=English
No acknowledgement files were found that required processing.
.
MessageId=0x2613
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_PROCESS_ACK_FILE
Language=English
Processing acknowledgement file '%1'.
.
MessageId=0x2614
Severity=Success
Facility=Wigan
SymbolicName=WGN_I_UE_WRITE_EVENT
Language=English
Writing details for event %1!d!.
.
MessageId=0x2615
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_XML_FILES_WRITTEN
Language=English
Successfully wrote %1!d! event export XML files.
.
MessageId=0x2616
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_SP_RAN_OK
Language=English
Stored procedure '%1.%2' ran successfully in %3 s.
.
MessageId=0x2617
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_NO_EXPORT_EVENTS
Language=English
No events were found meeting the specified criteria that had metadata to export.
.
MessageId=0x2618
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_LOGGED_ON
Language=English
The Universal Extractor successfully logged in to the CMS server.
.
MessageId=0x2619
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_LOGGED_OFF
Language=English
The Universal Extractor successfully logged out from the CMS server.
.
MessageId=0x261a
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_CALLING_SP
Language=English
Calling stored procedure '%1.%2'.
.
MessageId=0x261b
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_COMMITTING_EXPORTS
Language=English
Commiting the exported event metadata.
.
MessageId=0x261c
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_BULK_ACKNOWLEDGE_EXPORT
Language=English
Acknowledging all events exported on %1.
.
MessageId=0x261d
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_NO_EXPORT_TIMESTAMP
Language=English
No 'exportTimestamp' attribute was found on the 'events' element of the acknowledgement file, this is required for bulk acknowledgement.
.
MessageId=0x261e
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_XML_ERROR
Language=English
An error occurred when trying to retrieve the XML for the event.%n
%1
.
MessageId=0x261f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_INSUFFICIENT_PRIVILEGE
Language=English
The current user %1%2%3does not have the '%4' privilege required to execute module '%5'.
.
MessageId=0x2620
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UE_DB_NOT_SUPPORTED
Language=English
The CMS database version does not support this Universal Extractor task.
.
MessageId=0x2621
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_XML_BATCH_RETRIEVAL
Language=English
The metadata XML is being retrieved for a batch of %1 events.
.
MessageId=0x2622
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_GOT_CANDIDATES
Language=English
%1 events were identified as candidates for export.
.
MessageId=0x2623
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_COMPLETE
Language=English
The UE exported the metadata for %1 events in %2 s.
.
MessageId=0x2624
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_UE_CRITERIA
Language=English
The UE will use the following criteria: %1
.
MessageId=0x2625
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_UE_GENERIC_MESSAGE
Language=English
%1
.

;
; // XML Parser Log Codes 0x2700 to 0x27FF
;
MessageId=0x2700
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XML_WRONG_NODE_TYPE
Language=English
The current node type cannot contain sub nodes.
.
MessageId=0x2701
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XML_INVALID_NODE_NAME
Language=English
Could not create a sub node as an invalid or empty node name was supplied
.
MessageId=0x2702
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XML_NO_DATA_SUPPLIED
Language=English
Could not create a data node as no data was supplied
.
MessageId=0x2703
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XML_NO_ATTRIBUTE_SUPPLIED
Language=English
Could not create a attribute node as no attribute name was supplied
.
MessageId=0x2704
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XML_PARSE
Language=English
Error parsing XML.
.
MessageId=0x2705
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XML_BUILD_ATTRIBUTE
Language=English
XML Builder: Attempting to build an attribute outside of a tag.
.
MessageId=0x2706
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XML_BUILD_TOO_MANY_ENDNODES
Language=English
XML Builder: Too many EndNodes.
.
MessageId=0x2707
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_INVALID_XML_TREE
Language=English
Invalid XMLtree format.
.
MessageId=0x2708
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XML_TOO_MANY_TOP_LEVEL_NODES
Language=English
Attempting to add more than one top level XML node.
.
MessageId=0x2709
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XML_ROOT_DATA
Language=English
Attempting to add data or attributes to the root XML object.
.
MessageId=0x270A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XML_MORE_THAN_ONE_MATCH
Language=English
The xml path returned more than one matching node.
.
MessageId=0x270B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XML_NO_MATCHES
Language=English
The xml path didn't return any matching nodes.
.
MessageId=0x270C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XML_CANNOT_BUILD_XML
Language=English
Attempted to auto-generate an xml tree including a complex query.
.
MessageId=0x270D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XPATH_INVALID_SYNTAX
Language=English
Invalid XPath syntax
.
MessageId=0x270E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XMLMERGEINSTANCE_EMPTYSTRING
Language=English
Attempted to add an xml merge instance with a zero length xml string
.
MessageId=0x270F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XMLMERGEINSTANCE_NOTFOUND
Language=English
Couldn't find matching XML Merge Instance
.
MessageId=0x2710
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XMLMERGE_TOPLEVELONLY
Language=English
Can only merge at the top level XML node
.
MessageId=0x2711
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_XML_NOT_MATCHING_SCHEMA
Language=English
The XML doesn't match its schema.
.
; // Credentials Codes 0x2800 to 0x287F
;
MessageId=0x2800
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CREDENTIALS_INVALID_PARAMETERS
Language=English
The command-line parameters are invalid.
.
MessageId=0x2801
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CREDENTIALS_SET_FAILED
Language=English
Failed to set the credentials - %1.
.
MessageId=0x2802
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CREDENTIALS_CLEAR_FAILED
Language=English
Failed to clear the credentials - %1.
.
MessageId=0x2803
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CREDENTIALS_QUERY_FAILED
Language=English
Failed to query the credentials - %1.
.
MessageId=0x2804
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CREDENTIALS_COMPONENT_LIST
Language=English
Failed to read the component list - %1.
.

; // Policy Tools Codes 0x2880 to 0x28FF
;
MessageId=0x2880
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POL_FILE_REQUIRED
Language=English
The command-line parameters are invalid: A file name is required when exporting multiple policies.
.
MessageId=0x2881
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POL_NOT_SETTING_TYPE
Language=English
This policy setting is of an invalid type for the impsetting operation.
.
MessageId=0x2882
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POL_NOT_LIST_TYPE
Language=English
This policy setting is of an invalid type for the implist operation.
.
MessageId=0x2883
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POL_NO_POLICY_NAME
Language=English
Missing XML 'Name:' comment.
.
MessageId=0x2884
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POL_CANNOT_IMPORT_COMPLETE
Language=English
Only sparse XML documents should be imported.
.
MessageId=0x2885
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POL_DOCUMENT_NOT_COMPLETE
Language=English
The 'Complete' option is not appropriate when importing a sparse policy.
.
MessageId=0x2886
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POL_EMPTY_PASSWORD_STRINGS_PROHIBITED
Language=English
A password must be entered to log in.
.
MessageId=0x2887
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POL_BAD_USERNAME_OR_PASSWORD
Language=English
An unknown user name or incorrect password was supplied.
.

; // RDI Log Codes 0x2900 to 0x29FF
;
MessageId=0x2900
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_RDI_PROCESSING_EMAIL
Language=English
Importing %1 object with Message id "%2!ls!".
.
MessageId=0x2901
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_FAILED_EMAIL
Language=English
Failed email with Unique id "%1!ls!". Error was %2.
.
MessageId=0x2902
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_RDI_PROCESSED_EMAIL
Language=English
Successfully processed email with Unique id "%1!ls!".
.
MessageId=0x2903
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_HUB_NOT_INSTALLED	
Language=English
Policy Engine Hub not installed.
.
MessageId=0x2904
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_PE_NOT_INSTALLED	
Language=English
Policy engine not installed.
.
MessageId=0x2905
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_FAILED_TO_CREATE_HUB	
Language=English
Failed to create Policy Engine Hub, error %1. Entering failure mode. 
.
MessageId=0x2906
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_FAILED_TO_CREATE_PE	
Language=English
Failed to create Policy Engine, error %1. Entering failure mode. 
.
MessageId=0x2907
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_FAILED_TO_GET_LOCAL_NAME	
Language=English
Failed to retrieve local computer name, error %1. Entering failure mode. 
.
MessageId=0x2908
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_FAILED_TO_REGISTER_WITH_HUB	
Language=English
Failed to register with Policy Engine Hub, error %1. Entering failure mode. 
.
MessageId=0x2909
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_FAILED_TO_REGISTER_WITH_PE
Language=English
Failed to register with Policy Engine, error %1. Entering failure mode. 
.
MessageId=0x290A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_RDI_LOG_CONNECTED_TO_PE	
Language=English
Successfully connected to the Policy Engine.
.
MessageId=0x290B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_FAILED_TO_CONFIGURE_HUB	
Language=English
Failed to configure the Policy Engine Hub, error %1. Entering failure mode. 
.
MessageId=0x290C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_FAILED_TO_CONFIGURE_PE	
Language=English
Failed to configure the Policy Engine, error %1. Entering failure mode. 
.
MessageId=0x290D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_ENTERING_FAILURE_MODE_LOG
Language=English
Entering failure mode, no more data will be processed until the system is reconfigured. Reason was: %1. 
.
MessageId=0x290E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_RDI_LOG_CONNECTED_TO_HUB	
Language=English
Successfully connected to the Policy Engine Hub.
.
MessageId=0x290F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_XML_ATTRIBUTE_MISSING
Language=English
XML Element %1: Required attribute missing: %2.
.
MessageId=0x2910
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_XML_DATA_MISSING
Language=English
XML Element %1: has no data.
.
MessageId=0x2911
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_XML_ELEMENT_MISSING
Language=English
XML Element %1: Required child element not found (%2).
.
MessageId=0x2912
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_ADDPARTICIPANTS
Language=English
An error occurred adding participants to the Event (%1).
.
MessageId=0x2913
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_IMPORTOBJ_TYPE
Language=English
The Import Object Type is invalid (%1).
.
MessageId=0x2914
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_IMPORTOBJ_FORMAT
Language=English
The Import Object Format is invalid (%1).
.
MessageId=0x2915
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_IMPORTOBJ_TRANSPORT
Language=English
The Import Object Transport is invalid (%1).
.
MessageId=0x2916
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_IMPORT_SOURCE
Language=English
The Import Object Source is invalid (%1).
.
MessageId=0x2917
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_LOG_IMPORT_COMBINATION
Language=English
The Import Object combination is invalid (Type=%1, Format=%2, Transport=%3).
.

; // Credentials Codes 0x2A00 to 0x2AFF
; // cnv2email
;
MessageId=0x2A00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_UNSUPPORTED_CNV_SOURCE
Language=English
Source of CNV file unsupported.
.

; // RDI Status Codes 0x2B00 to 0x2BFF
;
;
MessageId=0x2B00
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_RDI_RESULT_PENDING
Language=English
Result pending asynchronous processing.
.
MessageId=0x2B01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_IMPORT_OBJECT_NOT_FOUND
Language=English
The Import Object for the supplied interface could not be found.
.
MessageId=0x2B02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_IMPORT_OBJECT_ALREADY_PROCESSING
Language=English
An attempt was made to import an Import Object that is already processing.
.
MessageId=0x2B03
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_INVALID_XML
Language=English
The supplied additional attributes XML is invalid.
.
MessageId=0x2B04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_COMMIT_OR_ROLLBACK_ALREADY_CALLED
Language=English
Commit() or Rollback() has already been called for this event.
.
MessageId=0x2B05
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_IMPORT_CAUGHT_EXCEPTION
Language=English
An exception was caught within an ImportObject() or ImportObjectAsync() call.
.
MessageId=0x2B06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_CHANGING_SYNC_MODE
Language=English
An attempt was made to Commit() an event using a different sync mode to the ImportObject() call.
.
MessageId=0x2B07
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_RDI_DATA_REQUIRED
Language=English
The data is required for the analysis of this event.
.
MessageId=0x2B0F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_XML_ATTRIBUTE_MISSING
Language=English
XML Element required attribute missing.
.
MessageId=0x2B10
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_XML_DATA_MISSING
Language=English
XML Element has no data.
.
MessageId=0x2B11
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_XML_ELEMENT_MISSING
Language=English
XML Element required child element not found.
.
MessageId=0x2B13
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_IMPORTOBJ_TYPE
Language=English
The Import Object Type is invalid.
.
MessageId=0x2B14
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_IMPORTOBJ_FORMAT
Language=English
The Import Object Format is invalid.
.
MessageId=0x2B15
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_IMPORTOBJ_TRANSPORT
Language=English
The Import Object Transport is invalid.
.
MessageId=0x2B16
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_IMPORT_SOURCE
Language=English
The Import Object Source is invalid.
.
MessageId=0x2B17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RDI_IMPORT_COMBINATION
Language=English
The Import Object combination is invalid.
.

; // 
; // Socket Agent Messages 0x2C00 to 0x2CFF
; // These messages are equivalent to Socket Agent Log Messages 0x2D00 - 0x2DFF.
; //
; // NOTEWELL: The messages below SHOULD NOT contain variables. They are returned to
; // Customer programs, which do not have access to the variables. If you wish to include
; // variables for logging, make a duplicate of the 0x2c00 message in the 0x2D00 series.
; //
MessageId=0x2C06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_EXCEPTION_PROCESS_MESSAGE
Language=English
An exception was caught while processing a message.
.
MessageId=0x2C07
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_EXCEPTION_OUTER_FORWARD
Language=English
An exception was caught while receiving and processing a message.
.
MessageId=0x2C08
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_NO_DATA_HEADER
Language=English
Socket Agent packet data too small to contain a data header.
.
MessageId=0x2C0A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_DATACOUNT_ZERO
Language=English
Socket Agent packet data header data element count must not be zero.
.
MessageId=0x2C0B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_NO_DATA_ELEMENT
Language=English
Socket Agent packet data does not contain a data element.
.
MessageId=0x2C0C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_INVALID_DATA_ELEMENT
Language=English
Socket Agent packet data contains incomplete data element header.
.
MessageId=0x2C0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_PARTIAL_DATA_ELEMENT
Language=English
Socket Agent packet data contains incomplete data element.
.
MessageId=0x2C0E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_UNEXPECTED_DATA
Language=English
Socket Agent packet data contains unexpected data after last data element.
.
MessageId=0x2C10
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_TOO_MANY_DATA_ELEMENT
Language=English
Socket Agent packet data contains too many data elements.
.
MessageId=0x2C11
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_CREATE_IACTIVEIMPORT
Language=English
An error occurred creating an instance of the Active Import Interface.
.
MessageId=0x2C12
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_IACTIVEIMPORT_ERROR
Language=English
An error was returned from a call to Import an Object on an Active Import Interface.
.
MessageId=0x2C13
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_DUPLICATE_METADATA
Language=English
The data contains more than one XML metadata element.
.
MessageId=0x2C14
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_FLAGSREQ_FIELD
Language=English
The schema version does not support these Request Message Data Header Request Flags.
.
MessageId=0x2C15
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_FLAGSRSP_FIELD
Language=English
The schema version does not support these Request Message Data Header Response Flags.
.
MessageId=0x2C17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_NO_DATA_DATA_ELEMENT
Language=English
The External Agent Socket API Request Message requires at least 1 data element containing data.
.
MessageId=0x2C1C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_FORMAT_ERROR
Language=English
An error occurred formatting the Response Message.
.
MessageId=0x2C21
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_DUPLICATE_XML_ADD_ATTRIBUTES
Language=English
The Completion Message data packet contains more than one XML additional attributes data element.
.
MessageId=0x2C22
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_DATA_ELEMENT_TYPE
Language=English
The External Agent Socket API Request Message does not support this type of data element.
.
MessageId=0x2C23
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_COMPLDATA_ELEMENT_TYPE
Language=English
The External Agent Socket API Completion Message does not support this type of data element.
.
MessageId=0x2C24
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_COMPLETION_NO_MESSAGE
Language=English
The External Agent Socket API was called to complete a Request Message. No message with that Completion ID was found. The message may have timed out.
.
MessageId=0x2C25
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_COMPLETION_ROLLBACK
Language=English
The External Agent Socket API failed to rollback a delayed completion.
.
MessageId=0x2C26
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_COMPLETION_COMMIT
Language=English
The External Agent Socket API failed to commit a delayed completion.
.
MessageId=0x2C27
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MESSAGE_SIZE
Language=English
The length of a received message is not a multiple of 4 bytes long.
.
MessageId=0x2C28
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MESSAGE_SIZE_TOO_SMALL
Language=English
The length of a received message is smaller than the smallest possible message.
.
MessageId=0x2C29
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_SCHEMA_PACKET_CONTENT_MISMATCH
Language=English
The received packet contains data that is not supported by the schema version specified in the packet.
.
MessageId=0x2C30
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MESSAGE_ABANDONED
Language=English
The Socket Agent was shut down before the message could be processed.
.
MessageId=0x2C31
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_INVALID_SCHEMA
Language=English
Message schema was not recognized.
.
MessageId=0x2C32
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MESSAGE_SIZE_MISMATCH
Language=English
The length of the received message buffer does not match the message length in the header.
.
MessageId=0x2C33
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_NO_MESSAGE_BODY
Language=English
The message was empty.
.
MessageId=0x2C34
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_INVALID_MESSAGE_FOOTER
Language=English
Message footer was invalid.
.
MessageId=0x2C35
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_DATA_STRING
Language=English
The data string was not a multiple of 2 bytes. It must be UTF-16 Big Endian.
.
MessageId=0x2C36
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MESSAGEID_DATA_SIZE
Language=English
The Message ID size + Message ID Data Element fixed data size + data element fixed size data must be equal to the Data Element Data Size.
.
MessageId=0x2C37
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MESSAGE_UNIQUEID
Language=English
The Completion Message Unique ID cannot be zero. Set to the Message Unique ID from the Message Response.
.
MessageId=0x2C38
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_FLAGSCMP_FIELD
Language=English
The schema version does not support Completion Message Completion Flags value.
.
MessageId=0x2C39
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_FLAGSCMR_FIELD
Language=English
The schema version does not support Completion Message Response Flags value.
.
MessageId=0x2C3B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_OBJECT_TRANSPORT
Language=English
The schema version does not support Request Message Object Transport value.
.
MessageId=0x2C3C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_RESERVED1REQ_NONZERO
Language=English
Socket Agent Request Message Data Header Reserved1 field must be zero.
.
MessageId=0x2C3D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_RESERVED2REQ_NONZERO
Language=English
Socket Agent Request Message Data Header Reserved2 field must be zero.
.
MessageId=0x2C3E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_RESERVED1CMP_NONZERO
Language=English
Socket Agent Completion Message Data Header Reserved1 field must be zero.
.
MessageId=0x2C3F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_CREATE_ICOMBOSTREAM
Language=English
An error occurred creating an instance of a Combo Stream.
.
MessageId=0x2C40
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_ICOMBOATTACH
Language=English
An error occurred attaching the memory to a Combo Stream Interface.
.
MessageId=0x2C41
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_CREATE_IIMPORTFILEOBJECT
Language=English
An error occurred creating an instance of an Import File Object.
.
MessageId=0x2C42
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_INITIALIZE_FILE_OBJECT
Language=English
An error occurred initializing an Import File Object Interface.
.
MessageId=0x2C43
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_QUERY_ICOMBOSTREAM
Language=English
An error occurred querying a Combo Stream for a Stream Interface.
.
MessageId=0x2C44
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_EXCEPTION_IMPORT_OBJECT
Language=English
An exception occurred Importing an Object on the Active Import Connector.
.
MessageId=0x2C45
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_EXCEPTION_COMMIT_DEFERRED
Language=English
An exception occurred committing a deferred Import Object.
.
MessageId=0x2C46
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_TOOMANY_DATA_ELEMENTS
Language=English
More than one object data element (e.g. RFC822 data element) was found, Only 1 object data element is permitted for this object type.
.
MessageId=0x2C47
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_ADDSTREAM_FILE_OBJECT
Language=English
An error occurred adding a stream to an Import File Object.
.
MessageId=0x2C49
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_BACKGROUND_THREAD
Language=English
An error occurred creating the Background Thread
.
MessageId=0x2C4A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MESSAGE_TIMEOUT
Language=English
The message has timed out.
.
MessageId=0x2C4B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_SETREMOTEDATALOCATION
Language=English
The External Agent Socket API failed to set the Message ID.
.
MessageId=0x2C4C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_SETMESSAGEATTRIBUTES
Language=English
The External Agent Socket API failed to set the message attributes.
.
MessageId=0x2C52
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_WRITE_ISTREAM
Language=English
An error occurred writing to a Stream Interface.
.
MessageId=0x2C53
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_WRITE_ISTREAM_PART
Language=English
Only part of the data was able to be written to the Stream Interfaces.
.
MessageId=0x2C5A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_NO_FILENAME_DATA_ELEMENT
Language=English
The Object Transport is filename, but no file name data element was provided.
.
MessageId=0x2C5B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_ELEMENT_COUNT
Language=English
Socket Agent packet Request Message Data Header element count was more than the number of data elements in the Request Message.
.
MessageId=0x2C5C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_SETPAGETHRESHOLD
Language=English
An error occurred setting the paging threshold of a Combo Stream.
.
MessageId=0x2C5D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_CREATE_IIMPORTCONFIG
Language=English
An error occurred creating an instance of an Import Importer Configuration Interface.
.
MessageId=0x2C5E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_SETIMPORTDESTINATION
Language=English
An error occurred setting the Importer Destination.
.
MessageId=0x2C61
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_CANCEL_DATA
Language=English
A Socket Agent Cancel Message contains data. Cancel messages cannot contain data.
.
MessageId=0x2C62
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SOCKETAGENT_CANCEL_NO_MESSAGE
Language=English
A Socket Agent Cancel Message was received for a Message Number that is not currently processing and cannot be canceled.
.
MessageId=0x2C63
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_FLAGSDATA_FIELD
Language=English
The schema version does not support Message Data Element Flags value.
.
MessageId=0x2C64
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_FLAGSDATA_INCOMPLETE
Language=English
The Message Data Element Incomplete Flag value is only valid if the message is incomplete.
.
MessageId=0x2C66
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_INVALID_CONTINUATION
Language=English
A Socket Agent Message Continuation was received, but message continuation is not supported for this Message Type.
.
MessageId=0x2C67
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_DUPLICATE_FILENAME
Language=English
The Socket Agent Request Message data contains more than one Filename element.
.
MessageId=0x2C69
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MESSAGEID_INCOMPLETE
Language=English
The Socket Agent Request Message is complete, but the Message ID is incomplete.
.
MessageId=0x2C6A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_FILENAME_INCOMPLETE
Language=English
The Socket Agent Request Message is complete, but the Filename is incomplete.
.
MessageId=0x2C6B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_XMLMETADATA_INCOMPLETE
Language=English
The Socket Agent Request Message is complete, but the XML Metadata is incomplete.
.
MessageId=0x2C6C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_STREAMNAME_INCOMPLETE
Language=English
The Socket Agent Request Message is complete, but a Stream name is incomplete.
.
MessageId=0x2C6D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_STREAMDATA_INCOMPLETE
Language=English
The Socket Agent Request Message is complete, but a Stream data element is incomplete.
.
MessageId=0x2C6E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_XMLADDATTRIBUTES_INCOMPLETE
Language=English
The Socket Agent Completion Message is complete, but the XML Additional Attributes are incomplete.
.
MessageId=0x2C70
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_DUPLICATE_DATAELEMENT
Language=English
A data element of this type has already been processed for this message.
.
MessageId=0x2C71
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_STRING_INVALID
Language=English
A data element string must be wide characters in Network Byte Order. The supplied string is not a multiple of 2 bytes.
.
MessageId=0x2C72
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MULTIPART_CONTINUE
Language=English
The Multipart Intermediate flag or Multipart Last flag was not set, but other parts of this message have been received.
.
MessageId=0x2C73
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MULTIPART_NEW
Language=English
The Multipart Intermediate flag or Multipart Last flag was set, but no other parts of this message have been received.
.
MessageId=0x2C74
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MULTIPART_COMPLETE
Language=English
The Multipart continuation was received, but the message is already complete.
.
MessageId=0x2C79
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MULTIPART_OBJTYPE
Language=English
A Multipart Message Object Type conflicts with the object type of an earlier message part.
.
MessageId=0x2C7A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MULTIPART_OBJFMT
Language=English
A Multipart Message Object Format conflicts with the object format of an earlier message part.
.
MessageId=0x2C7B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MULTIPART_OBJTRANS
Language=English
A Multipart Message Object Transport conflicts with the Object Transport of an earlier message part.
.
MessageId=0x2C7C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MESSAGEID_TOO_LARGE
Language=English
The Message ID data size is too large for the Message ID Data Element size.
.
MessageId=0x2C7D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MESSAGEID_TOO_SMALL
Language=English
The Message ID Data Element is too small to contain a Message ID structure.
.
MessageId=0x2C7E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_SOCKET_CLOSED
Language=English
Message deleted after message socket closed.
.
MessageId=0x2C80
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_QUEUE_IMPORT
Language=English
An error occurred adding the message to the Input Queue.
.
MessageId=0x2C82
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_QUEUE_COMPLETION
Language=English
An error occurred adding the message to the Completion Queue.
.
MessageId=0x2C83
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_QUERY_CALLBACK
Language=English
An error occurred querying the Completion Callback Interface.
.
MessageId=0x2C84
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_IMPORT_CALLBACK
Language=English
An error occurred querying the Import Callback Interface.
.
MessageId=0x2C85
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SOCKETAGENT_MESSAGE_FINISHED
Language=English
The message has already finished processing.
.
MessageId=0x2C86
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_EXCEPTION_CANCEL_MESSAGE
Language=English
An exception occurred canceling a message.
.
MessageId=0x2C87
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_XMLFLAGS
Language=English
Request Data Header Response flag Return XML set but no XML Result Flags set.
.
MessageId=0x2C89
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_GETDISKSPACE
Language=English
An error occurred extracting the Temporary Disk File path
.
MessageId=0x2C8A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_DISKSPACETHROTTLING
Language=English
Disk Space Throttling Threshold is now active.
.
MessageId=0x2C8B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_DISKSPACETHROTTLING_OK
Language=English
Disk Space Throttling Threshold is no longer active.
.
MessageId=0x2C8C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_DISKSPACEMINIMUM
Language=English
Disk Space Minimum allowed has been reached.
.
MessageId=0x2C8D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_DISKSPACEMINIMUM_OK
Language=English
Disk Space Minimum is no longer active.
.
MessageId=0x2C8E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_MEMORYTHROTTLING
Language=English
Memory Throttling Threshold is now active.
.
MessageId=0x2C8F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_MEMORYTHROTTLING_OK
Language=English
Memory Usage Throttling Threshold is no longer active.
.
MessageId=0x2C90
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_MEMORYLIMIT
Language=English
Memory Usage Limit has been reached.
.
MessageId=0x2C91
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_MEMORYLIMIT_OK
Language=English
Memory Usage Limit is no longer active.
.
MessageId=0x2C92
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_QUEUELIMITFAIL
Language=English
Message rejected after Import Queue Limit reached with Throttle Mode Fail.
.
MessageId=0x2C94
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MEMORYTHROTTLEFAIL
Language=English
Message rejected after Memory Throttling Threshold reached with Throttle Mode Fail.
.
MessageId=0x2C95
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MEMORYLIMITFAIL
Language=English
Message rejected after Memory Usage Limit reached.
.
MessageId=0x2C96
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_DISKSPACETHROTTLEFAIL
Language=English
Message rejected after Disk Space Throttling Threshold reached with Throttle Mode Fail.
.
MessageId=0x2C97
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_DISKSPACEMINIMUMFAIL
Language=English
Message rejected after Disk Space Minimum reached.
.
MessageId=0x2C9A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_AGENTPORTINVALID
Language=English
Agent Port and Agent Port Interlaced cannot be the same.
.
MessageId=0x2C9B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_STREAMNAMEID_TOO_SMALL
Language=English
The Stream Name by ID data element is too small to contain a Stream Name by ID structure.
.
MessageId=0x2C9C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_STREAMNAMEID_EMPTY
Language=English
The Stream Name by ID data element does not contain a Stream Name.
.
MessageId=0x2C9D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_STREAMDATAID_TOO_SMALL
Language=English
The Stream Data by ID data element is too small to contain a Stream Data by ID structure.
.
MessageId=0x2C9E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_STREAM_MIXED_TYPES
Language=English
Stream Data by ID or Stream Name by ID data elements cannot be used in the same message as Data Elements of type Stream Name or Data.
.
MessageId=0x2C9F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_RESERVED2CMP_NONZERO
Language=English
Socket Agent Completion Message Data Header Reserved2 field must be zero.
.
MessageId=0x2CA0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_EXPECT_COMPLETION
Language=English
The Socket Agent Connection is Contiguous, and a Completion Message is expected. Request Message rejected.
.
MessageId=0x2CA1
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_DATA_REQUIRED
Language=English
Early Analysis requested message data. Full analysis will be requested when all data is available.
.
MessageId=0x2CA2
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_NO_EARLY_ANALYSIS
Language=English
Early Analysis is not available for this event type.
.
MessageId=0x2CA3
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_EARLY_ANALYSIS_FAILED
Language=English
Early Analysis of the Request Message failed.
.
MessageId=0x2CA4
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_HOST_NOT_PE
Language=English
The Socket Agent is not required for the Policy Engine.
.
MessageId=0x2CA5
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_HOST_NOT_HUB
Language=English
The Socket Agent is not required for the Hub.
.
MessageId=0x2CA6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_HOST_INVALID
Language=English
The Socket Agent registry entries HostInHub, HostInPE cannot both be set. HostInPE ignored.
.
MessageId=0x2CA7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_EXCEPTION_INIT_FORWARD
Language=English
An exception was caught while during initial processing a message.
.
MessageId=0x2CA8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_MESSAGEID_CONTINUATION
Language=English
Message ID continuations are not permitted.
.
MessageId=0x2CA9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_XMLMERGE_INSTANCE
Language=English
An error occurred loading an XML Merge Instance.
.
MessageId=0x2CAA
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_EXCEPTION_IMPORT_BUILD
Language=English
An exception occurred building for Import.
.
MessageId=0x2CAB
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_USESUTF8ENCODING
Language=English
Data Flag Uses UTF8 Encoding not allowed with this Data Element Type.
.
MessageId=0x2CAC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_EXCEPTION_ONUPDATE
Language=English
An exception occurred processing the response from the Policy Engine.
.
MessageId=0x2CAD
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_EXCEPTION_MAILACTIONS
Language=English
An exception occurred processing the Policy Engine Mail Actions.
.
MessageId=0x2CAE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_AGENT_SHUTDOWN
Language=English
The Socket Agent is shutting down. Message canceled.
.
MessageId=0x2CB4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_REGISTRY_EVENT
Language=English
Initialization failure. Failed to create a synchronization event.
.
MessageId=0x2CB6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_REGISTRY_TYPE
Language=English
The expected data type of a registry value is invalid.
.
MessageId=0x2CB7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_REGISTRY_DATA
Language=English
A registry value is invalid.
.
MessageId=0x2CB8
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SOCKETAGENT_REGISTRY_NAME
Language=English
An unknown registry value was ignored.
.
MessageId=0x2CB9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_REGISTRY_SET
Language=English
Unable to set registry value.
.
MessageId=0x2CBE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_REGISTRY_INVALID
Language=English
The Message could not be processed because the Socket API registry settings are incorrectly configured.
See the WgnSAgent log for details.
.
MessageId=0x2CBF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_XMLRESULTS
Language=English
An error occured getting XML Results.
.

; //
; // NOTEWELL: The messages above SHOULD NOT contain variables. They are returned to
; // customer programs, which do not have access to the variables. If you wish to include
; // variables for logging, make a duplicate of the 0x2C00 message below (0x2D00 series).
; // 
; // Socket Agent Log Messages 0x2D00 to 0x2DFF
; // These messages are equivalent to 0x2C00 - 0x2CFF See NOTEWELL above.
; //
MessageId=0x2D00
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_START_SESSION
Language=English
--------------------------------------------------
.
MessageId=0x2D01
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_STARTUP
Language=English
Socket Agent is starting up. Listening on Agent Port %1 Agent Port Interlaced %2
.
MessageId=0x2D03
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_SHUTDOWN
Language=English
The Socket Agent is shutting down.
.
MessageId=0x2D04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_INITIALIZE_RECEIVER
Language=English
An error occurred initializing the TCP/IP Server on port %1 (%2).
.
MessageId=0x2D05
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_OPEN_REGISTRY
Language=English
An error occurred opening the registry %1 (%2).
.
MessageId=0x2D06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_EXCEPTION_PROCESS_MESSAGE
Language=English
Socket %1 Message %2: An exception was caught while processing a message.
.
MessageId=0x2D07
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_EXCEPTION_OUTER_FORWARD
Language=English
Socket %1 Message %2: An exception was caught while receiving and processing a message.
.
MessageId=0x2D08
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_NO_DATA_HEADER
Language=English
Socket %1 Message %2: Socket Agent packet data too small to contain a data header (%3 bytes).
.
MessageId=0x2D09
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETSERVICE_LOG_STARTING
Language=English
The Socket Service is starting up.
.
MessageId=0x2D0A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_DATACOUNT_ZERO
Language=English
Socket %1 Message %2: Socket Agent packet data header data element count must not be zero.
.
MessageId=0x2D0B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_NO_DATA_ELEMENT
Language=English
Socket %1 Message %2: Socket Agent packet data does not contain a data element (data length=%3).
.
MessageId=0x2D0C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_INVALID_DATA_ELEMENT
Language=English
Socket %1 Message %2: Socket Agent packet data contains incomplete data element header %3 (%4 bytes).
.
MessageId=0x2D0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_PARTIAL_DATA_ELEMENT
Language=English
Socket %1 Message %2: Socket Agent packet data contains incomplete data element %3 (%4 bytes).
.
MessageId=0x2D0E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_UNEXPECTED_DATA
Language=English
Socket %1 Message %2: Socket Agent packet data contains unexpected data after last data element (%3 bytes).
.
MessageId=0x2D10
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_TOO_MANY_DATA_ELEMENT
Language=English
Socket %1 Message %2: Socket Agent packet data contains too many data elements (%3 elements - maximum elements %4).
.
MessageId=0x2D11
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_CREATE_IACTIVEIMPORT
Language=English
An error occurred creating an instance of the Active Import Interface - %1.
.
MessageId=0x2D12
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_IACTIVEIMPORT_ERROR
Language=English
Socket %1 Message %2: An error was returned from a call to Import an Object on an Active Import Interface - %3.
.
MessageId=0x2D13
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_METADATA
Language=English
Socket %1 Message %2: An error occurred processing Socket Agent Request Message XML Metadata elements (Item %3) - %4
.
MessageId=0x2D14
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_FLAGSREQ_FIELD
Language=English
Socket %1 Message %2: The schema version (%3) does not support Request Message Data Header Request Flags value %4.
.
MessageId=0x2D15
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_FLAGSRSP_FIELD
Language=English
Socket %1 Message %2: The schema version (%3) does not support Request Message Data Header Response Flags value %4
.
MessageId=0x2D17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_NO_DATA_DATA_ELEMENT
Language=English
Socket %1 Message %2: The External Agent Socket API Request Message requires at least 1 data element containing data.
.
MessageId=0x2D1C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_FORMAT_ERROR
Language=English
Socket %1 Message %2: An error occurred formatting the Response Message (bytes %3). Error - %4.
.
MessageId=0x2D21
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_XMLADDATTRIBUTES
Language=English
Socket %1 Message %2: An error occurred processing Socket Agent Completion Message XML Additional Attribute elements (Item %3) - %4.
.
MessageId=0x2D22
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_DATA_ELEMENT_TYPE
Language=English
Socket %1 Message %2: The External Agent Socket API Request Message does not support the data type of data element %3 (Type=%4).
.
MessageId=0x2D23
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_COMPLDATA_ELEMENT_TYPE
Language=English
Socket %1 Message %2: The External Agent Socket API Completion Message does not support the data type of data element %3 (Type=%4).
.
MessageId=0x2D24
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_COMPLETION_NO_MESSAGE
Language=English
Socket %1 Message %2: The External Agent Socket API was called to complete a delayed completion. No message with that Completion ID %3 was found. The message may have timed out.
.
MessageId=0x2D25
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_COMPLETION_ROLLBACK
Language=English
Socket %1 Message %2: The External Agent Socket API failed to rollback a delayed completion. Error - %3
.
MessageId=0x2D26
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_COMPLETION_COMMIT
Language=English
Socket %1 Message %2: The External Agent Socket API failed to commit a delayed completion. Error - %3
.
MessageId=0x2D27
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MESSAGE_SIZE
Language=English
Socket %1 Message %2: The length of a received message is not a multiple of 4 bytes long.
.
MessageId=0x2D28
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MESSAGE_SIZE_TOO_SMALL
Language=English
Socket %1 Message %2: The length (%3) of a received message is smaller than the smallest possible message.
.
MessageId=0x2D29
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MESSAGE_TYPE
Language=English
Socket %1 Message %2: The schema version %3 does not support message type %4.
.
MessageId=0x2D2A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_PRIORITY_FIELD
Language=English
Socket %1 Message %2: The schema version %3 does not support Priority value %4.
.
MessageId=0x2D2B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_RESERVED3_FIELD
Language=English
Socket %1 Message %2: The schema version %3 does not support Reserved3 value %4.
.
MessageId=0x2D2C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_FLAGS1_FIELD
Language=English
Socket %1 Message %2: The schema version %3 does not support Flags1 value %4.
.
MessageId=0x2D2D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_FLAGS2_FIELD
Language=English
Socket %1 Message %2: The schema version %3 does not support Flags2 value %4.
.
MessageId=0x2D2E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_FLAGS3_FIELD
Language=English
Socket %1 Message %2: The schema version %3 does not support Flags3 value %4.
.
MessageId=0x2D2F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_SAGENT_REPLY_SEND_FAILED
Language=English
Socket %1 Message %2: Failed to send response for message - error %3.
.
MessageId=0x2D30
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MESSAGE_ABANDONED
Language=English
Socket %1 Message %2: The Socket Agent was shut down before the message could be processed. Message type=%3 Completion ID %4 - last updated %5.
.
MessageId=0x2D31
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_INVALID_SCHEMA
Language=English
Socket %1 Message %2: The schema version %3 is not supported.
.
MessageId=0x2D33
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_NO_MESSAGE_BODY
Language=English
Socket %1 Message %2: The message was empty.
.
MessageId=0x2D34
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_INVALID_MESSAGE_FOOTER
Language=English
Socket %1 Message %2: Message footer was invalid.
.
MessageId=0x2D36
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MESSAGEID_DATA_SIZE
Language=English
Socket %1 Message %2: The Message ID size (%3) + Message ID Data fixed data size (%4) + data element fixed size data (%5) must be equal to the Data Element Data Size (%6).
.
MessageId=0x2D37
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MESSAGE_UNIQUEID
Language=English
Socket %1 Message %2: The Completion Message Unique ID cannot be zero. Set to the Message Unique ID from the Message Response.
.
MessageId=0x2D38
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_FLAGSCMP_FIELD
Language=English
Socket %1 Message %2: The schema version %3 does not support Completion Message Completion Flags value %4.
.
MessageId=0x2D39
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_FLAGSCMR_FIELD
Language=English
Socket %1 Message %2: The schema version %3 does not support Completion Message Response Flags value %4.
.
MessageId=0x2D3B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_OBJECT_TRANSPORT
Language=English
Socket %1 Message %2: The schema version %3 does not support Request Message Object Transport value %4.
.
MessageId=0x2D3C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_RESERVED1REQ_NONZERO
Language=English
Socket %1 Message %2: Socket Agent Request Message Data Header Reserved1 field must be zero (%3).
.
MessageId=0x2D3D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_RESERVED2REQ_NONZERO
Language=English
Socket %1 Message %2: Socket Agent Request Message Data Header Reserved2 field must be zero (%3).
.
MessageId=0x2D3E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_RESERVED1CMP_NONZERO
Language=English
Socket %1 Message %2: Socket Agent Completion Message Data Header Reserved1 field must be zero (%3).
.
MessageId=0x2D3F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_CREATE_ICOMBOSTREAM
Language=English
Socket %1 Message %2: An error occurred creating an instance of a Combo Stream - %3.
.
MessageId=0x2D40
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_ICOMBOATTACH
Language=English
Socket %1 Message %2: An error occurred attaching the memory to a Combo Stream Interface - %3.
.
MessageId=0x2D41
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_CREATE_IIMPORTFILEOBJECT
Language=English
Socket %1 Message %2: An error occurred creating an instance of an Import File Object - %3.
.
MessageId=0x2D42
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_INITIALIZE_FILE_OBJECT
Language=English
Socket %1 Message %2: An error occurred initializing an Import File Object Interface - %3.
.
MessageId=0x2D43
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_QUERY_ICOMBOSTREAM
Language=English
Socket %1 Message %2: An error occurred querying a Combo Stream for a Stream Interface - %3.
.
MessageId=0x2D44
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_EXCEPTION_IMPORT_OBJECT
Language=English
Socket %1 Message %2: An exception occurred Importing an Object on the Active Import Connector.
.
MessageId=0x2D45
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_EXCEPTION_COMMIT_DEFERRED
Language=English
Socket %1 Message %2: An exception occurred committing a deferred Import Object.
.
MessageId=0x2D46
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_TOOMANY_DATA_ELEMENTS
Language=English
Socket %1 Message %2: More than one object data element (e.g. RFC822 data element) was found, Only 1 object data element is permitted for this object type (%3).
.
MessageId=0x2D47
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_ADDSTREAM_FILE_OBJECT
Language=English
Socket %1 Message %2: An error occurred adding a stream to an Import File Object - %3.
.
MessageId=0x2D49
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_BACKGROUND_THREAD
Language=English
An error occurred creating the Background Thread - %1
.
MessageId=0x2D4A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MESSAGE_TIMEOUT
Language=English
Socket %1 Message %2: The message has timed out. Message type=%3, Completion ID %4 - last updated %5.
.
MessageId=0x2D4B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_SETREMOTEDATALOCATION
Language=English
Socket %1 Message %2: The External Agent Socket API failed to set the Message ID. Error - %3
.
MessageId=0x2D4C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_SETMESSAGEATTRIBUTES
Language=English
Socket %1 Message %2: The External Agent Socket API failed to set the message attributes. Error - %3
.
MessageId=0x2D4D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_STREAMNAME
Language=English
Socket %1 Message %2: An error occurred allocating the memory for the stream name (Data Element %3). Error - %4
.
MessageId=0x2D4E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MESSAGEID
Language=English
Socket %1 Message %2: An error occurred processing Message ID data element (Item %3) - %4.
.
MessageId=0x2D51
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_NEW_STREAMDATA
Language=English
Socket %1 Message %2: There was insufficient memory to create a new stream data object (%3 bytes).
.
MessageId=0x2D52
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_WRITE_ISTREAM
Language=English
Socket %1 Message %2: An error occurred writing to a Stream Interface (%3 bytes) - %4
.
MessageId=0x2D53
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_WRITE_ISTREAM_PART
Language=English
Socket %1 Message %2: Only part of the data was able to be written to the Stream Interfaces (%3 of %4 bytes).
.
MessageId=0x2D54
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_DECODE_REQUESTHEADER
Language=English
Socket %1 Message %2: An error occurred decoding the Request Message Data Header (%3 bytes) - %4.
.
MessageId=0x2D55
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_DECODE_DATAELEMENT
Language=English
Socket %1 Message %2: An error occurred decoding the data element (%3 bytes) - %4.
.
MessageId=0x2D56
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_DECODE_COMPLETIONHEADER
Language=English
Socket %1 Message %2: An error occurred decoding the Completion Message Data Header (%3 bytes) - %4.
.
MessageId=0x2D58
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_DECODE_MSGHEADER
Language=English
Socket %1 Message %2: An error occurred decoding a message header (%3 bytes) - %4.
.
MessageId=0x2D59
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_ALLOC_CHARDATA
Language=English
Socket %1 Message %2: Insufficient memory to allocate space for data element data (%3 bytes).
.
MessageId=0x2D5A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_NO_FILENAME_DATA_ELEMENT
Language=English
Socket %1 Message %2: The Object Transport is filename, but no file name data element was provided.
.
MessageId=0x2D5B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_ELEMENT_COUNT
Language=English
Socket %1 Message %2: Socket Agent packet Request Message Data Header element count (%3) was more than the number of data elements (%4) in the Request Message.
.
MessageId=0x2D5C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_SETPAGETHRESHOLD
Language=English
Socket %1 Message %2: An error occurred setting the paging threshold ( %3) of a Combo Stream - %4.
.
MessageId=0x2D5D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_CREATE_IIMPORTCONFIG
Language=English
An error occurred creating an instance of an Import Importer Configuration Interface - %1.
.
MessageId=0x2D5E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_SETIMPORTDESTINATION
Language=English
An error occurred setting the Importer Destination (%1) - %2.
.
MessageId=0x2D61
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_CANCEL_DATA
Language=English
Socket %1 Message %2: A Socket Agent Cancel Message contains %3 bytes of data. Cancel messages cannot contain data.
.
MessageId=0x2D62
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SOCKETAGENT_LOG_CANCEL_NO_MESSAGE
Language=English
Socket %1 Message %2: A Socket Agent Cancel Message was received for Message Number %2, but the message was not found.
.
MessageId=0x2D63
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_FLAGSDATA_FIELD
Language=English
Socket %1 Message %2: The schema version (%3) does not support Message Data Element Flags value %4.
.
MessageId=0x2D64
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_FLAGSDATA_INCOMPLETE
Language=English
Socket %1 Message %2: The Message Data Element Item %3 Incomplete Flag (Flags %4) is only valid if the message is incomplete.
.
MessageId=0x2D65
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_CANCEL_MESSAGE
Language=English
Socket %1 Message %2: A Socket Agent Cancel Message was received for Message. Message type=%3. Message canceled.
.
MessageId=0x2D66
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_INVALID_CONTINUATION
Language=English
Socket %1 Message %2: A Socket Agent Message Continuation was received for Message. Message continuation is not supported for Message Type %3.
.
MessageId=0x2D67
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_FILENAME
Language=English
Socket %1 Message %2: The Socket Agent Request Message data error processing Filename element (Item %3) - %4
.
MessageId=0x2D69
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MESSAGEID_INCOMPLETE
Language=English
Socket %1 Message %2: The Socket Agent Request Message is complete, but the Message ID is incomplete.
.
MessageId=0x2D6A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_FILENAME_INCOMPLETE
Language=English
Socket %1 Message %2: The Socket Agent Request Message is complete, but the Filename is incomplete.
.
MessageId=0x2D6B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_XMLMETADATA_INCOMPLETE
Language=English
Socket %1 Message %2: The Socket Agent Request Message is complete, but the XML Metadata is incomplete.
.
MessageId=0x2D6C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_STREAMNAME_INCOMPLETE
Language=English
Socket %1 Message %2: The Socket Agent Request Message is complete, but the Stream name(%3) is incomplete.
.
MessageId=0x2D6D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_STREAMDATA_INCOMPLETE
Language=English
Socket %1 Message %2: The Socket Agent Request Message is complete, but the Stream data(%3) is incomplete.
.
MessageId=0x2D6E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_XMLADDATTRIBUTES_INCOMPLETE
Language=English
Socket %1 Message %2: The Socket Agent Completion Message is complete, but the XML Additional Attributes are incomplete.
.
MessageId=0x2D72
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MULTIPART_CONTINUE
Language=English
Socket %1 Message %2: The Multipart Intermediate flag or Multipart Last flag was not set, but other parts of this message have been received.
Schema version %3 Flags2 %4.
.
MessageId=0x2D73
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MULTIPART_NEW
Language=English
Socket %1 Message %2: Message The Multipart Intermediate flag or Multipart Last flag was set, but no other parts of this message have been received.
Schema version %3 Flags2 %4.
.
MessageId=0x2D74
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MULTIPART_COMPLETE
Language=English
Socket %1 Message %2: The Multipart continuation was received, but the message is already complete.
Schema version %3 Flags2 %4.
.
MessageId=0x2D75
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MERGE_SCHEMA
Language=English
Socket %1 Message %2: Load XML Merge Schema failed - %3.
.
MessageId=0x2D76
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_XML_METADATA
Language=English
Socket %1 Message %2: Load XML Metadata for merge failed - %3.
.
MessageId=0x2D77
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_XML_MERGE
Language=English
Socket %1 Message %2: Load XML Metadata Merge failed - %3
.
MessageId=0x2D78
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_XML_CONVERT
Language=English
Socket %1 Message %2: Load XML Event Merge Schema failed - %3
.
MessageId=0x2D79
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MULTIPART_OBJTYPE
Language=English
Socket %1 Message %2: A Multipart Message Object Type (%3) conflicts with the object type of an earlier message part (%4).
.
MessageId=0x2D7A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MULTIPART_OBJFMT
Language=English
Socket %1 Message %2: A Multipart Message Object Format (%3) conflicts with the object format of an earlier message part (%4).
.
MessageId=0x2D7B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MULTIPART_OBJTRANS
Language=English
Socket %1 Message %2: A Multipart Message Object Transport (%3) conflicts with the Object Transport of an earlier message part (%4).
.
MessageId=0x2D7E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_SOCKET_CLOSED
Language=English
Socket %1 Message %2: Message deleted after message socket closed. Last updated %3. Completion ID %4.
.
MessageId=0x2D80
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_QUEUE_IMPORT
Language=English
Socket %1 Message %2: An error occurred adding the message to the Input Queue - %3.
.
MessageId=0x2D82
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_QUEUE_COMPLETION
Language=English
Socket %1 Message %2: An error occurred adding the message to the Completion Queue - %3.
.
MessageId=0x2D83
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_QUERY_CALLBACK
Language=English
Socket %1 Message %2: An error occurred querying the Completion Callback Interface - %3.
.
MessageId=0x2D84
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_IMPORT_CALLBACK
Language=English
Socket %1 Message %2: An error occurred querying the Import Callback Interface - %3.
.
MessageId=0x2D86
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_EXCEPTION_CANCEL_MESSAGE
Language=English
Socket %1 Message %2: An exception occurred canceling a message.
.
MessageId=0x2D87
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_XMLFLAGS
Language=English
Socket %1 Message %2: Request Data Header Response flag Return XML set but no XML Result Flags set.
.
MessageId=0x2D88
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_TEMPPATH
Language=English
An error occurred extracting the Temporary Disk File path (length=%1) - %2.
.
MessageId=0x2D89
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_GETDISKSPACE
Language=English
An error occurred extracting the Temporary Disk File path (%1) - %2.
.
MessageId=0x2D8A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_DISKSPACETHROTTLING
Language=English
Disk Space Throttling is now active. Windows Temporary Disk available space is %1MB, Disk Space Throttling Threshold is %2MB.
.
MessageId=0x2D8B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_DISKSPACETHROTTLING_OK
Language=English
Disk Space Throttling is no longer active. Windows Temporary Disk available space is %1MB, Disk Space Throttling Threshold %2MB.
.
MessageId=0x2D8C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_DISKSPACEMINIMUM
Language=English
Disk Space Minimum allowed has been reached. Windows Temporary Disk available space is %1MB, Disk Space Minimum is %2MB.
.
MessageId=0x2D8D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_DISKSPACEMINIMUM_OK
Language=English
Disk Space Minimum is no longer active. Windows Temporary Disk available space is %1MB, Disk Space Minimum is %2MB.
.
MessageId=0x2D8E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_MEMORYTHROTTLING
Language=English
Memory Usage Throttling is now active. Memory Usage %1 Bytes, Memory Usage Throttling Threshold %2 Bytes.
.
MessageId=0x2D8F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_MEMORYTHROTTLING_OK
Language=English
Memory Usage Throttling is no longer active. Memory Usage %1 Bytes, Memory Usage Throttling Threshold %2 Bytes.
.
MessageId=0x2D90
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_MEMORYLIMIT
Language=English
Memory Usage Limit has been reached. Memory Usage %1 Bytes, Memory Usage Limit %2 Bytes.
.
MessageId=0x2D91
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_MEMORYLIMIT_OK
Language=English
Memory Usage Limit is no longer active. Memory Usage %1 Bytes, Memory Usage Limit %2 Bytes.
.
MessageId=0x2D92
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_QUEUELIMITFAIL
Language=English
Socket %1 Message %2:  Message rejected after Import Queue Limit reached (%3) with Throttle Mode Fail.
.
MessageId=0x2D94
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MEMORYTHROTTLEFAIL
Language=English
Socket %1 Message %2: Message rejected by Memory Throttling.  Memory Used (%3 Bytes) Memory Throttling Threshold (%4 Bytes) with Throttle Mode Fail.
.
MessageId=0x2D95
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MEMORYLIMITFAIL
Language=English
Socket %1 Message %2: Message rejected by Memory Usage Limit. Memory Used (%3 Bytes) Memory Usage Limit (%4 Bytes).
.
MessageId=0x2D96
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_DISKSPACETHROTTLEFAIL
Language=English
Socket %1 Message %2: Message rejected by Disk Space Throttling. Disk Space available (%3MB) is less than Throttling Threshold (%4MB). Throttle Mode is Fail.
.
MessageId=0x2D97
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_DISKSPACEMINIMUMFAIL
Language=English
Socket %1 Message %2: Message rejected by Disk Space Minimum. Disk Space available (%3MB) is less than Disk Space Minimum (%4MB).
.

MessageId=0x2D98
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SOCKETAGENT_LOG_DISKSPACEINVALID
Language=English
Disk Space Minimum (%1) must not be greater than Disk Space Throttling Threshold. Using Disk Space Throttling Threshold (%2) for both.
.
MessageId=0x2D99
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SOCKETAGENT_LOG_MEMORYINVALID
Language=English
Memory Usage Limit (%1MB) must not be less than Memory Throttling Threshold. Using Memory Usage Limit (%2MB) for both.
.
MessageId=0x2D9A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_AGENTPORTINVALID
Language=English
Agent Port and Agent Port Interlaced cannot be the same (%1).
.
MessageId=0x2D9D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_STREAMDATAID_TOO_SMALL
Language=English
Socket %1 Message %2: The Stream Data by ID data element is too small to contain a Stream Data by ID structure.
.
MessageId=0x2D9E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_STREAM_MIXED_TYPES
Language=English
Socket %1 Message %2: Stream Data by ID or Stream Name by ID data elements cannot be used in the same message as Data Elements of type Stream Name or Data.
.
MessageId=0x2D9F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_RESERVED2CMP_NONZERO
Language=English
Socket %1 Message %2: Socket Agent Completion Message Data Header Reserved2 field must be zero (%3).
.
MessageId=0x2DA0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_EXPECT_COMPLETION
Language=English
Socket %1 Message %2: The Socket Agent Connection is Contiguous, and a Completion Message is expected. Request Message rejected.
.
MessageId=0x2DA1
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_DATA_REQUIRED
Language=English
Socket %1 Message %2: Early Analysis requested message data. Full analysis will be requested when all data is available.
.
MessageId=0x2DA2
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_NO_EARLY_ANALYSIS
Language=English
Socket %1 Message %2: Early Analysis is not available for this event type.
.
MessageId=0x2DA3
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_EARLY_ANALYSIS_FAILED
Language=English
Socket %1 Message %2: Early Analysis of the Request Message failed - %3.
.
MessageId=0x2DA4
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_HOST_NOT_PE
Language=English
The Socket Agent is not required for the Policy Engine - registry entry HostInPE is not set.
.
MessageId=0x2DA5
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_HOST_NOT_HUB
Language=English
The Socket Agent is not required for the Hub - registry entry HostInHub is not set.
.
MessageId=0x2DA6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_HOST_INVALID
Language=English
The Socket Agent registry entries HostInHub, HostInPE cannot both be set. HostInPE ignored.
.
MessageId=0x2DA7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_EXCEPTION_INIT_FORWARD
Language=English
Socket %1 Message %2: An exception was caught while during initial processing a message.
.
MessageId=0x2DA8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_MESSAGEID_CONTINUATION
Language=English
Socket %1 Message %2: Message ID continuations are not permitted.
.
MessageId=0x2DA9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_XMLMERGE_INSTANCE
Language=English
An error occurred loading an XML Merge Instance - %1.
.
MessageId=0x2DAA
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_EXCEPTION_IMPORT_BUILD
Language=English
Socket %1 Message %2: An exception occurred building for Import.
.
MessageId=0x2DAB
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_USESUTF8ENCODING
Language=English
Socket %1 Message %2: Data Flag Uses UTF8 Encoding not allowed with this Data Element Type (%3).
.
MessageId=0x2DAC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_EXCEPTION_ONUPDATE
Language=English
Socket %1 Message %2: An exception occurred processing the response from the Policy Engine.
.
MessageId=0x2DAD
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_EXCEPTION_MAILACTIONS
Language=English
Socket %1 Message %2: An exception occurred processing the Policy Engine Mail Actions.
.
MessageId=0x2DAE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_AGENT_SHUTDOWN
Language=English
Socket %1 Message %2: The Socket Agent is shutting down. Message canceled. Message type=%3, Completion ID %4 - last updated %5.
.
MessageId=0x2DAF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_CANCEL_INCOMPLETE
Language=English
Socket %1 Message %2: The Socket Agent is shutting down. Incomplete message canceled. Message type=%3, Completion ID %4 - last updated %5.
.
MessageId=0x2DB0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_SHUTDOWN_ROLLBACK
Language=English
Socket %1 Message %2: The Socket Agent is shutting down. Message rolled back. Message type=%3, Completion ID %4 - last updated %5.
.
MessageId=0x2DB1
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_TEST_REQUEST
Language=English
Socket %1 Message %2: Test Request Message processed - Object Type %3 Format %4 Transport %5 Source %6.
.
MessageId=0x2DB2
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_TEST_COMPLETION
Language=English
Socket %1 Message %2: Test Completion Message processed.
.
MessageId=0x2DB3
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_TEST_CANCEL
Language=English
Socket %1 Message %2: Test Cancel Message processed.
.
MessageId=0x2DB4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_REGISTRY_EVENT
Language=English
Initialization failure. Failed to create a synchronization event - %1. 
.
MessageId=0x2DB5
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SOCKETAGENT_LOG_REGISTRY_MONITORING
Language=English
Initialization warning. Unable to monitor registry for updates - %1. 
.
MessageId=0x2DB6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_REGISTRY_TYPE
Language=English
The data type of registry value "%1" is invalid (data type %2, expected type %3).
.
MessageId=0x2DB7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_REGISTRY_DATA
Language=English
The registry value "%1" is invalid "%2".
.
MessageId=0x2DB8
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SOCKETAGENT_LOG_REGISTRY_NAME
Language=English
The registry value "%1" is unknown - ignored.
.
MessageId=0x2DB9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_REGISTRY_SET
Language=English
Unable to set registry value "%1" (to %2) - %3.
.
MessageId=0x2DBA
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SOCKETAGENT_LOG_REGISTRY_NOUPDATE
Language=English
Registry setting %1 cannot be updated dynamically. Current value %2 - Restart required to use new value (%3).
.
MessageId=0x2DBB
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_REGISTRY_UPDATED
Language=English
Registry settings successfully updated.
.
MessageId=0x2DBC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_REGISTRY_UPDATE_FAILED
Language=English
Registry setting update failed - %1.
.
MessageId=0x2DBD
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETAGENT_LOG_REGISTRY_LOADED
Language=English
Registry settings loaded - %1.
.
MessageId=0x2DBE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_REGISTRY_INVALID
Language=English
Socket %1 Message %2: The Message could not be processed because the Socket API registry settings are incorrectly configured.
.
MessageId=0x2DBF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_XMLRESULTS
Language=English
Socket %1 Message %2: An error occured getting XML Results. XML Result Flags %3 - %4.
.
MessageId=0x2DC0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETAGENT_LOG_ANALYSIS_FAILED
Language=English
Socket %1 Message %2: Analysis failed. Error %3
.

; // File Scanning Agent Log Codes 0x2E00 to 0x2EFF
;
;

MessageId=0x2E00
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_CONFIG_CHANGED
Language=English
Loading updated configuration.
.

MessageId=0x2E01
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_INPUT_STARTED
Language=English
Started processing Job "%1", Input location "%2".
.

MessageId=0x2E02
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_INPUT_STOPPED
Language=English
Stopped processing Job "%1", Input location "%2".
.

MessageId=0x2E03
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_PROCESSING_FILE
Language=English
Processing file "%1".
.

MessageId=0x2E04
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_PROCESSED_FILE
Language=English
Completed file "%1".
.

MessageId=0x2E05
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_PROCESSING_ERROR
Language=English
Error occurred processing file "%1", error was %2.
.

MessageId=0x2E06
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_DELETING_FILE
Language=English
Deleting file "%1".
.

MessageId=0x2E07
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_REPLACING_FILE
Language=English
Replacing file "%1".
.

MessageId=0x2E08
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_COPYING_FILE
Language=English
Copying file "%1" to "%2".
.

MessageId=0x2E09
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_CONFIG_ERROR
Language=English
Error occurred loading configuration - %1.
.

MessageId=0x2E0A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_JOB_INVALIDXML
Language=English
Failed to parse Job XML configuration.
.

MessageId=0x2E0B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_PROCESSING_FAILED
Language=English
Failed to process file - unknown error.
.

MessageId=0x2E0C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_PROCESSING_TIMEDOUT
Language=English
A timeout occurred while waiting for the event to be processed
.

MessageId=0x2E0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_UNABLE_TO_CREATE_TIMER_QUEUE
Language=English
Failed to create a timer queue object 
.

MessageId=0x2E0E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_EXCLUDED_BY_NIST
Language=English
Excluded file "%1!ls!", which was found in the NIST database.
.

MessageId=0x2E0F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_INVALID_LOCATION
Language=English
Location not found or access denied
.

MessageId=0x2E10
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_DOD_VERIFY_FAILED
Language=English
Secure overwrite failed - file contents do not match last overwrite
.

MessageId=0x2E11
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_FILE_ALREADY_SCANNED
Language=English
DB Check - Already scanned file "%1".
.

MessageId=0x2E13
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_DB_CONNECTION_FAILED
Language=English
Failed to connect to the %1 Database
.

MessageId=0x2E14
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_FAILED_TO_END_TRANS
Language=English
Failed to end database transcation - "%1" failed
.

MessageId=0x2E15
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_FAILED_TO_DB_PROCESS_FILE
Language=English
Failed to process file in the scan database - "%1"
.

MessageId=0x2E16
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_FAILED_TO_DB_GET_JOB_ID
Language=English
Failed to retrieve job ID - "%1"
.

MessageId=0x2E17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_FAILED_TO_DB_PURGE_DATA
Language=English
Failed to purge job data - "%1"
.


MessageId=0x2E19
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_EXCLUDED_BY_POLICY
Language=English
Excluded file "%1", which was not captured by policy.
.

MessageId=0x2E1A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_PROCESSING_SUMMARY
Language=English
Summary: Processed %1. Captured %2. Excluded %3. Failed %4.
.

MessageId=0x2E1B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_CANCELLED
Language=English
Cancelled file "%1", parent Input is shutting down.
.

MessageId=0x2E1C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_EXCLUDED_BY_JOB_CONFIG
Language=English
Excluded %1 files not matched by the job's filter.
.

MessageId=0x2E1D
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FSSA_REPARSE_POINT_SKIPPED
Language=English
Reparse point "%1" skipped.
.

MessageId=0x2E1E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_FAILED_TO_RETRIEVE_JOB_ID
Language=English
Failed to retrieve scan database session for job "%1"
.

MessageId=0x2E1F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_FAILED_DB_CHECK
Language=English
Failed to check file "%1" in the Scan DB.
.

MessageId=0x2E21
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_MISSED_RESCAN_TIME
Language=English
Missed restart time for job "%1"
.

MessageId=0x2E22
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_NEXT_RESCAN_TIME
Language=English
Job "%1" is scheduled to start at %2
.

MessageId=0x2E23
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FSSA_UNTIL_TIME_EXPIRED
Language=English
Job "%1" has passed its 'until' time, and will not be started.
.

MessageId=0x2E24
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_STARTED
Language=English
*** FSA has started.
.

MessageId=0x2E25
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_STARTING
Language=English
*** FSA is starting...
.

MessageId=0x2E26
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_FAILED_TO_START
Language=English
*** FSA failed to start - %1
.

MessageId=0x2E27
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_SHUTDOWN
Language=English
*** FSA has shut down.
.

MessageId=0x2E28
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_SHUTTING_DOWN
Language=English
*** FSA is shutting down...
.

MessageId=0x2E29
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_TRACE
Language=English
%1
.

MessageId=0x2E2A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_DB_CONNECTING
Language=English
FSA Connecting to the %1 Database using DSN "%2".
.

MessageId=0x2E2B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_DB_CLOSING
Language=English
FSA Closing %1 Database Connection.
.

MessageId=0x2E2C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_DB_CLOSED
Language=English
FSA %1 Database Connection Closed.
.

MessageId=0x2E2D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_FAILED_TO_CLOSE
Language=English
FSA %1 Database Connection Failed to Close.
.

MessageId=0x2E2E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_DB_RECONNECTING
Language=English
FSA attempting to reconnect to the %1 database...
.

MessageId=0x2E2F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_DB_CONNECTED
Language=English
FSA connected to the %1 database - %2
.

MessageId=0x2E30
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_DB_DELEGATE_STILL_RUNNING
Language=English
A Delegate process is still running, and waiting for FSA to restart.
.

MessageId=0x2E31
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_FAILED_TO_LOAD_FILE
Language=English
Failed to load file "%1" - %2
.

MessageId=0x2E32
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_INVALID_PARAMETER
Language=English
Invalid FSA Registry parameter "%1"
.

MessageId=0x2E33
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_FAILED_SCAN_DB
Language=English
Failed to start job "%1" - Couldn't connect to the Scan database.
.

MessageId=0x2E34
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSTUB_ERROR_OCCURRED
Language=English
Error occurred running "%1" - %2.
.

MessageId=0x2E35
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_POLL_ERROR
Language=English
An error occurred getting the file list for Job "%1", Input location "%2" - %3
.

MessageId=0x2E36
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_DIRENUM_ERROR
Language=English
Skipping "%1" - %2
.

MessageId=0x2E37
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FSA_BACKUP_PRIVILEGE_FAILED
Language=English
Failed to acquire backup privilege, which may limit access to some files -  %1
.

MessageId=0x2E38
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_NAME_IN_USE
Language=English
Another Job with the same name is already running
.

MessageId=0x2E39
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_LOG_JOB_NAME_IN_USE
Language=English
Another Job named "%1" is already running
.

MessageId=0x2E3A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_JOB_STARTED
Language=English
Job "%1" has started
.

MessageId=0x2E3B
Severity= Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_JOB_FINISHED
Language=English
Job "%1" has finished
.

MessageId=0x2E3C
Severity= Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_JOB_CANCELLED
Language=English
Job "%1" was stopped before it finished
.

MessageId=0x2E3D
Severity= Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_UPDATE_REG_CONFIG
Language=English
Configuration Updated
.

MessageId=0x2E3E
Severity= Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_UPDATE_JOBFILE_CONFIG
Language=English
Configuration Updated for Job File "%1"
.

MessageId=0x2E3F
Severity= Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_DB_DATA_PURGE_SUCCESS
Language=English
Job "%1" was purged successfully
.

MessageId=0x2E40
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_DB_JOB_NOT_FOUND
Language=English
Job "%1" does not exist in the scan database
.

MessageId=0x2E41
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_NAME_EMPTY
Language=English
Job name is empty
.

MessageId=0x2E42
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_NAME_TOO_LONG
Language=English
Job name exceeds 63 character limit
.

MessageId=0x2E43
Severity= Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_DB_ALLJOBS_PURGE_SUCCESS
Language=English
All jobs were purged successfully
.

MessageId=0x2E44
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_DB_GET_JOB_ID 
Language=English
Failed to retrieve scan database session for job
.

MessageId=0x2E45
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_DB_UNFOUND_JOB
Language=English
The job does not exist in the scan database
.

MessageId=0x2E46
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_DB_JOB_PURGE_DATA
Language=English
Failed to purge the job data 
.

MessageId=0x2E47
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SCANDB_CONNECTION
Language=English
Failed to connect to the scan database
.

MessageId=0x2E48
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_COPYTAG_FILE
Language=English
Copying file "%1" to "%2" and tagging the copy.
.

MessageId=0x2E49
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_TAGGING_FILE
Language=English
Tagging file "%1".
.

MessageId=0x2E4A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_STUB_RECONNECT_TIMEOUT
Language=English
Timed out while waiting to reconnect to the FSA service.
.

MessageId=0x2E4B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_JOB_MISSINGLOCATIONS
Language=English
Couldn't find <locations> element in XML config file
.

MessageId=0x2E4C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_JOB_MISSINGPARTICIPANTS
Language=English
Couldn't find <participants> element in XML config file
.

MessageId=0x2E4D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_JOB_MISSINGFSA
Language=English
Couldn't find <fsa> element in XML config file
.

MessageId=0x2E4E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_JOB_MISSINGJOBS
Language=English
Couldn't find <jobs> element in XML config file
.

MessageId=0x2E4F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_FAILED_TO_PARSE_FILE
Language=English
Failed to parse file "%1" - %2
.

MessageId=0x2E50
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_FAILED_CONTINUOUS_JOBS
Language=English
Failed to start job file "%1" - %2
.

MessageId=0x2E51
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_INVALID_RELATIVE_PATH
Language=English
Couldn't apply relative path "%1" to location "%2"
.

MessageId=0x2E52
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_INVALID_RELATIVE_PATH_ERROR
Language=English
Invalid relative path
.

MessageId=0x2E53
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_INVALID_FOLDER_TYPE
Language=English
The message is the wrong type for the target folder
.

MessageId=0x2E54
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FSA_EXCHANGE_REPLACE_NOT_SUPPORTED
Language=English
Replace not supported. Message will be deleted : %1.
.

MessageId=0x2E55
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_INVALID_JOBFILE_CONFIG
Language=English
Invalid job file argument (<%1 %2="%3" />) - %4
.

MessageId=0x2E56
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FSA_FAILED_TO_SET_SMARTTAG
Language=English
Couldn't apply smart tags to file "%1" - %2
.

MessageId=0x2E57
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_GENERATE_PDF_CONTENTS
Language=English
Failed to generate PDF contents.
.

MessageId=0x2E58
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_WRITE_ACCESS_DENIED
Language=English
File system security on file '%1' prohibits write access - policy 
actions requiring write access will NOT be applied.
.

MessageId=0x2E59
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_ENUM_NOT_FINISHED
Language=English
The enumeration has not finished.
.
MessageId=0x2E5A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_FAILED_CFSA_INIT_L
Language=English
Failed to Initialize the Client File Scanning Agent. Error was %1.
.
MessageId=0x2E5B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_FAILED_CFSA_START_L
Language=English
Failed to Start the Client File Scanning Agent. Error was %1.
.
MessageId=0x2E5C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_JOB_FILE_MISSING_JOB
Language=English
No Job found in config file.
.
MessageId=0x2E5D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_JOB_FILE_OLD_FORMAT
Language=English
Old job file format.
.
MessageId=0x2E5E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_CONFIG_ERROR_2
Language=English
Failed to load configuration '%1'. Error was %2.
.
MessageId=0x2E5F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_FAILED_TO_GET_EVENT_DATE
Language=English
The File Scanning Agent failed to obtain a date from the Event.
.

;
;// NIST status codes 
;

MessageId=0x2E60
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NIST_CHECK_FAILED
Language=English
Failed to check file in the NIST Database
.

;// Had to add a separate err code for the NIST conn failure
MessageId=0x2E61
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_NIST_CONNECTION_FAILED
Language=English
Failed to connect to the NIST Database
.

;
; // FSA codes continued
;

MessageId=0x2E62
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FSA_SMARTTAG_CLASS_NOT_REGISTERED
Language=English
Couldn't apply smart tags to file "%1" - Class not registered. Please ensure the correct shell extention dll is installed.
.

;
;// FSA MAPI related status codes 
;

MessageId=0x2E70
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_LOG_FAILED_INITIALISE_MAPI
Language=English
The FSA failed to initialize MAPI (%1). Please ensure a Microsoft Exchange-compatible email application such as Outlook is the default email application.
.
MessageId=0x2E71
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_FAILED_INITIALISE_MAPI
Language=English
Failed to initialize MAPI.
.
MessageId=0x2E72
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_LOG_NO_MAILBOX_ON_SERVER
Language=English
The FSA could not find the mailbox "%1!ls!" on the server "%2!hs!" (the mailbox is located on the server whose DN is "%3!hs!"). 
.
MessageId=0x2E73
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_NO_MAILBOX_ON_SERVER
Language=English
The mailbox does not exist on the configured email server.
.
MessageId=0x2E74
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_MAPI_SERVICE_NOT_FOUND
Language=English
The newly created MAPI service could not be found.
.
MessageId=0x2E75
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_MAPI_STORE_NOT_FOUND
Language=English
The required MAPI store could not be found.
.
MessageId=0x2E76
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_LOG_CREATING_PST_PROFILE
Language=English
Error creating PST Profile "%1!ls!" "%2!ls!" "%3!ls!" - %4
.
MessageId=0x2E77
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_MULTIPLE_RECIPIENTS
Language=English
There is more than one entry that matches the user/mailbox name.
.
MessageId=0x2E78
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_MAPI_UNEXPECTED_TYPE
Language=English
The returned MAPI property is not of the expected type.
.
MessageId=0x2E79
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_LOG_PROFILE_FAILED
Language=English
The FSA could not create a MAPI profile to access the mailbox (username: %1!ls!, server: %2!ls!). The error returned was %3.
.
MessageId=0x2E7A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_LOG_UAMAILBOX_OPEN_FAILED
Language=English
The FSA could not access the configured mailbox (username: %1!ls!, server: %2!ls!). The error returned was %3.
.
MessageId=0x2E7B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_PROFILE_FAILED
Language=English
Failed to create a MAPI profile
.
MessageId=0x2E7C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_EXCHANGE_FILE_NOT_INITIALISED
Language=English
The FSA's Exchange Message Wrapper was not initialized with a message.
.

;
;// SharePoint error codes
;
MessageId=0x2E80
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_INVALID_SPFILE_URL
Language=English
Failed to retrieve SharePoint file object from URL
.

MessageId=0x2E81
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_INVALID_SPITEM_URL
Language=English
Failed to retrieve SharePoint list item object from URL
.

MessageId=0x2E82
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SPFILE_DELETE_FAILED
Language=English
Failed to delete SharePoint file
.

MessageId=0x2E83
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SPFILE_REPLACE_FAILED
Language=English
Failed to replace SharePoint file 
.

MessageId=0x2E84
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SPFILE_COPY_FAILED
Language=English
Failed to copy SharePoint file
.

MessageId=0x2E85
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SPFILE_CONTENTS
Language=English
Failed to retrieve SharePoint file contents
.

MessageId=0x2E86
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_URL_FOR_SPFILE
Language=English
Failed to retrieve URL for SharePoint file
.

MessageId=0x2E87
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_URL_FOR_SPITEM
Language=English
Failed to retrieve URL for SharePoint list item 
.

MessageId=0x2E88
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SPITEM_ATTRIBS
Language=English
Failed to retrieve SharePoint item attributes
.

MessageId=0x2E89
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SPITEM_EVENT_DATA
Language=English
Failed to build SharePoint event data
.

MessageId=0x2E90
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SHPT_INSTALL_DETECT
Language=English
Unable to detect the installed version of Microsoft SharePoint Services 
.

MessageId=0x2E91
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SHPT_EXCEPTION
Language=English
Microsoft SharePoint exception occurred: "%1!ls!"
.

MessageId=0x2E92
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FSA_SHPT_LIST_ACCESS
Language=English
Unable to access SharePoint List 
.

MessageId=0x2E93
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FSA_SHPT_SITE_ACCESS
Language=English
Unable to access SharePoint Site 
.

MessageId=0x2E94
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SHPT_UNSUPPORTED_LISTTYPE
Language=English
The SharePoint list type is not supported 
.
MessageId=0x2E95
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SHPT_EXCLUDED_LISTTYPE
Language=English
The SharePoint list type is excluded by the job filter 
.
MessageId=0x2E96
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SHPT_CREATE_LISTDEF
Language=English
Error allocating memory for list definition  
.
MessageId=0x2E97
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SHPT_CREATE_LISTITEM_CACHE
Language=English
Error allocating memory for list item cache  
.
MessageId=0x2E98
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SHPT_LIST_ENUMERATION
Language=English
Unexpected failure enumerating the list items  
.

;
;// ODBC related status codes (1 generic code so far)
;
MessageId=0x2E99
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ODBC_ERROR
Language=English
ODBC Error occurred: "%1"
.

;
;// Second generation status codes
;
MessageId=0x2EA0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_LOCATION_ENUM_NOT_INITIALISED
Language=English
The Location Enumerator has not been initialized.
.
MessageId=0x2EA1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_LOCATION_HANDLER_NOT_INITIALISED
Language=English
The Location Handler has not been initialized.
.
MessageId=0x2EA2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SCAN_ITEM_NOT_INITIALISED
Language=English
The Scan Item has not been initialized.
.
MessageId=0x2EA3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_SCAN_ITEM_ALREADY_INITIALISED
Language=English
The Scan Item has already been initialized.
.
MessageId=0x2EA4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_DEPRECATED
Language=English
The method call has been deprecated. There may be a version discrepancy between your FSA components.
.

;// FSA Config API related codes
MessageId=0x2EA5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_HAS_NO_NAME
Language=English
FSA Job has no name.
.
MessageId=0x2EA6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_DUPLICATE_NAME
Language=English
FSA Job name already in use.
.
MessageId=0x2EA7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_DELETED
Language=English
FSA Job has been deleted.
.
MessageId=0x2EA8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_ALREADY_LOCKED
Language=English
FSA Job already locked.
.
MessageId=0x2EA9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_LOCK_BROKEN
Language=English
FSA Job lock has been broken.
.
MessageId=0x2EAA
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_NOT_FOUND
Language=English
FSA Job not found.
.
MessageId=0x2EAB
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_REG_NOT_FOUND
Language=English
FSA registry key not found.
.
MessageId=0x2EAC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_NOT_LOCKED
Language=English
FSA Job not locked.
.
MessageId=0x2EAD
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_INVALID_JOB_FILENAME
Language=English
Filename does not match FSA job filename specification.
.
MessageId=0x2EAF
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_PURGE_SCHEDULED
Language=English
Purge has been scheduled.
.
MessageId=0x2EAF
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FSA_PURGE_IN_PROGRESS_CANT_CANCEL
Language=English
Purge is currently in progress, and cannot be cancelled.
.
MessageId=0x2EB0
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_PURGE_CANCELLED
Language=English
Purge has been cancelled.
.
MessageId=0x2EB1
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_PURGE_IN_PROGRESS
Language=English
Purge is in progress.
.
MessageId=0x2EB2
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_AUD_JOB_CREATE_OK
Language=English
User '%1' created job '%2'.
.
MessageId=0x2EB3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_LOG_AUD_JOB_CREATE_FAILED
Language=English
User '%1' failed to create job '%2' Error: '%3'.
.
MessageId=0x2EB4
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_AUD_FULL_PURGE_ACTIONED
Language=English
User '%1' purged scan database.
.
MessageId=0x2EB5
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_AUD_FULL_PURGE_REQUESTED
Language=English
User '%1' requested scan database purge: '%2'.
.
MessageId=0x2EB6
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_AUD_SET_REG_OK
Language=English
User '%1' set FSA configuration '%2' to '%3'.
.
MessageId=0x2EB7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_LOG_AUD_SET_REG_FAIL
Language=English
User '%1' failed to set FSA configuration '%2'. Error: '%3'.
.
MessageId=0x2EB8
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_AUD_JOB_LOCK_BROKEN
Language=English
User '%1' broke the edit lock on job '%2', held by '%3'.
.
MessageId=0x2EB9
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_AUD_JOB_SCAN_PURGE_ACTIONED
Language=English
User '%1' purged scan database for job '%2'.
.
MessageId=0x2EBA
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_AUD_JOB_SCAN_PURGE_REQUESTED
Language=English
User '%1' requested purge of scan database for job '%2' : '%3'.
.
MessageId=0x2EBB
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_AUD_SET_JOB_CONFIG_OK
Language=English
User '%1' updated configuration for job '%2'.
.
MessageId=0x2EBC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_LOG_AUD_SET_JOB_CONFIG_FAILED
Language=English
User '%1' failed to update configuration for job '%2' Error: '%3'.
.
MessageId=0x2EBD
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_AUD_DELETE_JOB_OK
Language=English
User '%1' deleted job '%2'.
.
MessageId=0x2EBE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_LOG_AUD_DELETE_JOB_FAILED
Language=English
User '%1' failed to delete job '%2' Error: '%3'.
.
MessageId=0x2EBF
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_AUD_RENAME_JOB_OK
Language=English
User '%1' renamed job '%2' to '%3'.
.
MessageId=0x2EC0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_LOG_AUD_RENAME_JOB_FAILED
Language=English
User '%1' failed to rename job '%2' to '%3' Error: '%4'
.
MessageId=0x2EC1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_LOG_ODBC_ERROR
Language=English
The FSA encountered an ODBC Error for DSN '%1': %2
.
MessageId=0x2EC2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_STOP_LOC_ENUM_CRIT_ERR
Language=English
Ceasing enumeration of '%1'. Error was '%2', description: '%3'.
.
MessageId=0x2EC3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_TOO_MANY_ITEMS_ON_FREE_LIST
Language=English
There are too many items on the free list.
.
MessageId=0x2EC4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_NOT_ENOUGH_ITEMS_ON_FREE_LIST
Language=English
There are too few items on the free list.
.
MessageId=0x2EC5
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_DB_DATA_PURGE_SUCCESS_NO_JOB
Language=English
Job "%1" was purged successfully. Job had no scan database entries.
.
MessageId=0x2EC6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_FAILED_JOB_START
Language=English
Failed to start job '%1'. Error: '%2'
.
MessageId=0x2EC7
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_AUD_JOB_STOP_SIGNALLED
Language=English
User '%1' signaled job '%2' to stop.
.
MessageId=0x2EC8
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_AUD_JOB_STOP_NOT_RUNNING
Language=English
User '%1' tried to stop job '%2'. Job was not running.
.
MessageId=0x2EC9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_BAD_PE_CONFIG
Language=English
The policy engine is incorrectly configured. See log files for details.
.
MessageId=0x2ECA
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSTUB_STARTUP
Language=English
PID %1 : FStub Starting.
.
MessageId=0x2ECB
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSTUB_BIG_RED_BUTTON
Language=English
PID %1 : BigRedButton is set. Exiting immediately.
.
MessageId=0x2ECC
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSTUB_COMMAND_LINE
Language=English
PID %1 : Command line: '%2'.
.
MessageId=0x2ECD
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSTUB_STOPPED
Language=English
PID %1 : FStub Stopped. Result:'%2'
.
MessageId=0x2ECF
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSTUB_COMMAND
Language=English
PID %1 : Executed FSA command '%2' Result:'%3'.
.
MessageId=0x2ED0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSTUB_DELEGATE_CO_CREATE
Language=English
PID %1 : Failed to CoCreate delegate : '%2'.
.
MessageId=0x2ED1
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSTUB_JOB_COMPLETE
Language=English
PID %1 : FSA Job completed.
.
MessageId=0x2ED2
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSTUB_FSA_CLOSING
Language=English
PID %1 : FSA is closing before job finished.
.
MessageId=0x2ED3
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSTUB_START_JOB
Language=English
PID %1 : Started job '%2' from FSA job store.
.
MessageId=0x2ED4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSTUB_START_JOB
Language=English
PID %1 : Error starting job '%2' from FSA job store. Result:'%3'
.
MessageId=0x2ED5
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSTUB_START_JOB_FILE
Language=English
PID %1 : Started job '%2' from file '%3'.
.
MessageId=0x2ED6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSTUB_START_JOB_FILE
Language=English
PID %1 : Error starting job '%2' from file '%3'. Result:'%3'
.
MessageId=0x2ED7
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSTUB_STOPPING_JOB
Language=English
PID %1 : Stopping job.
.
MessageId=0x2ED8
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSTUB_RECONNECT
Language=English
PID %1 : Trying to reconnect to FSA.
.
MessageId=0x2ED9
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSTUB_RECONNECTED
Language=English
PID %1 : Reconnected to FSA.
.
MessageId=0x2EDA
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSTUB_RECONNECT_ABANDON
Language=English
PID %1 : Timed out trying to reconnect to FSA.
.
MessageId=0x2EDB
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSTUB_FSA_CO_CREATE
Language=English
PID %1 : Failed to connect to FSA on server '%2' Error:'%3'
.
MessageId=0x2EDC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_ACTION_ERROR
Language=English
Error occurred processing policy actions for file "%1", error was %2.
.
MessageId=0x2EDD
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSTUB_CONTROL_HANDLER_SHUTDOWN
Language=English
PID %1 : Initiating shutdown from Console handler: '%2'. 
.
MessageId=0x2EDE
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSTUB_WINDOW_HANDLER_SHUTDOWN
Language=English
PID %1 : Initiating shutdown from Window handler: '%2'. 
.
MessageId=0x2EDF
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_DELETING_FILE
Language=English
Error performing policy action: Delete file "%1". Error was '%2'
.
MessageId=0x2EE0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_REPLACING_FILE
Language=English
Error performing policy action: Replace file "%1". Error was '%2'
.
MessageId=0x2EE1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_COPYING_FILE
Language=English
Error performing policy action: Copying file "%1" to "%2". Error was '%3'
.
MessageId=0x2EE2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_LOG_TAGGING_FILE
Language=English
Error performing policy action: Tag file "%1". Error was '%2'
.
MessageId=0x2EE3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_PERFMON_INIT
Language=English
Failed to create perfmon counters for job '%1'.
.
MessageId=0x2EE4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_DELETING_RUNNING_JOB
Language=English
Unable to delete a running job. Please stop the job first.
.
MessageId=0x2EE5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_COPYTO_ACTION_NOT_SUPPORTED
Language=English
Copy-to actions are not supported by the destination location.
.
MessageId=0x2EE6
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ENUMERATION_PROGRESS_TALLY_CANCELLED
Language=English
The FSA enumeration progress tally was cancelled.
.
MessageId=0x2EE7
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_ENUMERATION_PROGRESS_TALLY_IN_PROGRESS 
Language=English
The FSA enumeration progress tally has already been started or has completed.
.
MessageId=0x2EE8
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_ENUMERATION_PROGRESS_UNAVAILABLE 
Language=English
FSA enumeration progress is unavailable for this location.
.
MessageId=0x2EE9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOBHANDLER_NOT_INSTALLED
Language=English
The handler for this FSA job type is not installed.
.
MessageId=0x2EEA
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FSA_CONSECUTIVE_ENUMERATION_NOT_SUPPORTED
Language=English
Consecutive enumeration is not supported for this FSA location type. Will fall back to concurrent enumeration.
.
MessageId=0x2EEB
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CONSECUTIVE_ENUMERATION_INIT_FAILED
Language=English
Consecutive enumeration failed to initialize. Will fall back to concurrent enumeration.
.
MessageId=0x2EEC
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_INVALID_MULTI_ENUM_LIST
Language=English
Error initializing FSA consecutive enumeration: The enumeration list is invalid.
.
MessageId=0x2EED
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_INVALID_MULTI_ENUM_LIST_SIZE
Language=English
Error initializing FSA consecutive enumeration: The enumeration list has an unexpected size.
.
MessageId=0x2EEE
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_COPY_TO_RELATIVE_PATH_NOT_SUPPORTED
Language=English
The FSA does not support relative paths in the copy-to policy action.
.
MessageId=0x2EEF
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_INDEXING_FILE
Language=English
Indexing file "%1".
.

MessageId=0x2EF0
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_INDEXED_FILE
Language=English
Completed indexing file "%1".
.

MessageId=0x2EF1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_INDEXING_FAILED_FILE
Language=English
Error occurred indexing file "%1", error was %2.
.
MessageId=0x2EF2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_JOB_RUN_FAILED
Language=English
Job aborted mid run.
.
MessageId=0x2EF3
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_LOG_INDEXING_EXCLUDED_FILE
Language=English
Excluded file "%1" from index, reason was %2.
.
MessageId=0x2EF4
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_LOG_AUD_JOB_STOP_RESET
Language=English
User '%1' stopped job '%2'. Job state was reset.
.

MessageId=0x2EF5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_LOG_INVALID_LOCATION
Language=English
The location '%1' was not found or access was denied - location will be skipped.
.

MessageId=0x2EF6
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSSA_INVALID_LOCATIONS
Language=English
One or more locations could not be found, or access was denied. See the job log for more details.
.
MessageId=0x2EF7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSSA_NO_VALID_LOCATIONS
Language=English
The Job contained no accessible locations. Please check the job log for errors related to individual locations.
.
MessageId=0x2EF8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_FAILED_JOB_INIT
Language=English
Job '%1' not started. Error: '%2'
.
MessageId=0x2EF9
Severity=Warning
Facility=Wigan
SymbolicName=WGN_E_FSA_LOG_PROGRESS_THREAD_FAILED
Language=English
The FSA progress state could not be updated because the progress thread failed with '%1'.
.
MessageId=0x2EFA
Severity=Warning
Facility=Wigan
SymbolicName=WGN_E_FSA_LOG_PROGRESS_FAILED
Language=English
The FSA progress state could not be retrieved for job %1: '%2'.
.
MessageId=0x2EFB
Severity=ERROR
Facility=Wigan
SymbolicName=WGN_E_FSA_SHAREPOINT_ITEM_NOT_INITIALISED
Language=English
The FSA Sharepoint item has not been initialized.
.
;
;// Exchange Server Agent status codes (0x2F00 to 0x2F7F)
;
MessageId=0x2F00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_FAILED_TO_CONNECT_TO_HUB
Language=English
Failed to connect to the Policy Engine Hub.
.
MessageId=0x2F01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_FAILED_HUB_CALL
Language=English
The call to the Policy Engine Hub returned an error.
.
MessageId=0x2F02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_IN_FAILURE_MODE
Language=English
The Agent is in failure mode.
.
MessageId=0x2F03
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_EXCLUDE_INTEGRATION_DISABLED
Language=English
The integration is disabled.
.
MessageId=0x2F04
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_EXCLUDE_SERVER_PROCESSED
Language=English
The message has already been processed by a server agent.
.
MessageId=0x2F05
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_EXCLUDE_APM_MAIL
Language=English
The message is a notification or audit email.
.
MessageId=0x2F06
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_EXCLUDE_BY_TYPE
Language=English
Excluded message type, e.g. report message.
.
MessageId=0x2F07
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_EXCLUDE_SSW_RESPONSE_MAIL_CONSUMED
Language=English
The message is an interactive warning response consumed by this agent.
.
MessageId=0x2F08
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_EXCLUDE_SSW_RESPONSE_MAIL_RELAYED
Language=English
The message is an interactive warning response not intended for this agent.
.
MessageId=0x2F09
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_EXCLUDE_SENDER_FILTER
Language=English
The message has been excluded by the sender filter.
.
MessageId=0x2F0A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_EXCLUDE_CLIENT_PROCESSED
Language=English
The message has already been processed by a client agent.
.
MessageId=0x2F0B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_EXCLUDE_BY_POLICY
Language=English
The message has not been captured by policy.
.
MessageId=0x2F0C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_INVALID_RECIPIENT_ADDRESS
Language=English
A recipient address is invalid or incomplete.
.
MessageId=0x2F0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_SSW_ID_NOT_FOUND
Language=English
No email ID was found.
.
MessageId=0x2F0E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_SSW_INVALID_ID
Language=English
The email ID is invalid.
.

;
;// Exchange Server Agent log codes (0x2F80 to 0x2FFF)
;
MessageId=0x2F80
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_STARTED
Language=English
Agent started.
.
MessageId=0x2F81
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_STOPPED
Language=English
Agent stopped.
.
MessageId=0x2F82
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_CAPTURED_LS
Language=English
Captured. Message: '%1!ls!'.
.
MessageId=0x2F83
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_EXCLUDED_LS_S
Language=English
Excluded. Message: '%1!ls!'. Reason: %2.
.
MessageId=0x2F84
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_FAILED_LS_S
Language=English
Failed. Message: '%1!ls!'. Reason: %2.
.
MessageId=0x2F85
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_CONNECTED_TO_HUB
Language=English
Successfully connected to the Policy Engine Hub.
.
MessageId=0x2F86
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_HUB_NOT_INSTALLED
Language=English
The Policy Engine Hub is not installed.
.
MessageId=0x2F87
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_FAILED_TO_CREATE_HUB_S
Language=English
Failed to create Policy Engine Hub, error %1.
.
MessageId=0x2F88
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_FAILED_TO_REGISTER_WITH_HUB_S
Language=English
Failed to register with Policy Engine Hub, error %1.
.
MessageId=0x2F89
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_FAILED_TO_CONFIGURE_HUB_S
Language=English
Failed to configure the Policy Engine Hub, error %1.
.
MessageId=0x2F8A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_ENTERING_FAILURE_MODE
Language=English
Entering failure mode.
.
MessageId=0x2F8B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_TRYING_TO_LEAVE_FAILURE_MODE
Language=English
Attempting to leave failure mode...
.
MessageId=0x2F8C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_FAILED_TO_PASS_EMAIL_TO_HUB_RETRYING_LS_S
Language=English
Failed to pass message '%1!ls!' to Policy Engine Hub. Retrying. Reason: %2.
.
MessageId=0x2F8D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_GIVING_UP_EMAIL_NO_HUB_LS
Language=English
Giving up on message '%1!ls!' because the Policy Engine Hub won't start.
.
MessageId=0x2F8E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_GIVING_UP_EMAIL_HUB_ERROR_LS_S
Language=English
Giving up on message '%1!ls!' due to Policy Engine Hub error %2.
.
MessageId=0x2F8F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_BLOCKED_EMAIL_LS
Language=English
Blocked message '%1!ls!'.
.
MessageId=0x2F90
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_FAILED_TO_BLOCK_EMAIL_LS_S
Language=English
Failed to block message '%1!ls!'. Reason: %2.
.
MessageId=0x2F91
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_FAILURE_MODE_DELETED_EMAIL_LS
Language=English
Applying failure mode: Deleted message '%1!ls!'.
.
MessageId=0x2F92
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_FAILURE_MODE_FAILED_TO_DELETE_EMAIL_LS_S
Language=English
Applying failure mode: Should have deleted the message, but failed. Message: '%1!ls!'. Reason: %2.
.
MessageId=0x2F93
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_FAILURE_MODE_MARK_AND_ALLOW_LS
Language=English
Applying failure mode: The message was marked and allowed to go. Message '%1!ls!'.
.
MessageId=0x2F94
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_FAILURE_MODE_ALLOW_LS
Language=English
Applying failure mode: The message was allowed to go. Message '%1!ls!'.
.
MessageId=0x2F95
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_FAILED_TO_MARK_EMAIL_LS_S
Language=English
Failed to mark the message '%1!ls!'. Reason: %2.
.
MessageId=0x2F96
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_SKIPPING_MAIL_ALREADY_PROCESSED_LS
Language=English
Skipping message already processed. Message '%1!ls!'.
.
MessageId=0x2F97
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_FAILED_SSW_LS_S
Language=English
Failed to issue a warning for message '%1!ls!'. Reason: %2.
.
MessageId=0x2F98
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_UNHANDLED_EXCEPTION_2LS
Language=English
Unhandled exception. Context: '%1!ls!'. Description: '%2!ls!'.
.
MessageId=0x2F99
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_FAILED_TO_BUILD_ACTION_EMAIL_3LS_S
Language=English
Action on message '%1!ls!' - Failed to build a notification email to send to '%2!ls!', subject '%3!ls!', error %4.
.
MessageId=0x2F9A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_FAILED_TO_SUBMIT_AN_ACTION_MAIL_3LS_S
Language=English
Action on message '%1!ls!' - Failed to submit a notification email to send to '%2!ls!', subject '%3!ls!', error %4.
.
MessageId=0x2F9B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_NOTIFICATION_EMAIL_IS_EMPTY_2LS
Language=English
Action on message '%1!ls!' - A notification email sent to '%2!ls!' is empty.
.
MessageId=0x2F9C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_PROGRESS_COUNTERS_5S
Language=English
Progress Summary: Processed %1. Captured %2. Excluded %3. Failed %4. Interactive warn pending %5.
.
MessageId=0x2F9D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_READING_CONFIGURATION
Language=English
Reading the configuration parameters.
.
MessageId=0x2F9E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_INTEGRATION_STAYING_OFF
Language=English
Integration is currently disabled.
.
MessageId=0x2F9F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_ENABLING_INTEGRATION
Language=English
Integration has been enabled.
.
MessageId=0x2FA0
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_DISABLING_INTEGRATION
Language=English
Integration has been disabled.
.
MessageId=0x2FA1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_INVALID_CONFIGURATION_STAYING_OFF
Language=English
The configuration is invalid. Integration is staying disabled.
.
MessageId=0x2FA2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_INVALID_CONFIGURATION_STAYING_ON
Language=English
The new configuration is invalid and has been discarded. Integration is staying enabled with the previous configuration.
.
MessageId=0x2FA3
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_CHANGED_CONFIGURATION_STAYING_ON
Language=English
The configuration has changed. Integration is staying enabled and is now using this new configuration.
.
MessageId=0x2FA4
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_ESA_LOG_CHANGED_REGISTRY_SETTING_NEEDS_RESTART_S
Language=English
The changed value of the registry setting '%1' will not be picked up until the agent is restarted.
.
MessageId=0x2FA5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_FAILED_TO_READ_CONFIG_S
Language=English
Failed to read the configuration, error %1.
.
MessageId=0x2FA6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_FAILED_TO_START_INTERCOM_SERVER_S
Language=English
Failed to start the inter-agent communication service, error %1.
.
MessageId=0x2FA7
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ESA_LOG_SSWARNING_OVER_80PERCENT_U
Language=English
The number of pending warned emails has exceeded 80%% of the maximum allowed by configuration (MaxPendingWarnings=%1!lu!).
Emails already pending will start heeding their warning automatically if the maximum is reached.
.
MessageId=0x2FA8
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_ESA_LOG_SSWARNING_OVERFLOW_U
Language=English
The number of pending warned emails has exceeded the maximum allowed by configuration (MaxPendingWarnings=%1!lu!).
Emails already pending have started heeding their warning automatically.
.
MessageId=0x2FA9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ESA_LOG_FAILED_TO_INITIALISE_S
Language=English
The Agent failed to initialize and will not process messages, error %1.
.

;
;// Quite Generic log codes (0x3000 - 0x30FF)
;
MessageId=0x3000
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_FAILED_TO_OPEN_REGISTRY_KEY_3S
Language=English
Failed to open registry key '%1%2', error %3.
.
MessageId=0x3001
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_FAILED_TO_READ_REGISTRY_VALUE_2S
Language=English
Failed to read registry setting '%1', error %2.
.
;// Supplying a blank value (%2) makes this message more generic.
MessageId=0x3002
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_INVALID_REGISTRY_VALUE_DATA_2S
Language=English
The registry setting '%1' contains an invalid value %2!ls!.
.
;// Supplying a blank value (%2) makes this message more generic.
MessageId=0x3003
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_INVALID_REGISTRY_VALUE_DATA_WITH_ERROR_3S
Language=English
The registry setting '%1' contains an invalid value %2!ls!, error %3.
.
MessageId=0x3004
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_ERROR_USING_REGISTRY_VALUE_3S
Language=English
Runtime error using the registry setting '%1' (runtime value %2!ls!), error %3.
.
MessageId=0x3005
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_LOG_OBSOLETE_REGISTRY_VALUE
Language=English
The registry setting '%1' is obsolete and will be ignored.
.
MessageId=0x3006
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_LOG_USING_DEFAULT_REGISTRY_SETTING_VALUE_S_LS
Language=English
The registry setting '%1' is not set. Using its default value %2!ls!.
.

;
;// File Event Store status codes.
;
MessageId=0x3100
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FILE_EVENT_CANCELLED_FROM_HASH_CHECK
Language=English
The file event analysis should be cancelled based on the file's hash check.
.
MessageId=0x3101
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FILE_EVENT_CANCELLED_FROM_HASH_CHECK
Language=English
File analysis was cancelled bacause a lookup of the file hash indicated that no analysis was required.
.

MessageId=0x3102
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FILE_EVENT_DATA_REQUIRED
Language=English
The data is required for the analysis of this event.
.

MessageId=0x3103
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FILE_EVENT_DATA_REQUIRED
Language=English
The data is required for the analysis of this event.
.

;
;// WgnTask Report module codes 0x3200-0x32FF.
;
MessageId=0x3200
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_REPORT_FILE_PARSED
Language=English
The report configuration was successfully read from task definition file %1.
.
MessageId=0x3201
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_REPORT_CONNECTED
Language=English
Connected to web service at %1.
.
MessageId=0x3202
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_REPORT_LOGGED_ON
Language=English
User %2 logged in to CMS %1.
.
MessageId=0x3203
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_REPORT_LOGGED_OFF
Language=English
User %2 logged out from CMS %1.
.
MessageId=0x3204
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_REPORT_SEARCH_STARTED
Language=English
Search '%1' has started.
.
MessageId=0x3205
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_REPORT_SEARCH_COMPLETED
Language=English
Search completed successfully.
.
MessageId=0x3206
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_REPORT_DOCUMENT_RETRIEVED
Language=English
The report document has been retrieved.
.
MessageId=0x3207
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_REPORT_DOCUMENT_WRITTEN
Language=English
The report document has been written to %1.
.
MessageId=0x3208
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_REPORT_DOCUMENT_SENT
Language=English
The report document has been emailed to %1.
.
MessageId=0x3209
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_REPORT_GENERATION
Language=English
Report generation
.
MessageId=0x320a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_REPORT_NO_WEB_SERVICE
Language=English
Unable to connect to the web service at %1.
.
MessageId=0x320b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_REPORT_LOGON_FAILED
Language=English
Failed to log in to the web service.
.
MessageId=0x320c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_REPORT_WEB_METHOD_FAILED
Language=English
The web service method %1 failed to run.
.
MessageId=0x320d
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_REPORT_FAILED_OPEN
Language=English
Unable to open the file %1 to write the report: %2
.
MessageId=0x320e
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_REPORT_FAILED_WRITE
Language=English
Unable to write the report to file %1: %2
.
MessageId=0x320f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_REPORT_FAILED_SMTP_CONNECT
Language=English
Unable to connect to the SMTP server %1.
.
MessageId=0x3210
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_REPORT_FAILED_SMTP_SEND
Language=English
Unable to send the report from %1 to %2.
.

;
;// Milter MTA Agent codes 0x3300-0x33FF.
;
MessageId=0x3300
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_MILTER_AGENT_STARTED
Language=English
The Milter MTA Agent has started.
.
MessageId=0x3301
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_MILTER_AGENT_STOPPED
Language=English
The Milter MTA Agent has stopped.
.
MessageId=0x3302
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_CONFIG_FAILURE_LOG
Language=English
Cannot continue due to configuration file error: %1.
.
MessageId=0x3303
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_CONFIG_THREAD_FAILURE_LOG
Language=English
Cannot continue due to configuration thread error: %1.
.
MessageId=0x3304
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_REGISTER_LOG
Language=English
The call to smfi_register() failed to register %1
.
MessageId=0x3305
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_SETCONN_LOG
Language=English
smfi_setconn() failed for socket '%1': %2
.
MessageId=0x3306
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_OPENSOCKET_LOG
Language=English
Failed to open socket '%1': %2
.
MessageId=0x3307
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_MAIN_FAILED_LOG
Language=English
The main processing function has failed.
.
MessageId=0x3308
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_READ_CONFIG_LOG
Language=English
Loading from the configuration file '%1' failed: %2.
.
MessageId=0x3309
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_POPULATE_LIST_LOG
Language=English
Failed to populate '%1' from configuration file: %2.
.
MessageId=0x330A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_XML_PARSE_ERROR
Language=English
Failed to parse the client actions XML.
.
MessageId=0x330B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_CREATE_XML_PARSER
Language=English
Failed to create an XML parser.
.
MessageId=0x330C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_CLIENT_ACTIONS_LOG
Language=English
Failed to process the client actions with error: %1 
.
MessageId=0x330D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_NO_SOCKET_SESSION
Language=English
No Socket Agent session.
.
MessageId=0x330E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_MILTER_ENTERING_FAILURE_MODE
Language=English
The Milter MTA Agent is entering failure mode.
.
MessageId=0x330F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_MILTER_LEAVING_FAILURE_MODE
Language=English
The Milter MTA Agent is leaving failure mode.
.
MessageId=0x3310
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_MISSING_CONFIG_VALUE_LOG
Language=English
No value for '%1' was found in the configuration file.
.
MessageId=0x3311
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_MILTER_USING_DEFAULT_VALUE_LOG
Language=English
The value for '%1' in the configuration file is invalid - using default.
.
MessageId=0x3312
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_MILTER_USING_OLD_CONFIG_LOG
Language=English
Loading a new configuration failed so continuing with current version.
.
MessageId=0x3313
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_OPEN_FAILED_LOG
Language=English
Failed to open file '%1'.
.
MessageId=0x3314
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_FILE_IO
Language=English
Error reading or writing file.
.
MessageId=0x3315
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_SOCKET_AGENT_LOG
Language=English
The Remote Socket Agent failed with error: %1
.
MessageId=0x3316
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_MESSAGE_MISMATCH
Language=English
Wrong message result received from Socket Agent
.
MessageId=0x3317
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_FAILED_TO_DELETE_X_HEADER_LOG
Language=English
Failed to delete existing x-header '%1' with error: %2.
.
MessageId=0x3318
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_FAILED_TO_ADD_X_HEADER_LOG
Language=English
Failed to add new x-header '%1' with error: %2.
.
MessageId=0x3319
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_FAILED_TO_DELETE_TO_HEADER
Language=English
Failed to delete 'To' header
.
MessageId=0x331A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_FAILED_TO_DELETE_CC_HEADER
Language=English
Failed to delete 'Cc' header
.
MessageId=0x331B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_MILTER_FAILURE_MODE_DELETE_LOG
Language=English
Applying failure mode: Deleted email with Message Id '%1'.
.
MessageId=0x331C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_MILTER_FAILURE_MODE_ALLOW_LOG
Language=English
Applying failure mode: The email was allowed to go. Message Id '%1'.
.
MessageId=0x331D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_MILTER_FAILURE_MODE_MARK_AND_ALLOW_LOG
Language=English
Applying failure mode: The email was marked and allowed to go. Message Id '%1'.
.
MessageId=0x331E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_SET_SS_STATUS_LOG
Language=English
Failed to set status header. Message Id '%1'.
.
MessageId=0x331F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_GENERATE_SS_STATUS_LOG
Language=English
Failed to generate status header for Message Id '%1' with error: %2.
.
MessageId=0x3320
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_NO_SMTP_MAIL_FROM
Language=English
No MAIL FROM in the SMTP envelope information - failing the email.
.
MessageId=0x3321
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_SENDER_INCLUSION_FILTER
Language=English
Sender address inclusion filter failed so policy will be applied.
.
MessageId=0x3322
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_NULL_CONNECTION_DATA
Language=English
Fatal error: Failed to retrieve the private connection data.
.
MessageId=0x3323
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_MILTER_VALIDATE_HEADERS_LOG
Language=English
The email header validation failed with error: %1.
.
MessageId=0x3324
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_MILTER_ALREADY_PROCESSED
Language=English
The email has been ignored as it is already marked as [server-side] processed.
.
MessageId=0x3325
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_STORE_BODYPART_LOG
Language=English
Failed to store part of the email body with error: %1.
.
MessageId=0x3326
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_DIAGNOSTIC_FILE_LOG
Language=English
Failed to create the email diagnostic files with error: %1.
.
MessageId=0x3327
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_MILTER_ABORT_EMAIL
Language=English
The email has been aborted by the MTA or another milter.
.
MessageId=0x3328
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_MEMORY_EXCEPTION
Language=English
A memory allocation exception has been caught.
.
MessageId=0x3329
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_PARTICIPANT_XML
Language=English
Failed to populate the P1 recipient XML with error: %1.
.
MessageId=0x332A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MILTER_NOT_AS_ROOT
Language=English
The Milter MTA Agent cannot be run by root or with root permissions.
.
MessageId=0x332B
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_MILTER_MOVE_EXTERNAL_LOG
Language=English
'Move External to BCC' action replaced by 'Move All to BCC' for Message Id '%1'.
.

;
;// FileNet adapter module codes 0x3400 - 0x34FF.
;
MessageId=0x3400
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FNET_RETRIEVAL_EXCEPTION
Language=English
The archive adapter for IBM FileNet P8 caught an unknown exception.
.
MessageId=0x3401
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FNET_WEB_SERVICE_SYSTEM_EXCEPTION
Language=English
The IBM FileNet P8 Web Server failed to process the request.
.
MessageId=0x3402
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FNET_WEB_SERVICE_SOAP_EXCEPTION
Language=English
An error occurred in parsing the SOAP request or response.
.
MessageId=0x3403
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FNET_WEB_SERVICE_NOT_RUNNING
Language=English
The IBM FileNet P8 Web Service is not running.
.
MessageId=0x3404
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FNET_NO_ID_PROPERTY_NAME_SPECIFIED
Language=English
Failed to obtain UniqueIDPropertyName from the registry.
.
MessageId=0x3405
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FNET_FAILED_TO_OBTAIN_CREDENTIALS
Language=English
Failed to obtain security credentials for the IBM FileNet P8 Web Service.
.
MessageId=0x3406
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FNET_ID_NOT_FOUND
Language=English
The archive adapter for IBM FileNet P8 failed to locate the email. Please check its log file for details
.
MessageId=0x3407
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FNET_RETRIEVE_FAILED
Language=English
The archive adapter for IBM FileNet P8 failed to retrieve the email. Please check its log file for details
.
MessageId=0x3408
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FNET_UNEXPECTED_RESPONSE
Language=English
The IBM FileNet P8 Web Server returned an unexpected response. 
.
MessageId=0x3409
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FNET_WEB_SERVICE_WEB_EXCEPTION
Language=English
The IBM FileNet P8 Web Server failed to process a request.
.
MessageId=0x340a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FNET_NO_OBJECT_STORE_SPECIFIED
Language=English
Failed to obtain ObjectStore from the registry.
.
MessageId=0x340b
Severity=Informational
Facility=Wigan
SymbolicName=WGN_FNET_RETRIEVAL_STATUS
Language=English
Retrieval of asset '%1' returned status 0x%2!08x!
.

;
;// Remote Socket Agent codes 0x3500 - 0x35FF.
;
MessageId=0x3500
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RSA_MALLOC_FAILED
Language=English
Remote Socket Agent memory allocation error.
.
MessageId=0x3501
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RSA_SOCKET_CONNECT
Language=English
Failed to connect to the Socket Agent.
.
MessageId=0x3502
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RSA_INVALID_SESSION
Language=English
Invalid session handle.
.
MessageId=0x3503
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RSA_SOCKET_CLOSE
Language=English
Error closing Socket Agent connection.
.
MessageId=0x3504
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RSA_MESSAGE_NOT_FOUND
Language=English
Message not found in session.
.
MessageId=0x3505
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RSA_SEND_ERROR
Language=English
Error sending data to the Socket Agent.
.
MessageId=0x3506
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RSA_SOCKET_READ_ERROR
Language=English
Error receiving data from the Socket Agent.
.
MessageId=0x3507
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RSA_SOCKET_READ_CLOSED
Language=English
Error receiving data as the socket is unexpectedly closed.
.
MessageId=0x3508
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RSA_INVALID_MESSAGE
Language=English
Invalid message handle.
.
MessageId=0x3509
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RSA_RESULTS_UNAVAILABLE
Language=English
No results are available for the message.
.
MessageId=0x350A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RSA_ASSIGN_HANDLE_FAILED
Language=English
Failed to assign handle to object.
.
MessageId=0x3510
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_RSA_NO_XML_RESULTS
Language=English
No XML results were returned for this message.
.
MessageId=0x3511
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_RSA_SOCKET_READ_TIMEOUT
Language=English
The recv timeout value was exceeded.
.
MessageId=0x3512
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_RSA_RESULT_AVAILABLE
Language=English
The results for this message are already available.
.
MessageId=0x3513
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RSA_SO_KEEPALIVE_FAILED
Language=English
Failed to set SO_KEEPALIVE on socket.
.
MessageId=0x3514
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RSA_TCP_KEEPIDLE_FAILED
Language=English
Failed to set TCP_KEEPIDLE on socket.
.
MessageId=0x3515
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RSA_TCP_KEEPINTVL_FAILED
Language=English
Failed to set TCP_KEEPINTVL on socket.
.
MessageId=0x3516
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_RSA_TCP_KEEPCNT_FAILED
Language=English
Failed to set TCP_KEEPCNT on socket.
.

;
;// Policy on Print Codes 0x3600 - 0x36FF.
;// Incorporates the following ranges:
;//		EMF				  0x3600 - 0x361F
;//		WgnHK			  0x3620 - 0x363F
;//		Policy on Print	  0x3640 - 0x36FF
;//		PoP Log Messages  0x3670 - 0x368F
;//		Print Screen	  0x3690 - 0x36AF
;

;
;// EMF & Wigan EMF Files 0x3600 - 0x361f
;
MessageId=0x3600
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_EMFFILE_PAGE_OOB
Language=English
The requested page number is out of bounds
.
MessageId=0x3601
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMF_DC_UNAVAILABLE
Language=English
The EMF Device Context is not available.
.
MessageId=0x3602
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMF_NOT_INITIALISED
Language=English
The EMF has not been initialized.
.
MessageId=0x3603
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMF_HANDLE_UNAVAILABLE
Language=English
The EMF handle is not available.
.
MessageId=0x3604
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMFFILE_NOT_INITIALISED
Language=English
The Wigan EMF file has not been initialized.
.
MessageId=0x3605
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMFFILE_WRITE_SIZE_MISMATCH
Language=English
The number of bytes written to the Wigan EMF File did not match the number of bytes requested.
.
MessageId=0x3606
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMFFILE_READ_SIZE_MISMATCH
Language=English
The number of bytes read from the Wigan EMF File did not match the number of bytes requested.
.
MessageId=0x3607
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMFFILE_INVALID_FILE
Language=English
The current file is not a valid Wigan EMF file.
.
MessageId=0x3608
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMFFILE_INVALID_PAGE_NUMBER
Language=English
The number of the retrieved page does not match the requested page number.
.
MessageId=0x3609
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMFFILE_VIEWSTREAMS_NOT_ENABLED
Language=English
An IStream view was requested on the Wigan EMF file but View Streams have not been enabled.
.

;
;// Wgn Hook 0x3620 - 0x363f
;
MessageId=0x3620
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_HOOK_LOG_CAUGHT_EXCEPTION
Language=English
Wigan Hook caught an exception trying to hook process %1. Code: %2, EIP: %3
.
MessageId=0x3621
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_HOOK_LOG_WGNPRN_LOAD_FAILED
Language=English
The Client Print Agent DLL (WgnPrn.dll) failed to load. Error is %1.
.
MessageId=0x3622
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_HOOK_WGNPRN_LOAD_FAILED
Language=English
The Client Print Agent DLL (WgnPrn.dll) failed to load.
.
MessageId=0x3623
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_HOOK_WGNPRN_INVALID
Language=English
The Client Print Agent DLL (WgnPrn.dll) is invalid.
.

;
;// Policy on Print 0x3640 - 0x36FF
;
MessageId=0x3640
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINT_NOT_INITIALISED
Language=English
The CWgnPolicyOnPrint object has not been initialized.
.
MessageId=0x3641
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINT_ALREADY_INITIALISED
Language=English
The CWgnPolicyOnPrint object is already initialized.
.
MessageId=0x3642
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINT_TLS_OUT_OF_INDEXES
Language=English
Thread local storage allocation failed.
.
MessageId=0x3643
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINT_GLYPH_MAP_FONT_NOT_SET
Language=English
SetCurrentFont() has not been called for the provided device context.
.
MessageId=0x3644
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRINT_GLYPH_MAP_CHARACTER_NOT_FOUND
Language=English
The Glyph Map could not find a character for the provided glyph.
.
MessageId=0x3645
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRINT_WORK_QUEUE_SHUTDOWN
Language=English
The print job's work queue has shut down.
.
MessageId=0x3646
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINT_WORK_QUEUE_EMPTY
Language=English
An attempt was made to retrieve an item from an empty print job work queue.
.
MessageId=0x3647
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINT_WORK_QUEUE_WAIT_TIMEOUT
Language=English
Timed out waiting for an item to be added to the work queue.
.
MessageId=0x3648
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINT_HOLDINGFILE_NOT_INITIALISED
Language=English
The Print Holding File has not been initialized.
.
MessageId=0x3649
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINT_HOLDINGFILE_WRITE_SIZE_MISMATCH
Language=English
The number of bytes written to the Print Holding File did not match the number of bytes requested.
.
MessageId=0x364A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINT_HOLDINGFILE_READ_SIZE_MISMATCH
Language=English
The number of bytes read from the Print Holding File did not match the number of bytes requested.
.
MessageId=0x364B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINT_HOLDINGFILE_INVALID_DATA
Language=English
The Print Holding File contains invalid data.
.
MessageId=0x364C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINT_HOLDINGFILE_INVALID_ACTION_TYPE
Language=English
The Print Holding File contains an invalid action type.
.
MessageId=0x364D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRINT_HOLDINGFILE_EOF
Language=English
The end of the holding file has been reached.
.
MessageId=0x364E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRINT_AGENT_DISABLED
Language=English
The policy on print agent is disabled.
.
MessageId=0x364F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRINT_MAPPED_SYMBOL_PVT_GLYPHS
Language=English
Symbol font glyphs representing unicode private use characters were mapped to ANSI characters.
.

;
;// Policy on Print Log Messages 0x3670 - 0x368F
;
MessageId=0x3670
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_PRINT_CLIENT_CAUGHT_EXCPETION
Language=English
The Client Print System Agent plug-in caught an exception in %1: %2.
.
MessageId=0x3671
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_PRINT_SERVER_CAUGHT_EXCPETION
Language=English
The Client Print System Agent server caught an exception in %1: %2.
.
MessageId=0x3672
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_PRINT_FAILED_TO_INITIALISE
Language=English
Failed to Initialize Client Print Agent with error '%1'.
.
MessageId=0x3673
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_LOG_PRINT_STARTDOC_ANALYSIS_SUCCEEDED
Language=English
Client Print System Agent: Analysis of StartDocument Event '%1' succeeded. Action=%2.
.
MessageId=0x3674
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_PRINT_STARTDOC_ANALYSIS_FAILED
Language=English
Client Print System Agent: Analysis of StartDocument Event '%1' failed with '%2'.
.
MessageId=0x3675
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_LOG_PRINT_ENDDOC_ANALYSIS_SUCCEEDED
Language=English
Client Print System Agent: Analysis of EndDocument Event '%1' succeeded. Action=%2.
.
MessageId=0x3676
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_PRINT_ENDDOC_ANALYSIS_FAILED
Language=English
Client Print System Agent: Analysis of EndDocument Event '%1' failed with '%2'.
.
MessageId=0x3677
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_LOG_PRINT_JOB_CANCELED
Language=English
Client Print System Agent: The document '%1' was cancelled by the user before analysis.
.

;
;// Policy on Print Screen 0x3690 - 0x36AF
;
MessageId=0x3690
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINTSCR_SESSION_UNAVAILABLE
Language=English
Print Screen integration failed to initialize because the users' Session was unavailable.
.
MessageId=0x3691
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINTSCR_POLICYSTORE_UNAVAILABLE
Language=English
Print Screen integration failed to initialize because the users' Policy Store was unavailable.
.
MessageId=0x3692
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRINTSCR_ALREADY_INITIALISED
Language=English
Print Screen integration has already been initialized.
.
MessageId=0x3693
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINTSCR_NOT_INITIALISED
Language=English
Print Screen integration has not been initialized.
.
MessageId=0x3694
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRINTSCR_LOG_PRINT_SCREEN_CANCELLED
Language=English
A Print Screen request has been cancelled.
.
MessageId=0x3695
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRINTSCR_LOG_PRINT_SCREEN_ALLOWED
Language=English
A Print Screen request has been allowed.
.
MessageId=0x3696
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRINTSCR_LOG_STARTED
Language=English
The Print Screen Agent has been started.
.

;
;// Policy on Save Codes 0x3700 - 0x37FF.
;
MessageId=0x3700
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SAVE_POS_NOT_INITIALISED
Language=English
The WgnPolicyOnSave object was not initialized.
.
MessageId=0x3701
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SAVE_POS_ALREADY_INITIALISED
Language=English
The WgnPolicyOnSave object is already initialized.
.
MessageId=0x3702
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SAVE_CONNECTOR_ALREADY_INITIALISED
Language=English
The WgnPolicyOnSaveConnector object is already initialized.
.
MessageId=0x3703
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SAVE_INVALID_FUNCTION_FOR_CHANGE_EVENT
Language=English
The function could not be applied to the type of change event supplied.
.
MessageId=0x3704
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SAVE_INVALID_ACTION_FOR_CHANGE_EVENT
Language=English
The policy action could not be applied to the type of change event supplied.
.
MessageId=0x3705
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SAVE_ACTION_HAS_NO_EFFECT
Language=English
The policy action could not be passed to the File Change Handler, and so has had no effect.
.
MessageId=0x3706
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SAVE_CONNECTOR_NOT_INITIALISED
Language=English
The WgnPolicyOnSaveConnector object is not initialized.
.

;
;// Policy on Save Log Messages
;
MessageId=0x3720
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_SAVE_ANALYSIS_FAILED
Language=English
The Client File System Agent failed to analyze event with error '%1'.
.
MessageId=0x3721
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_LOG_SAVE_ANALYSIS_COMPLETED
Language=English
Client File System Agent: Analysis of file '%1' moving to '%2' completed successfully (%3).
.
MessageId=0x3722
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_SAVE_ANALYSIS_COMPLETED_WITH_FAILURE
Language=English
Client File System Agent: Analysis of file '%1' moving to '%2' failed with '%3'.
.
MessageId=0x3723
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_LOG_SAVE_ANALYSIS_INCOMPLETE
Language=English
Client File System Agent: Analysis of file '%1' moving to '%2' did not complete (%3).
.
MessageId=0x3724
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_SAVE_CREATE_EVENT_FAILED
Language=English
Client File System Agent: Failed to create event for file '%1' moving to '%2' with error '%3'.
.
MessageId=0x3725
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_LOG_SAVE_FILE_DELETED
Language=English
Client File System Agent: File '%1' moving to '%2' was deleted.
.
MessageId=0x3726
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_SAVE_FILE_DELETE_FAILED
Language=English
Client File System Agent: File '%1' moving to '%2' could not be deleted (%3).
.
MessageId=0x3727
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_SAVE_CAUGHT_EXCEPTION
Language=English
The Client File System Agent caught an exception in '%1': %2.
.
MessageId=0x3728
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_POS_CRYPTO_TOOL_COPY_FAILED
Language=English
The Client File System Agent failed to copy the CA cryptography tool (CADLPEnc.exe) when processing file '%1' moving to '%2'. %3.
.
MessageId=0x3729
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_POS_ENCRYPTION_FAILED
Language=English
The Client File System Agent failed to encrypt '%1' moving to '%2'. File will be deleted. %3.
.
MessageId=0x372A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MESSAGE_POS_CRYPTO_TOOL_COPY_FAILED
Language=English
The Client File System Agent failed to copy the CA cryptography tool to %1.
%2 can not be decrypted without this tool. Please contact your system administrator for assistance.
.
MessageId=0x372B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MESSAGE_POS_ENCRYPTION_FAILED
Language=English
The Client File System Agent failed to encrypt %1. The file operation was cancelled.
Please contact your system administrator for assistance.
.
MessageId=0x372C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_POS_IMPERSONATION_FAILED_COPYING_WGNCRYPT
Language=English
The Client File System Agent failed to impersonate the process' user before copying the CA cryptography tool (CADLPEnc.exe). %1.
.
MessageId=0x372D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_POS_IMPERSONATION_FAILED
Language=English
The Client File System Agent failed to impersonate the process' user. %1.
.
MessageId=0x372E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_POS_ENCFILE_EXISTS_FAILED
Language=English
The Client File System Agent failed to determine if %1.enc already exists. %2.
.
MessageId=0x372F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_POS_PRE_ENCRYPTION_FAILED
Language=English
The Client File System Agent failed to pre-encrypt '%1' moving to '%2'. File will be deleted. %3.
.
MessageId=0x3730
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_MESSAGE_POS_PRE_ENCRYPTION_FAILED
Language=English
The Client File System Agent encountered an error during the analysis of '%1'. The file operation was cancelled.
Please contact your system administrator for assistance.
.

;
;// Policy on Print/Save Common Codes 0x3800 - 0x38FF.
;
MessageId=0x3800
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINTSAVE_PROXY_UI_UNAVAILABLE
Language=English
The Proxy User Interface is not available.
.
MessageId=0x3801
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINTSAVE_OBJECT_TABLE_NOT_INITIALISED
Language=English
The WgnObjectTable object did not successfully initialize.
.
MessageId=0x3802
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRINTSAVE_INVALID_CLIENT_TYPE
Language=English
The client type is invalid for the requested operation.
.

;
;// Policy on Print/Save Common Log Messages
;
MessageId=0x3820
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_PRINTSAVE_PXUI_STARTUP_FAILURE
Language=English
The Proxy UI process failed on startup with error '%1'. Exit code was %2.
.
MessageId=0x3821
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_PRINTSAVE_CPT_CREATION_FAILED
Language=English
Failed to create Client Policy Table with error '%1'.
.
MessageId=0x3822
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_PRINTSAVE_PROXYUI_FAILED_TO_CONNECT
Language=English
The ProxyUI failed to connect to its client policy helper with error '%1'.
.
MessageId=0x3823
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_PRINTSAVE_PROXYUI_FAILED_TO_FIND_HELPER
Language=English
The Proxy UI failed to obtain client policy helper object: %1
.
MessageId=0x3824
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_PRINTSAVE_PXUI_CREATION_FAILURE
Language=English
Failed to create the ProxyUI Process: %1
.

;/////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////
;// FileChangeHandler 0x3900 - 0x39FF.
;// subdivided as follows...
;// Kernel Filter     0x3900 - 0x397F
;// User COM server   0x3980 - 0x39FF
;

;/////////////////////////////////////////////////////////////////
;// Kernel Filter LOG codes  0x3900 - 0x391F
;// N.B all filter log messages must have %2 parameter and no others

MessageId=0x3900
Severity=Informational
Facility=Wigan
SymbolicName=WGN_S_POS_LOG_FILTER_LOADED_OK
Language=English
The filter has loaded successfully. %2
.
MessageId=0x3901
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_LOG_FILTER_FAILED_TO_LOAD
Language=English
The filter failed to load %2
.
MessageId=0x3902
Severity=Informational
Facility=Wigan
SymbolicName=WGN_S_POS_LOG_FILTER_UNLOADED
Language=English
The filter has unloaded. %2
.
MessageId=0x3903
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_LOG_DEVICE_QUERY_FAILED
Language=English
The filter detected a new device %2 was but was unable to query its properties.  The filter therefore cannot attach to the device.
.
MessageId=0x3904
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_POS_LOG_USER_PORT_CONNECTED
Language=English
The filter has connected to the Client File System Agent Handler. %2
.
MessageId=0x3905
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_POS_LOG_USER_PORT_DISCONNECTED
Language=English
The filter has disconnected from the Client File System Agent Handler. %2
.
MessageId=0x3906
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_LOG_INVALID_CONFIG_COMMAND
Language=English
The filter received a configuration command with an invalid code.  ConfigCode=%2
.
MessageId=0x3907
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_LOG_INVALID_CONTROL_COMMAND
Language=English
The filter received a control command with an invalid code.  ControlCode=%2
.
MessageId=0x3908
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_POS_LOG_FILE_POLICY_APPLIED
Language=English
The filter has applied policy to this file. %2
.
MessageId=0x3909
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_LOG_FAILED_TO_APPLY_FILE_POLICY
Language=English
The filter failed to apply policy to this file. %2
.
MessageId=0x390A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_LOG_FAILED_TO_DETERMINE_FILE_POLICY
Language=English
The filter could not determine what policy to apply to this file.  The default policy will be applied. %2
.
MessageId=0x390B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_POS_LOG_NO_DEVICE_POLICY_APPLIED
Language=English
The filter will not apply policy to %2
.
MessageId=0x390C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_POS_LOG_DEVICE_POLICY_APPLIED
Language=English
The filter will apply policy to %2
.
MessageId=0x390D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_LOG_FAILED_TO_DETERMINE_DEVICE_POLICY
Language=English
The filter could not determine what policy to apply to %2. The default policy will be applied.
.
MessageId=0x390E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_LOG_TIMEOUT_WAITING_FOR_POLICY
Language=English
The filter timed out while waiting for a policy decision from the FileChangeHandler. %2
.
MessageId=0x390F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_LOG_OUT_OF_MEMORY
Language=English
The filter was unable to allocate memory. %2
.
MessageId=0x3910
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_LOG_UNEXPECTED_EXCEPTION
Language=English
The filter threw an exception. %2
.
MessageId=0x3911
Severity=Informational
Facility=Wigan
SymbolicName=WGN_S_POS_LOG_ATTACHED_TO_VOLUME
Language=English
The filter has attached to %2
.
MessageId=0x3912
Severity=Informational
Facility=Wigan
SymbolicName=WGN_S_POS_LOG_DETACHED_FROM_VOLUME
Language=English
The filter has detached from %2
.
MessageId=0x3913
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_LOG_FAILED_TO_READ_FILE
Language=English
The filter was unable to read data from the file. %2
.
MessageId=0x3914
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_LOG_SCHEMA_MISMATCH
Language=English
The communication schema between the filter and handler is mismatched.  The port has been closed to prevent any errors. %2
.
MessageId=0x3915
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_POS_LOG_DEVICE_POLICY_READ_ONLY_APPLIED
Language=English
%2 has been made read-only by policy
.
MessageId=0x3916
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_POS_LOG_DEVICE_POLICY_USER_POLICY_APPLIED
Language=English
Data written to %2 will be subject to user policy analysis
.
MessageId=0x3917
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_POS_LOG_DEVICE_POLICY_NO_POLICY_APPLIED
Language=English
Data written to %2 will not be subject to policy analysis
.
MessageId=0x3918
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_LOG_FAILED_TO_WRITE_FILE
Language=English
The filter was unable to write data to the file. %2
.
MessageId=0x3919
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_LOG_FAILED_TO_SET_FILE_INFO
Language=English
The filter was unable to set the file information for %2
.

;/////////////////////////////////////////////////////////////////
;// Kernel Filter STATUS codes  0x3940 - 0x397F
;// N.B all filter status messages must have no parameters

MessageId=0x3940
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_CLIENT_NOT_RUNNING
Language=English
The File Agent Handler (PE service) is not running
.
MessageId=0x3941
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_SCHEMA_MISMATCH
Language=English
The filter and handler (PE service) are mismatched.  The filter cannot connect to the handler.
.
MessageId=0x3942
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_NO_POLICY_AVAILABLE
Language=English
The filter could not obtain a policy decision from the handler.
.
MessageId=0x3943
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_ALREADY_CONNECTED
Language=English
The filter is already connected to an instance of the handler.
.
MessageId=0x3944
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_INVALID_CONFIG_REQUEST
Language=English
The filter received an invalid configuration request.
.
MessageId=0x3945
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_INVALID_STATUS_REQUEST
Language=English
The filter received an invalid status request.
.
MessageId=0x3946
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_INVALID_CONTROL_REQUEST
Language=English
The filter received an invalid control request.
.
MessageId=0x3947
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_POS_TIMEOUT_WAITING_FOR_POLICY
Language=English
The filter timed out waiting for a policy decision from the handler.
.
MessageId=0x3948
Severity=Informational
Facility=Wigan
SymbolicName=WGN_S_POS_CONFIG_UNNECESSARY
Language=English
The filter already had this configuration element added/removed.
.

;// Kernel Filter END
;/////////////////////////////////////////////////////////////////

;/////////////////////////////////////////////////////////////////
;// WgnFCH user mode LOG codes  0x3980 - 0x39BF

MessageId=0x3980
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_LOG_INVALID_NOTIFIER_INTERFACE
Language=English
The Client File System Agent handler was passed an invalid piNotifier parameter to the Initialize method.  The interface does not implement IWgnFileChangeNotifier.
.
MessageId=0x3981
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FCH_LOG_INITIALISED
Language=English
The Client File System Agent handler has initialized and is connected to the filter.
.
MessageId=0x3982
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_LOG_CONNECTION_FAILED
Language=English
The Client File System Agent handler has failed to connect to the filter.  Error=%1.
.
MessageId=0x3983
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FCH_LOG_DISCONNECTED
Language=English
The Client File System Agent handler has disconnected from the filter.  Status=%1
.
MessageId=0x3984
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FCH_LOG_SHUTDOWN
Language=English
The Client File System Agent handler has shut down.
.
MessageId=0x3985
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_FCH_LOG_CONFIGURE_OK
Language=English
The Client File System Agent handler has applied the configuration '%1'.
.
MessageId=0x3986
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_LOG_CONFIGURE_FAILED
Language=English
The Client File System Agent handler failed to apply the configuration.  Error=%1.
.
MessageId=0x3987
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_LOG_STATUS_FAILED
Language=English
The Client File System Agent handler failed obtain the status.  Error=%1.
.
MessageId=0x3988
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_LOG_CONTROL_FAILED
Language=English
The Client File System Agent handler failed to execute the control function.  Error=%1.
.
MessageId=0x3989
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_FCH_LOG_CONFIG_TYPE_VALUE
Language=English
The Client File System Agent handler element configuration returned the following status: %1.
.
MessageId=0x398A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FCH_LOG_PORT_CONNECTED
Language=English
The Client File System Agent handler has opened a port to the filter.
.
MessageId=0x398B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FCH_LOG_THREADS_CREATED
Language=English
The Client File System Agent handler has created the worker threads and message requests.
.
MessageId=0x398C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FCH_LOG_CONFIG_COMPLETE
Language=English
The Client File System Agent handler has completed the initial filter configuration.
.
MessageId=0x398D
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FCH_LOG_PORT_DISCONNECTED
Language=English
The Client File System Agent handler has disconnected from the filter.
.
MessageId=0x398E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_LOG_FOH_NOT_FOUND
Language=English
The Client File System Agent handler received a DataAvailable notification from a file that it is not holding open for analysis.
.
MessageId=0x398F
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_FCH_LOG_EVENT_CREATED
Language=English
The Client File System Agent handler has created a new change event for file '%1'.
.
MessageId=0x3990
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_LOG_FILTER_LOAD_FAILED
Language=English
The Client File System Agent handler failed to start the Filter.  Error=%1.
.
MessageId=0x3991
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FCH_LOG_APPLY_POLICY
Language=English
The Client File System Agent has applied the policy '%1' to %2.
.
MessageId=0x3992
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_LOG_OUT_OF_MEMORY
Language=English
The Client File System Agent handler was unable to allocate %1 bytes of memory in function '%2'.
.
MessageId=0x3993
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_LOG_UNEXPECTED_EXCEPTION
Language=English
The Client File System Agent handler threw an exception: %1.
.
MessageId=0x3994
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_LOG_REGISTRY_MISSING
Language=English
The Client File System Agent handler is missing essential registry configuration and cannot load.  Error=%1.
.
MessageId=0x3995
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_FCH_LOG_GENERIC_STRING
Language=English
%1
.
MessageId=0x3996
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_LOG_TIMEOUT
Language=English
The Client File System Agent handler timed out %1.
.
MessageId=0x3997
Severity=Error
Facility=Wigan
SymbolicName=WGN_FCH_LOG_MISMATCHED_SCHEMA
Language=English
The communication schema between the Client File System Agent handler and filter is mismatched.  The port has been closed to prevent any errors.  Check that WgnPoS.sys and WgnFCH.dll have been installed as a matched pair.
.
MessageId=0x3998
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_FILE_READ_ERROR
Language=English
The Client File System Agent was unable to read from the file '%1'. Error was %2.
.
MessageId=0x3999
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_LOG_INVALID_CONFIG_DATA
Language=English
The Client File System Agent was given invalid configuration data: '%1'.
.
MessageId=0x399A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FCH_LOG_DEVICE_POLICY_READ_ONLY_APPLIED
Language=English
Volume %1 has been made read-only by policy.
.
MessageId=0x399B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FCH_LOG_DEVICE_POLICY_USER_POLICY_APPLIED
Language=English
Volume %1 will be subject to Data in Motion policy.
.
MessageId=0x399C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FCH_LOG_DEVICE_POLICY_NO_POLICY_APPLIED
Language=English
Volume %1 will not be subject to Data in Motion policy.
.
MessageId=0x399D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FCH_LOG_FILE_POLICY_ALLOWED
Language=English
The Client File System Agent has allowed the change to file '%1'.
.
MessageId=0x399E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FCH_LOG_FILE_POLICY_DELETED
Language=English
The Client File System Agent has deleted file '%1'.
.
MessageId=0x399F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_LOG_TIMEOUT_FILTER
Language=English
The Client File System Agent handler timed out while connecting to the filter.
.
MessageId=0x39A0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_LOG_TIMEOUT_DATA
Language=English
The Client File System Agent handler timed out while waiting for the file read/write operation to complete.
.
MessageId=0x39A1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_FILE_WRITE_ERROR
Language=English
The Client File System Agent was unable to write to the file '%1'. Error was %2.
.
MessageId=0x39A2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_FILE_RESIZE_ERROR
Language=English
The Client File System Agent was unable to resize file '%1'. Error was %2.
.
MessageId=0x39A3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_FILE_RENAME_ERROR
Language=English
The Client File System Agent was unable to rename file '%1'. Error was %2.
.
MessageId=0x39A4
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FCH_LOG_FILE_POLICY_ENCRYPTED
Language=English
The Client File System Agent has allowed the change to file '%1' because it has been encrypted.
.

;/////////////////////////////////////////////////////////////////
;// WgnFCH user mode STATUS codes  0x39C0 - 0x39FF
;// N.B all FCH status codes must have no insertion strings

MessageId=0x39C0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_ALREADY_INITIALISED
Language=English
The Client File System Agent handler has already been initialized.
.
MessageId=0x39C1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_CONFIG_FAILED
Language=English
The Client File System Agent handler failed to apply the configuration.
.
MessageId=0x39C2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_CONNECTION_FAILED
Language=English
The Client File System Agent handler failed to connect to the filter.
.
MessageId=0x39C3
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FCH_FILTER_NOT_CONNECTED
Language=English
The Client File System Agent handler disconnected from the filter.
.
MessageId=0x39C4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_INVALID_STATUS_REQUEST
Language=English
The Client File System Agent handler was passed an invalid status request.
.
MessageId=0x39C5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_TIMEOUT
Language=English
The Client File System Agent handler timed out.
.
MessageId=0x39C6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FCH_NO_READ_DURING_CALLBACK
Language=English
The Client File System Agent handler does not permit file data to be read or written from within the IWgnFileChangeNotifier::EventReceived callback.
.

;// WgnFCH user mode END
;/////////////////////////////////////////////////////////////////

; // 
; // Socket Utility Messages 0x3A00 to 0x3AFF equivalent to
; // Socket Utility Log Messages 0x3B00 to 0x3BFF
; // Some messages are equivalent to Socket Utility Log Messages contained in the
; // Distributor / Distributor Agent integration log codes 0x1700 - 0x17FF
; // Please use the unused message numbers.
; //
MessageId=0x3A02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_INVALID_SCHEMA
Language=English
Message schema was not recognized.
.
MessageId=0x3A03
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_INVALID_MESSAGE_SIZE_TOO_SMALL
Language=English
The length of a received message is smaller than the smallest possible message.
.
MessageId=0x3A15
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_COULD_NOT_FIND_SOCKET
Language=English
An existing socket connection could not be found to the required destination.
.
MessageId=0x3A16
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_FAILED_TO_LOAD_WINSOCK
Language=English
WinSock could not be loaded.
.
MessageId=0x3A17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_FAILED_WINSOCK_VERSION
Language=English
The required version of WinSock could not be loaded.  At least version 2.2 is required.
.
MessageId=0x3A18
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_FAIL_CREATE_LISTENING_SKT
Language=English
A listening socket could not be created.
.
MessageId=0x3A19
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_FAIL_BIND_LISTENING_SKT
Language=English
A listening socket could not be bound to on port.
.
MessageId=0x3A1A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_FAIL_SET_LISTENING_BACKLOG
Language=English
Failed to set the backlog on a listening socket.
.
MessageId=0x3A1B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_FAIL_CREATE_ACCEPT_THREAD
Language=English
Failed to start the listening socket accept thread.
.
MessageId=0x3A3C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_COULD_NOT_CONNECT_SOCKET
Language=English
A connection could not be made to the destination machine.
.
MessageId=0x3A3D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_COULD_NOT_SEND_ON_SOCKET
Language=English
Data could not be send to port so the connection will be closed.
.
MessageId=0x3A3E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_COULD_NOT_CREATE_OUT_SOCKET
Language=English
An outgoing socket connection could not be created.
.
MessageId=0x3A59
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_FAIL_CREATE_CLEAN_THREAD
Language=English
Failed to start the socket clean up thread.
.
MessageId=0x3AA5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_SO_KEEPALIVE_FAILED
Language=English
Failed to set Keep Alive on socket.
.

; // 
; // Socket Utility Log Messages 0x3B00 to 0x3BFF
; // These messages are equivalent to Socket Utility Log Messages contained in the
; // Distributor / Distributor Agent integration log codes 0x1800 - 0x18FF
; // Please use the unused message numbers.
; //
MessageId=0x3B16
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_FAILED_TO_LOAD_WINSOCK
Language=English
WinSock could not be loaded - %1.
.
MessageId=0x3B17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_FAILED_WINSOCK_VERSION
Language=English
The required version of WinSock could not be loaded.  At least version 2.2 is required but %1.%2 was found.
.
MessageId=0x3B19
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_FAIL_BIND_LISTENING_SKT
Language=English
A listening socket could not be bound to on port %1 - %2.
.
MessageId=0x3B1A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_FAIL_SET_LISTENING_BACKLOG
Language=English
Socket %1: Failed to set the backlog on a listening socket - %2.
.
MessageId=0x3B3D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_COULD_NOT_SEND_ON_SOCKET
Language=English
Socket %1: Data could not be send to %2 port %3 so the connection will be closed - %4.
.
MessageId=0x3B3E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_COULD_NOT_CREATE_OUT_SOCKET
Language=English
Socket %1: An outgoing socket connection could not be created - %2.
.
MessageId=0x3B4A
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_SOCKETUTILS_LOG_FAILED_TO_CONNECT
Language=English
Cannot connect socket to %1 port %2 - %3.
.
MessageId=0x3B4C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETUTILS_LOG_CLOSING_CONNECTION
Language=English
Socket %1: Closing socket connection to %2 port %3 (leaving %4 connections).
.
MessageId=0x3B4D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETUTILS_LOG_CREATING_OUTGOING_CONNECTION
Language=English
Socket %1: Creating outgoing connection to %2 port %3 (making %4 connections).
.
MessageId=0x3B4E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_SOCKETUTILS_LOG_CREATING_INCOMING_CONNECTION
Language=English
Socket %1: Creating incoming connection on port %2 from %3 port %4 (making %5 connections).
.
MessageId=0x3B6C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_FAIL_ALLOC_MSG_SKT
Language=English
Failed to allocate an internal data structure to manage an incoming connection.
.
MessageId=0x3B6D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_ASYNC_RECV_ERROR
Language=English
Socket %1: Failed to start reading a message header from %2 port %3 - %4.
.
MessageId=0x3B6E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_FAIL_RCV_HEADER
Language=English
Socket %1: Failed to complete reading a message header from %2 port %3 - %4.
.
MessageId=0x3B6F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_FAIL_ALLOC_MSG_BLK
Language=English
Failed to allocate an internal data structure to manage an incoming message.
.
MessageId=0x3B70
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_SKT_CLOSED_NO_HDR
Language=English
Socket %1: Failed to read a message header because the socket from %2 port %3 closed.
.
MessageId=0x3B71
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_SKT_CLOSED_NO_HDR_ERR
Language=English
Socket %1: Failed to read a message header because the socket from %2 port %3 closed - %4.
.
MessageId=0x3B72
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_BAD_MSG_HDR_SCHEMA
Language=English
Socket %1: Invalid schema version %2 received - closing socket from %3 port %4.
.
MessageId=0x3B73
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_BAD_MSG_HDR_SIZE
Language=English
Socket %1: Invalid message size in header (%2) - closing socket from %3 port %4.
.
MessageId=0x3B74
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_NO_MESSAGE_MEM
Language=English
Socket %1: Failed to allocate %2 bytes for message - closing socket from %3 port %4.
.
MessageId=0x3B75
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_SKT_CLOSED_NO_MSG
Language=English
Socket %1: Failed to read a message because the socket from %2 port %3 closed.
.
MessageId=0x3B76
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_SKT_CLOSED_NO_MSG_ERR
Language=English
Socket %1: Failed to read a message because the socket from %2 port %3 closed - %4.
.
MessageId=0x3B87
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_SHUTDOWN_ERROR
Language=English
Socket %1: Error shutting down %2 port %3 - %4.
.
MessageId=0x3B99
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_EXCEPTION_CLOSE_RECEIVEALL
Language=English
An Exception occurred closing sockets during shutdown.
.
MessageId=0x3B9A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_EXCEPTION_SOCKET_ENUMERATION
Language=English
An Exception occurred during Socket Enumeration.
.
MessageId=0x3B9B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_EXCEPTION_SOCKET_REMOVE
Language=English
An Exception occurred removing Message Socket.
.
MessageId=0x3B9C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_EXCEPTION_SOCKET_STALE
Language=English
An Exception occurred removing a stale Message Socket.
.
MessageId=0x3B9D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_EXCEPTION_SOCKET_ACCEPT
Language=English
An Exception occurred removing a stale Message Socket.
.
MessageId=0x3B9E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_EXCEPTION_SOCKET_GET
Language=English
An Exception occurred finding a Message Socket.
.
MessageId=0x3B9F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_EXCEPTION_SOCKET_CLOSEALL
Language=English
An Exception occurred closing all sockets.
.
MessageId=0x3BA0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_EXCEPTION_SOCKET_QUEUEALL
Language=English
An Exception occurred queuing outstanding receives on all sockets.
.
MessageId=0x3BA1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_ACCEPT_CALLBACK
Language=English
Socket %1: Socket Callback for Accept must return 0. Invalid return code %4.
.
MessageId=0x3BA2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_CALLBACK
Language=English
Socket %1: Socket Callback (%2) Port %3 invalid return code %4.
.
MessageId=0x3BA3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_EXCEPTION_FORWARD
Language=English
An Exception occurred processing a message.
.
MessageId=0x3BA4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_EXCEPTION_FORWARD_CHUNK
Language=English
An Exception occurred processing a Message Chunk.
.
MessageId=0x3BA5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SOCKETUTILS_LOG_SO_KEEPALIVE_FAILED
Language=English
Socket %1: Failed to set Keep Alive on socket - %2.
.

; // 
; // Proxy UI Messages 0x3C00 - 0x3CFF
; //
MessageId=0x3C00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PXUI_INVALID_COMMAND_LINE
Language=English
The command line passed to the Proxy UI was invalid.
.
MessageId=0x3C01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PXUI_WINDOW_NOT_VISIBLE
Language=English
The window of the target process is not visible (it may be a service).
.
MessageId=0x3C03
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PXUI_PROCESS_WINDOW_NOT_FOUND
Language=English
The window of the target process could not be found. It may be a console application.
.
MessageId=0x3C04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PXUI_PROCESS_INIT_FAILED
Language=English
The Proxy UI process failed to initialize, and has exited.
.
MessageId=0x3C05
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PXUI_PROCESS_FAILED_TO_CONNECT
Language=English
Timed out waiting for the Proxy UI to connect
.
MessageId=0x3C06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PXUI_WAIT_RESULT_UNEXPECTED
Language=English
An unexpected result was encountered whilst waiting for the Proxy UI to connect.
.

; // 
; // Client Notifications Messages 0x3D00 - 0x3DFF
; //
MessageId=0x3D00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_UNKNOWN_MAIL_HELPER
Language=English
The Mail Helper is not supported.
.
MessageId=0x3D01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_LOG_UNKNOWN_MAIL_HELPER
Language=English
The Mail Helper %1 is not supported.
.
MessageId=0x3D02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_LOADING_MAIL_HELPER
Language=English
An error occurred loading the Mail Helper.
.
MessageId=0x3D03
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_LOG_LOADING_MAIL_HELPER
Language=English
An error occurred loading the Mail Helper %1 - %2.
.
MessageId=0x3D04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_SET_MAILBOX_SERVER
Language=English
An error occurred setting the Mail Helper Server.
.
MessageId=0x3D05
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_LOG_SET_MAILBOX_SERVER
Language=English
An error occurred setting the Mail Helper Server %1 - %2.
.
MessageId=0x3D07
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_LOG_NO_MAIL_HELPER
Language=English
The Mail Helper must be loaded before Notifications can be processed.
.
MessageId=0x3D09
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_LOG_EXCEPTION_PROCESS_ACTIONS
Language=English
An exception occurred processing Client Notifications.
.
MessageId=0x3D0A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_CHANGE_MAIL_HELPER
Language=English
The Mail Helper cannot be changed.
.
MessageId=0x3D0B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_LOG_CHANGE_MAIL_HELPER
Language=English
Mail Helper %1 has already been loaded. The Mail Helper cannot be changed to %2.
.
MessageId=0x3D0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_LOG_EXCEPTION_SET_MAIL_HELPER
Language=English
An exception occurred processing Client Notifications.
.
MessageId=0x3D11
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_LOG_FAILED_TO_BUILD_ACTION_EMAIL_3LS_S
Language=English
Action on message '%1!ls!' - Failed to build a notification email to send to '%2!ls!', error %4.
.
MessageId=0x3D13
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_LOG_FAILED_TO_SUBMIT_AN_ACTION_MAIL_3LS_S
Language=English
Action on message '%1!ls!' - Failed to submit a notification email to send to '%2!ls!', error %4.
.
MessageId=0x3D15
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CLAM_LOG_NOTIFICATION_EMAIL_IS_EMPTY_2LS
Language=English
Action on message '%1!ls!' - A notification email sent to '%2!ls!' is empty.
.
MessageId=0x3D17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_LOG_OPENING_MAILSTORE
Language=English
An error occured opening the Mailstore - %1.
.
MessageId=0x3D18
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_CREATING_MAIL
Language=English
An error occurred loading the Mail Helper.
.
MessageId=0x3D19
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_LOG_CREATING_MAIL
Language=English
An error creating an email - %1.
.
MessageId=0x3D21
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_LOG_SET_MAILBOX_PROPERTY
Language=English
An error occurred setting the Mail Helper Property %1 - %2.
.
MessageId=0x3D22
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLAM_MISSING_FROM_ADDRESS
Language=English
An error occurred previously, and the original message sender's address was not collected. The sender will not receive notification emails.
.
;
;
;// ICAP Agent status codes 0x3E00-0x3EFF.
;// NOTE: These are status codes and MUST NOT contain format codes
;//       Use 0x3F00-0x3FFF for log messages
;
MessageId=0x3E00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_SOCKET_CLOSED_DURING_READ
Language=English
Read failed because the socket was closed.
.
MessageId=0x3E01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_SOCKET_READ_ERROR
Language=English
Socket read error.
.
MessageId=0x3E02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_CREATE_EVENT_ERROR
Language=English
Failed to create synchronization event.
.
MessageId=0x3E06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_EXCEPTION_PROCESS_MESSAGE
Language=English
An exception was caught while processing a message.
.
MessageId=0x3E08
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_INVALID_SERVICE_URI
Language=English
Invalid service URI in OPTIONS request.
.
MessageId=0x3E11
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_CREATE_IACTIVEIMPORT
Language=English
An error occurred creating an instance of the Active Import Interface.
.
MessageId=0x3E15
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_COULD_NOT_FIND_SOCKET
Language=English
An existing socket connection could not be found to the required destination.
.
MessageId=0x3E16
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_FAILED_TO_LOAD_WINSOCK
Language=English
WinSock could not be loaded.
.
MessageId=0x3E17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_FAILED_WINSOCK_VERSION
Language=English
The required version of WinSock could not be loaded.  At least version 2.2 is required.
.
MessageId=0x3E18
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_FAIL_CREATE_LISTENING_SKT
Language=English
A listening socket could not be created.
.
MessageId=0x3E19
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_FAIL_BIND_LISTENING_SKT
Language=English
A listening socket could not be bound to on port.
.
MessageId=0x3E1A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_FAIL_SET_LISTENING_BACKLOG
Language=English
Failed to set the backlog on a listening socket.
.
MessageId=0x3E1B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_FAIL_CREATE_ACCEPT_THREAD
Language=English
Failed to start the listening socket accept thread.
.
MessageId=0x3E3D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_COULD_NOT_SEND_ON_SOCKET
Language=English
Data could not be sent to port so the connection will be closed.
.
MessageId=0x3E3C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_COULD_NOT_CONNECT_SOCKET
Language=English
A connection could not be made to the destination machine.
.
MessageId=0x3E3E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_COULD_NOT_CREATE_OUT_SOCKET
Language=English
An outgoing socket connection could not be created.
.
MessageId=0x3E3F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_CREATE_ICOMBOSTREAM
Language=English
An error occurred creating an instance of a Combo Stream.
.
MessageId=0x3E43
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_QUERY_ICOMBOSTREAM
Language=English
An error occurred querying a Combo Stream for a Stream Interface.
.
MessageId=0x3E44
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_PATH_TOO_LONG
Language=English
The log file path was too long.
.
MessageId=0x3E45
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_HUNNY_MIME_INIT
Language=English
Failed to initialize MIME++ library.
.
MessageId=0x3E46
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_HUNNY_MIME_EXCEPTION
Language=English
Exception calling MIME++ library.
.
MessageId=0x3E47
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_NO_EVENT_DATA
Language=English
No event data available for this message.
.
MessageId=0x3E48
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_INVALID_ICAP_MESSAGE
Language=English
Unexpected ICAP message format.
.
MessageId=0x3E49
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_INVALID_ICAP_METHOD
Language=English
Unexpected ICAP method.
.
MessageId=0x3E52
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_WRITE_ISTREAM
Language=English
An error occurred writing to a Stream Interface.
.
MessageId=0x3E53
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_WRITE_ISTREAM_PART
Language=English
Only part of the data was written to the Stream Interface.
.
MessageId=0x3E54
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_READ_ISTREAM_PART
Language=English
Only part of the data was read from the Stream Interface.
.
MessageId=0x3E59
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_FAIL_CREATE_CLEAN_THREAD
Language=English
Failed to start the socket clean up thread.
.
MessageId=0x3E5C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_SETPAGETHRESHOLD
Language=English
An error occurred setting the paging threshold of a Combo Stream.
.
MessageId=0x3E5D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_CREATE_IMPORTCONFIG
Language=English
An error occurred creating an instance of an Import Connector Configuration Interface.
.
MessageId=0x3E5E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_SETIMPORTDESTINATION
Language=English
An error occurred setting the Importer Destination.
.
MessageId=0x3E75
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_SKT_CLOSED_NO_MSG
Language=English
Socket closed while reading message.
.
MessageId=0x3E76
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_SKT_CLOSED_NO_MSG_ERR
Language=English
Socket error while reading message.
.
MessageId=0x3E84
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_IMPORT_CALLBACK
Language=English
An error occurred querying the Import Callback Interface.
.
MessageId=0x3EA4
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ICAPAGENT_HOST_NOT_PE
Language=English
The ICAP Agent is not required for the Policy Engine.
.
MessageId=0x3EA5
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ICAPAGENT_HOST_NOT_HUB
Language=English
The ICAP Agent is not required for the Hub.
.
MessageId=0x3EA6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_HOST_INVALID
Language=English
The ICAP Agent registry entries HostInHub, HostInPE cannot both be set. HostInPE ignored.
.
MessageId=0x3EA7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_REQUEST_PARSE_ERROR
Language=English
Unable to parse the HTTP request header
.
MessageId=0x3EB6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_REGISTRY_TYPE
Language=English
The expected data type of a registry value is invalid.
.
MessageId=0x3EB7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_REGISTRY_DATA
Language=English
A registry value is invalid.
.
MessageId=0x3EB9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_REGISTRY_SET
Language=English
Unable to set registry value.
.
MessageId=0x3EBA
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_BAD_MIME_FORMAT
Language=English
Appears to be badly formatted MIME data.
.

;
;
;// ICAP Agent log message codes 0x3F00-0x3FFF.
;// NOTE: These are for log messages and can contain format codes
;//       Use 0x3E00-0x3EFF for status codes
;
MessageId=0x3F00
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ICAPAGENT_LOG_START_SESSION
Language=English
--------------------------------------------------
.
MessageId=0x3F01
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ICAPAGENT_LOG_STARTUP
Language=English
ICAP Agent is starting up. Listening on Agent Port %1.
.
MessageId=0x3F03
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ICAPAGENT_LOG_SHUTDOWN
Language=English
The ICAP Agent is shutting down.
.
MessageId=0x3F04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_INITIALIZE_RECEIVER
Language=English
An error occurred initializing the ICAP Agent receiver on port %1 (%2).
.
MessageId=0x3F05
Severity= Informational
Facility=Wigan
SymbolicName=WGN_I_ICAPAGENT_LOG_UPDATE_REG_CONFIG
Language=English
Configuration Updated
.
MessageId=0x3F06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_EXCEPTION_PROCESS_MESSAGE
Language=English
Socket %1: An exception was caught while processing a message.
.
MessageId=0x3F07
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_MESSAGE_READ_ERROR
Language=English
Socket %1: An error occurred reading the message (%2).
.
MessageId=0x3F08
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_INVALID_SERVICE_URI
Language=English
Socket %1: Invalid service URI in OPTIONS request (%2).
.
MessageId=0x3F09
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_SENDORIGINAL_ERROR
Language=English
Socket %1: An error occurred returning the original request (%2).
.
MessageId=0x3F0A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_FILENAME_ERROR
Language=English
Socket %1: An error occurred extracting filename from Content-Disposition (%2).
.
MessageId=0x3F0B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_MULTIPART_PARSE_ERROR
Language=English
Socket %1: Parsing the multipart MIME failed (%2).
.
MessageId=0x3F0C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_URL_DECODE_ERROR
Language=English
Socket %1: URL decoding failed (%2).
.
MessageId=0x3F0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_POP_XML_ERROR
Language=English
Socket %1: Error populating the event XML attributes (%2).
.
MessageId=0x3F0E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_EXCEPTION
Language=English
An exception was caught (%1).
.
MessageId=0x3F10
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_CONFIG_ERROR
Language=English
Error loading configuration - %1.
.
MessageId=0x3F11
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_CREATE_IACTIVEIMPORT
Language=English
An error occurred creating an instance of the Active Import Interface - %1.
.
MessageId=0x3F12
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_MONITOR_REG
Language=English
Error monitoring configuration changes - %1.
.
MessageId=0x3F16
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_FAILED_TO_LOAD_WINSOCK
Language=English
WinSock could not be loaded - %1.
.
MessageId=0x3F17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_FAILED_WINSOCK_VERSION
Language=English
The required version of WinSock could not be loaded.  At least version 2.2 is required but %1.%2 was found.
.
MessageId=0x3F19
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_FAIL_BIND_LISTENING_SKT
Language=English
A listening socket could not be bound to on port %1 - %2.
.
MessageId=0x3F1A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_FAIL_SET_LISTENING_BACKLOG
Language=English
Socket %1: Failed to set the backlog on a listening socket - %2.
.
MessageId=0x3F1B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_XML_ATTRIBUTES
Language=English
Socket %1: Failed to set event XML attributes - %2.
.
MessageId=0x3F1C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_IMPORT_ASYNC
Language=English
Socket %1: Failed to import the event - %2.
.
MessageId=0x3F1D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_DECODE_ERROR
Language=English
Socket %1: An error occurred decoding the ICAP message - %2.
.
MessageId=0x3F1E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_IMPORT_QUEUE_ERROR
Language=English
Socket %1: An error occurred adding the message to the import queue - %2.
.
MessageId=0x3F1F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_RESPONSE_ERROR
Language=English
Socket %1: An error occurred sending the response to the client - %2.
.
MessageId=0x3F20
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_RESPMOD_TEMPLATE
Language=English
An error occurred loading the ResponseTemplateFile - %1.
.
MessageId=0x3F21
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_REQMOD_TEMPLATE
Language=English
An error occurred loading the RequestTemplateFile - %1.
.
MessageId=0x3F22
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_TEMPLATE_ERROR
Language=English
Socket %1: An error occurred generating the template text - %2.
.
MessageId=0x3F23
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_USER_FORMAT
Language=English
Socket %1: Unexpected format for Authenticated User - %2.
.
MessageId=0x3F3D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_COULD_NOT_SEND_ON_SOCKET
Language=English
Socket %1: Data could not be sent to %2 port %3 so the connection will be closed - %4.
.
MessageId=0x3F3F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_CREATE_ICOMBOSTREAM
Language=English
An error occurred creating an instance of a Combo Stream - %.
.
MessageId=0x3F43
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_QUERY_ICOMBOSTREAM
Language=English
An error occurred querying a Combo Stream for a Stream Interface - %1.
.
MessageId=0x3F48
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_INVALID_ICAP_MESSAGE
Language=English
Socket %1: Unexpected ICAP message format.
.
MessageId=0x3F4A
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_ICAPAGENT_LOG_FAILED_TO_CONNECT
Language=English
Cannot connect socket to %1 port %2 - %3.
.
MessageId=0x3F4C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ICAPAGENT_LOG_CLOSING_CONNECTION
Language=English
Socket %1: Closing socket connection to %2 port %3 (leaving %4 connections).
.
MessageId=0x3F4E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ICAPAGENT_LOG_CREATING_INCOMING_CONNECTION
Language=English
Socket %1: Creating incoming connection on port %2 from %3 port %4 (making %5 connections).
.
MessageId=0x3F5C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_SETPAGETHRESHOLD
Language=English
An error occurred setting the paging threshold ( %1) of a Combo Stream - %2.
.
MessageId=0x3F5D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_CREATE_IMPORTCONFIG
Language=English
An error occurred creating an instance of an Import Connector Configuration Interface - %1.
.
MessageId=0x3F5E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_SETIMPORTDESTINATION
Language=English
An error occurred setting the Importer Destination (%1) - %2.
.
MessageId=0x3F6C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_FAIL_ALLOC_MSG_SKT
Language=English
Failed to allocate an internal data structure to manage an incoming connection.
.
MessageId=0x3F4D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ICAPAGENT_LOG_CREATING_OUTGOING_CONNECTION
Language=English
Socket %1: Creating outgoing connection to %2 port %3 (making %4 connections).
.
MessageId=0x3F6D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_ASYNC_RECV_ERROR
Language=English
Socket %1: Failed to start reading a message header from %2 port %3 - %4.
.
MessageId=0x3F6E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_FAIL_RCV_HEADER
Language=English
Socket %1: Failed to complete reading an ICAP header from %2 port %3 - %4.
.
MessageId=0x3F75
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_SKT_CLOSED_NO_MSG
Language=English
Socket %1: Failed to read a message because the socket from %2 port %3 closed.
.
MessageId=0x3F76
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_SKT_CLOSED_NO_MSG_ERR
Language=English
Socket %1: Failed to read a message because the socket from %2 port %3 closed - %4.
.
MessageId=0x3F87
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_SHUTDOWN_ERROR
Language=English
Socket %1: Error shutting down %2 port %3 - %4.
.
MessageId=0x3F9C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_EXCEPTION_SOCKET_STALE
Language=English
An Exception occurred removing a stale Message Socket.
.
MessageId=0x3F9D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_EXCEPTION_SOCKET_ACCEPT
Language=English
An Exception occurred while accepting a new connection.
.
MessageId=0x3F9E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_EXCEPTION_SOCKET_GET
Language=English
An Exception occurred finding a Message Socket.
.
MessageId=0x3FA4
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ICAPAGENT_LOG_HOST_NOT_PE
Language=English
The ICAP Agent is not required for the Policy Engine - registry entry HostInPE is not set.
.
MessageId=0x3FA5
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ICAPAGENT_LOG_HOST_NOT_HUB
Language=English
The ICAP Agent is not required for the Hub - registry entry HostInHub is not set.
.
MessageId=0x3FA6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_HOST_INVALID
Language=English
The ICAP Agent registry entries HostInHub, HostInPE cannot both be set. HostInPE ignored.
.
MessageId=0x3FB6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_REGISTRY_TYPE
Language=English
The data type of registry value "%1" is invalid (data type %2, expected type %3).
.
MessageId=0x3FB7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_REGISTRY_DATA
Language=English
The registry value "%1" is invalid "%2".
.
MessageId=0x3FB9
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ICAPAGENT_LOG_REGISTRY_SET
Language=English
Unable to set registry value "%1" (to %2) - %3.
.
MessageId=0x3FBA
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_ICAPAGENT_LOG_MESSAGESIZE
Language=English
Socket %1: Policy not applied as message size (%2MB) exceeds the maximum allowed (up to %3MB).
.
;
;
;// Client File Scanning Agent status codes 0x4000-0x40FF.
;// NOTE: These are for status codes and can not contain format codes
;//       Use 0x4100-0x41FF for log message codes
;
;
MessageId=0x4000
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CAUGHT_STD_EXCEPTION
Language=English
The Client File Scanning Agent caught a std::exception.
.
MessageId=0x4001
Severity=INFORMATIONAL
Facility=Wigan
SymbolicName=WGN_I_SCAN_NOT_ENABLED_IN_POLICY
Language=English
The scan type is not enabled in the machine policy.
.
;
;// Client File Scanning Agent log message codes 0x4100-0x41FF.
;// NOTE: These are for log messages and can contain format codes
;//       Use 0x4000-0x40FF for status codes
;
;
MessageId=0x4100
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CAUGHT_STD_EXCEPTION_LOG
Language=English
The Client File Scanning Agent caught a std::exception while executing %1. Error was %2.
.
MessageId=0x4101
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CAUGHT_UNKNOWN_EXCEPTION_LOG
Language=English
The Client File Scanning Agent caught an unknown exception type while executing %1.
.
MessageId=0x4102
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_INFRA_LOG
Language=English
The Client File Scanning Agent failed to create a connection with the infrastructure. Error was %1.
.
MessageId=0x4103
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_SESSION_LOG
Language=English
The Client File Scanning Agent failed to create an infrastructure session. Error was %1.
.
MessageId=0x4104
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_CFSA_POLICY_LOG
Language=English
The Client File Scanning Agent failed to obtain the CFSA policy settings. Error was %1.
.
MessageId=0x4105
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FAILED_CFSA_LOGIF_LOG
Language=English
Failed to obtain an IWgnLog interface. Error was %1.
.
MessageId=0x4106
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CFSA_START_LINE_LOG
Language=English
--------------------------------------------------
.
MessageId=0x4107
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CFSA_START_LOG
Language=English
Starting the Client File Scanning Agent.
.
MessageId=0x4108
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CFSA_CONFIG_LOG
Language=English
Configuration is %1.
.
MessageId=0x4109
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CFSA_FAILED_LOG_CONFIG_LOG
Language=English
Failed to log the current configuration. Error was %1.
.
MessageId=0x410A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CFSA_FAILED_MF_STREAM_LOG
Language=English
Failed to write the Modified File Scan job config to a stream. Error was %1.
.
MessageId=0x410B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_CFSA_MACHINE_POLICY_UPDATE_LOG
Language=English
The Client File Scanning Agent configuration has been updated.
.
MessageId=0x410C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_CFSA_FAILED_JOB_START_UPDATE_LOG
Language=English
Failed to re-start the Full System Scan job after a machine policy update. Error was %1.
.
MessageId=0x410D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_CFSA_FAILED_DELEGATE_CREATE_LOG
Language=English
Failed to co-create the delegate co-class. Error was %1.
.
MessageId=0x410E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_CFSA_FAILED_BROKER_CREATE_LOG
Language=English
Failed to co-create the broker co-class. Error was %1.
.
MessageId=0x410F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CFSA_FAILED_FCH_COCREATE_LOG
Language=English
Failed to co-create the File Change Handler. Error was %1.
.
MessageId=0x4110
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CFSA_CONNECTED_TO_FCH_LOG
Language=English
Connected to the file change handler.
.
MessageId=0x4111
Severity=Error
Facility=Wigan
SymbolicName=WGN_I_CFSA_FCH_QUERY_LOG
Language=English
Failed to query the File Change Notifier for its IUnknown interface. Error was %1.
.
MessageId=0x4112
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CFSA_FCH_AUDIT_ENTRY_LOG
Language=English
The file change handler has reported '%1'.
.
MessageId=0x4113
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CFSA_NULL_EVENT_RECIEVED_LOG
Language=English
The file change handler has notified the CFSA of a changed event, but the event is NULL.
.
MessageId=0x4114
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CFSA_FAILED_CONVERT_START_TIME_LOG
Language=English
Failed to convert the full system scan start time parameters into an XML time format. Error was %1.
.
MessageId=0x4115
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CFSA_FAILED_CREATE_NOTIFICATION_LOG
Language=English
Failed to Co-Create the machine policy change notification object. Error was %1.
.
;
;// Database Scanner status codes 0x4200-0x42FF.
;// NOTE: These are for status codes and can not contain format codes
;//       Use 0x4300-0x43FF for log message codes
;
MessageId=0x4200
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCN_CONNECTION_NOT_INITIALISED
Language=English
The connection was not initialized.
.
MessageId=0x4201
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCN_INVALID_PATH
Language=English
An invalid path was supplied to the FSA Database Scanner.
.
MessageId=0x4202
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCN_ENUM_NOT_INITIALISED
Language=English
The FSA Database Scanner enumeration object was not initialized.
.
MessageId=0x4203
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCN_QUERY_NOT_INITIALISED
Language=English
The FSA Database Scanner query object was not initialized.
.
MessageId=0x4204
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCN_NO_QUERY_STRING
Language=English
No query string was provided to the FSA Database Scanner's query enumerator.
.
MessageId=0x4205
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCN_QUERY_HAS_NOT_EXECUTED
Language=English
The FSA Database Scanner encountered a problem: The query has not been executed.
.
MessageId=0x4206
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCN_RECORD_NOT_INITIALISED
Language=English
The FSA Database Scanner's DatabaseRecord object has not been initialized.
.
MessageId=0x4207
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCN_BLOB_SIZE_MISMATCH
Language=English
The FSA Database Scanner encountered a problem: The size of the BLOB was not as expected.
.
MessageId=0x4208
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DBSCN_UNSUPPORTED
Language=English
The method is not supported by the FSA Database Scanner.
.
MessageId=0x4209
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCN_JOBXML_INVALID_JUMPOUT_NODE
Language=English
The FSA Database Scanner encountered a problem: The jumpout node in the Job File is invalid.
.
MessageId=0x420A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCN_FAILED_TO_OPEN_CONNECTION
Language=English
The FSA Database Scanner failed to open database connection.
.
MessageId=0x420B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCN_ADO_ERRORS_OCCURRED
Language=English
ADO Errors occurred in the FSA Database Scanner.
.
MessageId=0x420C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_BLOBSTREAM_INVALID_SEEK
Language=English
The FSA Database Scanner encountered a problem: An invalid seek operation was attempted on a database BLOB stream.
.
MessageId=0x420D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_BLOBSTREAM_NOT_INITIALISED
Language=English
The FSA Database Scanner encountered a problem: The database BLOB stream was not initialized.
.
MessageId=0x420E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_JOBXML_NO_CONNECTION
Language=English
The FSA Database Scanner job file does not contain a connection string.
.
MessageId=0x420F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_CONNECTION_NOT_OPEN
Language=English
The FSA Database Scanner encountered a problem: The operation could not complete because the database connection is not open.
.
MessageId=0x4210
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_INVALID_FIELD_TYPE
Language=English
The FSA Database Scanner encountered a problem: The database field type is invalid.
.
MessageId=0x4211
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_ROWSET_NOT_INITIALISED
Language=English
The FSA Database Scanner rowset has not been initialized.
.
MessageId=0x4212
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_ROWSETSLICE_NOT_INITIALISED
Language=English
The FSA Database Scanner rowset slice has not been initialized.
.
MessageId=0x4213
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_ROWSETSLICETHREAD_NOT_CONSTRUCTED
Language=English
The FSA Database Scanner rowset slice thread did not fully construct.
.
MessageId=0x4214
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_ROWSETSLICETHREAD_NOT_INITIALISED
Language=English
The FSA Database Scanner rowset slice thread was not initialized.
.
MessageId=0x4215
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_ROWSETSLICETHREAD_FAILED_TO_START
Language=English
The FSA Database Scanner rowset slice thread did not start.
.
MessageId=0x4216
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_ROWSETSLICETHREAD_WAIT_FAILED
Language=English
The FSA Database Scanner rowset slice thread failed a wait operation.
.
MessageId=0x4217
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_ROWSETSLICETHREAD_SETEVENT_FAILED
Language=English
The FSA Database Scanner rowset slice thread failed to set a windows event.
.
MessageId=0x4218
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_FAILED_TO_GET_CATALOG_NAME
Language=English
The FSA Database Scanner failed to get 'CATALOG_NAME' field from the schema rowset.
.
MessageId=0x4219
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_FAILED_TO_GET_TABLE_NAME
Language=English
The FSA Database Scanner failed to get 'TABLE_NAME' field from the schema rowset.
.
MessageId=0x422A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_SCHEMA_NOT_INITIALISED
Language=English
The FSA Database Scanner Schema was not initialized.
.
MessageId=0x422B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_SCHEMA_CATALOG_NOT_FOUND
Language=English
The catalog could not be found in the FSA Database Scanner Schema.
.
MessageId=0x422C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_SCHEMA_SCHEMA_NOT_FOUND
Language=English
The schema could not be found in the FSA Database Scanner Schema.
.
MessageId=0x422D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_SCANITEM_NOT_INITIALISED
Language=English
The FSA Database Scanner Scan Item was not initialized.
.
MessageId=0x422E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_NULL_TABLE_NAME
Language=English
A NULL table name was provided to the FSA Database Scanners' table enumerator.
.
MessageId=0x422F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_SCAN_ITEM_NOT_FOUND
Language=English
The FSA Database Scanner could not find the scan item in the Query Enumerator's list.
.
MessageId=0x4230
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_PROVIDER_NOT_REGISTERED
Language=English
The OLE DB provider specified in the FSA Database Scanner Job was not registered. Please check the connection string and ensure your database vendor's client tools are installed.
.
MessageId=0x4231
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_FAILED_TO_CREATE_PROVIDER
Language=English
The OLE DB provider specified in the FSA Database Scanner Job could not be created. Please check the connection string and ensure your database vendor's client tools are installed.
.
MessageId=0x4232
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_FAILED_TO_CONNECT
Language=English
The FSA Database Scanner failed to connect to the database specified in the job file. Please check the connection string.
.
MessageId=0x4233
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_TYPE_INFO_FAILURE
Language=English
The FSA Database Scanner was unable to obtain provider type information.
.
MessageId=0x4234
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_DATASOURCE_INFO_FAILURE
Language=English
The FSA Database Scanner was unable to obtain data source information.
.
MessageId=0x4235
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_BLOB_STREAM_UNINITIALISED
Language=English
The FSA Database Scanner's BLOB stream object was not initialized.
.
MessageId=0x4236
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_BLOB_STREAM_READ_WRITE_MISMATCH
Language=English
The FSA Database Scanner failed to populate a BLOB stream object (bytes read != bytes written).
.
MessageId=0x4237
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_SCAN_ITEM_EMPTY
Language=English
The FSA Database Scanner scan item is empty.
.
MessageId=0x4238
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_FAILED_CACHED_CREDS
Language=English
The FSA Database Scanner failed to obtain cached credentials. Please ensure that the job is running under an administrative user, and that credentials have been set on the machine.
.
MessageId=0x4239
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_BLOB_SIZE_UNEXPECTED
Language=English
The FSA Database Scanner read an unexpected number of bytes from a Database BLOB.
.

;
;// Database Scanner log message codes 0x4300-0x43FF.
;// NOTE: These are for log messages and can contain format codes
;//       Use 0x4200-0x42FF for status codes
;
MessageId=0x4300
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCN_LOG_ADO_ERROR
Language=English
The FSA Database Scanner encountered a problem: An ADO Error Has Occurred: %1
.
MessageId=0x4301
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCN_LOG_ADO_ERROR_WITH_DESC
Language=English
The FSA Database Scanner encountered a problem: An ADO Error Has Occurred (%1): '%2'.
.
MessageId=0x4302
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCN_LOG_INVALID_PATH
Language=English
An invalid location path was supplied to the FSA Database Scanner: '%1'.
.
MessageId=0x4303
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DBSCN_LOG_FAILED_TO_GET_FIELD_TYPE
Language=English
The FSA Database Scanner failed to get database field type with error '%1'.
.
MessageId=0x4304
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DBSCN_LOG_FAILED_TO_GET_FIELD_NAME
Language=English
The FSA Database Scanner failed to get database field name with error '%1'.
.
MessageId=0x4305
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DBSCN_LOG_FAILED_TO_GET_FIELD_SIZE
Language=English
The FSA Database Scanner failed to get database field size with error '%1'.
.
MessageId=0x4306
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCN_LOG_CONFIG_XML_FAILURE
Language=English
Parsing of FSA Database Scanner configuration XML failed with error '%1'.
.
MessageId=0x4307
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DBSCN_LOG_CONFIG_EVENT_SIZE_LIMIT_EXCEEDED
Language=English
FSA Database Scanner Warning: The maximum event size specified in the configuration (%1 KB) exceeds the allowed value (%2 KB). Value has been set to %2 KB.
.
MessageId=0x4308
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DBSCN_LOG_CONFIG_MAX_ROWS_MAX_SIZE_ARE_ZERO
Language=English
The FSA Database Scanner configuration variables for event_creation:max_rows and event_creation:max_size cannot both be 0. max_size has been reset to %1.
.
MessageId=0x4309
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DBSCN_LOG_CONFIG_INVALID_ATTRIBUTE
Language=English
An invalid attribute value has been supplied for the FSA Database Scanner configuration attribute %1. (%2). The default value (%3) was set.
.
MessageId=0x430A
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DBSCAN_LOG_CONFIG_FIXED_SIZE_AND_DYNAMIC_BLOBS_BOTH_SPECIFIED
Language=English
Invalid FSA Database Scanner configuration: Fixed size BLOBs have been selected along with a Dynamic Size. Dynamic Size will be used.
.
MessageId=0x430B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_CONFIG_INVAILD_JUMPOUT_NODE
Language=English
Invalid FSA Database Scanner configuration: Jump Out threshold is mandetory on Jump Out node.
.
MessageId=0x430C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_GET_DATASOURCE
Language=English
The FSA Database Scanner failed to create the datasource from '%1' with '%2'.
.
MessageId=0x430D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_CREATE_DATASOURCE_INITIALIZE
Language=English
The FSA Database Scanner failed to create an MS Data Initialize object with '%1'.
.
MessageId=0x430E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_JOBXML_NO_CONNECTION
Language=English
The FSA Database Scanner job file does not contain a connection string (%1).
.
MessageId=0x430F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_CONNECTION_FAILED
Language=English
The FSA Database Scanner could not connect to the data source (%1) with '%2'.
.
MessageId=0x4310
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_CREATE_COMMAND
Language=English
The FSA Database Scanner failed to create command object for the data source (%1) with '%2'.
.
MessageId=0x4311
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DBSCAN_LOG_FAILED_TO_SET_COMMAND_PROP
Language=English
The FSA Database Scanner tried to set unsupported/read-only command property %1 with status '%2'. This is for information only.
.
MessageId=0x4312
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_SET_COMMAND_PROPS
Language=English
The FSA Database Scanner failed to set command properties with '%1'.
.
MessageId=0x4313
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_SET_COMMAND_TEXT
Language=English
The FSA Database Scanner failed to set command text '%1' with '%2'.
.
MessageId=0x4314
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_EXECUTE_QUERY
Language=English
The FSA Database Scanner failed to execute query '%1' with '%2'.
.
MessageId=0x4315
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_GET_COLUMN_INFO
Language=English
The FSA Database Scanner failed to get column info with '%1'.
.
MessageId=0x4316
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_GET_COLUMN_INFO_INTERFACE
Language=English
The FSA Database Scanner failed to get column info interface with '%1'.
.
MessageId=0x4317
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_GET_ACCESSOR_INTERFACE
Language=English
The FSA Database Scanner failed to get accessor interface with '%1'.
.
MessageId=0x4318
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_CREATE_ACCESSOR
Language=English
The FSA Database Scanner failed to create accessor (DBPART=%1) for column '%2' with '%3'.
.
MessageId=0x4319
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_GET_ROWS
Language=English
The FSA Database Scanner failed to obtain next %1 rows from rowset with '%2'.
.
MessageId=0x431A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_COLUMN_SIZE
Language=English
The FSA Database Scanner failed to get actual size for column %1 with '%2'.
.
MessageId=0x431B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_COLUMN_VALUE
Language=English
The FSA Database Scanner failed to get value for column %1 with '%2'.
.
MessageId=0x431C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_SET_XML_ATTRIBUTE
Language=English
The FSA Database Scanner failed to set XML attribute '%1' with '%2'.
.
MessageId=0x431D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_ROWSETSLICE_THREAD_FAILED
Language=English
The FSA Database Scanner encountered a failure on the rowset slice thread (%1).
.
MessageId=0x431E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_CREATE_EVENT
Language=English
The FSA Database Scanner failed to create event with %1.
.
MessageId=0x431F
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_DBSCAN_LOG_PROVIDER_ERROR
Language=English
Information: The FSA Database Scanner encountered provider error %1 ('%2').
.
MessageId=0x4320
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DBSCAN_LOG_PROVIDER_ERROR
Language=English
Information: The FSA Database Scanner encountered provider error %1 ('%2').
.
MessageId=0x4321
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DBSCAN_LOG_PROVIDER_ERROR
Language=English
Warning: The FSA Database Scanner encountered provider error %1 ('%2').
.
MessageId=0x4322
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_PROVIDER_ERROR
Language=English
Error: The FSA Database Scanner encountered provider error %1 ('%2').
.
MessageId=0x4323
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DBSCAN_LOG_IMPORTING_QUERY_RESULT
Language=English
The FSA Database Scanner is importing the result of query '%1'.
.
MessageId=0x4324
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_BLOB_INIT
Language=English
The FSA Database Scanner failed to initialize BLOB with '%1'.
.
MessageId=0x4325
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_INVALID_PATH_TOKEN_COUNT
Language=English
An invalid number of tokens was provided in the FSA Database Scanner location '%1'.
.
MessageId=0x4326
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_TYPE_INFO_FAILURE
Language=English
The FSA Database Scanner was unable to obtain provider type info with error '%1'.
.
MessageId=0x4327
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DBSCAN_LOG_UNABLE_TO_OBTAIN_ROWSET_SCHEMA
Language=English
The FSA Database Scanner was unable to obtain the rowset schema %1 with error '%2'.
.
MessageId=0x4328
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DBSCAN_LOG_FAILED_TO_SET_DATASOURCE_PROP
Language=English
The FSA Database Scanner tried to set unsupported/read-only datasource property %1 with status '%2'. This is for information only.
.
MessageId=0x4329
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DBSCAN_LOG_FAILED_TO_GET_JOBNAME
Language=English
The FSA Database Scanner failed to get the job name with error '%1'.
.
MessageId=0x432A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_GET_CATALOG_NAME
Language=English
The FSA Database Scanner failed to get 'CATALOG_NAME' field from the schema rowset.
.
MessageId=0x432B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_GET_TABLE_NAME
Language=English
The FSA Database Scanner failed to get 'TABLE_NAME' field from the schema rowset.
.
MessageId=0x432C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_SCHEMA_CATALOG_NOT_FOUND
Language=English
The catalog '%1' could not be found in the FSA Database Scanner Schema.
.
MessageId=0x432D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_SCHEMA_SCHEMA_NOT_FOUND
Language=English
The catalog/schema '%1'.'%2' could not be found in the FSA Database Scanner Schema.
.
MessageId=0x432E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_UNABLE_TO_GET_ROW_VALUES
Language=English
The FSA Database Scanner failed to get row values with error '%1'.
.
MessageId=0x432F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_POPULATE_SCAN_ITEM
Language=English
The FSA Database Scanner failed to populate a Scan Item with error '%1'.
.
MessageId=0x4330
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_POPULATE_CELL
Language=English
The FSA Database Scanner failed to populate cell '%1' with error '%2'.
.
MessageId=0x4331
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_SET_FILTERS
Language=English
The FSA Database Scanner failed to set database object filters with error '%1'.
.
MessageId=0x4332
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_SET_CATALOG
Language=English
The FSA Database Scanner failed to change initial catalog to %1 with error: '%2'.
.
MessageId=0x4333
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_COLLECTION_THREAD_CAUGHT_EXCEPTION
Language=English
The FSA Database Scanner collection thread caught an exception. Processing will continue.
.
MessageId=0x4334
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DBSCAN_LOG_FAILED_TO_SET_SECURITY_PROP
Language=English
The FSA Database Scanner tried to set unsupported/read-only security property %1 with status '%2'. This is for information only.
.
MessageId=0x4335
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_PROCESS_CMD_LINE
Language=English
The FSA Database Scanner failed to process command line with error '%1'.
.
MessageId=0x4336
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DBSCAN_LOG_JUMPING_OUT
Language=English
The FSA Database Scanner is terminating the scan of the current query results because the Policy Trigger theshold (%1) has been exceeded (%2 events captured). 
.
MessageId=0x4337
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_PROVIDER_NOT_REGISTERED
Language=English
The OLE DB provider specified in the FSA Database Scanner Job was not registered. Please check the connection string ('%1') and ensure your database vendor's client tools are installed.
.
MessageId=0x4338
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_CREATE_PROVIDER
Language=English
The OLE DB provider specified in the FSA Database Scanner Job could not be created with error '%1'. Please check the connection ('%2') string and ensure your database vendor's client tools are installed.
.
MessageId=0x4339
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_CONNECT
Language=English
The FSA Database Scanner failed to connect to the database specified in the job file with error '%1'. Please check the connection string ('%2').
.
MessageId=0x433A
Severity=Success
Facility=Wigan
SymbolicName=WGN_S_DBSCAN_LOG_PROVIDER_ERROR_WITH_INFO
Language=English
Information: The FSA Database Scanner encountered provider error %1 ('%2'). See next line for additional information.
.
MessageId=0x433B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DBSCAN_LOG_PROVIDER_ERROR_WITH_INFO
Language=English
Information: The FSA Database Scanner encountered provider error %1 ('%2'). See next line for additional information.
.
MessageId=0x433C
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_DBSCAN_LOG_PROVIDER_ERROR_WITH_INFO
Language=English
Warning: The FSA Database Scanner encountered provider error %1 ('%2'). See next line for additional information.
.
MessageId=0x433D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_PROVIDER_ERROR_WITH_INFO
Language=English
Error: The FSA Database Scanner encountered provider error %1 ('%2'). See next line for additional information.
.
MessageId=0x433E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_DATASOURCE_INFO_FAILURE
Language=English
The FSA Database Scanner was unable to obtain data source information with error '%1'.
.
MessageId=0x433F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DBSCAN_LOG_PROVIDER_INFO_UNAVAILABLE
Language=English
The FSA Database Scanner could not obtain provider type info from the database. This is for information only.
.
MessageId=0x4340
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_PROVIDER_INFO_UNAVAILABLE
Language=English
The FSA Database Scanner failed to obtain provider type info from the database with error '%1'.
.
MessageId=0x4341
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DBSCAN_LOG_USING_CACHED_CREDS
Language=English
The FSA Database Scanner is using credentials cached using WgnCred.
.
MessageId=0x4342
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_CACHED_CREDS
Language=English
The FSA Database Scanner failed to obtain cached credentials with error '%1'. Please ensure that the job is running under an administrative user, and that credentials have been set on the machine.
.
MessageId=0x4343
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_ROW_ALLOCATION_TIMEOUT
Language=English
The FSA Database Scanner timed out while trying to allocate a row.
.
MessageId=0x4344
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_DBSCAN_LOG_UNABLE_TO_EXECUTE_QUERY
Language=English
The FSA Database Scanner was unable to execute query '%1' with '%2'.
.
MessageId=0x4345
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_DBSCAN_LOG_FAILED_TO_OBTAIN_ORACLE_SERVER
Language=English
The FSA Database Scanner was unable to get the Oracle server host name with '%1'.
.

;
;// FSA Job Persistence status codes 0x4400-0x44FF.
;
MessageId=0x4400
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_DELETE_FAIL
Language=English
Failed to delete job state file.
.
MessageId=0x4401
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_FILE_GET
Language=English
Critical get file error.
.
MessageId=0x4402
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_INVALID_NAME
Language=English
The FSA job name is invalid.
.
MessageId=0x4403
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_INVALID_XML
Language=English
The FSA job state XML is invalid.
.
MessageId=0x4404
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_INVALID_PATH
Language=English
Invalid path specified.
.
MessageId=0x4405
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FSA_JOB_PATH_SET
Language=English
The job path has already been specified.
.
MessageId=0x4406
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_LOCATION_BAD
Language=English
The location has not been specified for this job.
.
MessageId=0x4407
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_JOB_NAME_BAD
Language=English
The state for the specified cannot be found.
.

;/////////////////////////////////////////////////////////////////////////
;// EMC SourceOne Integration codes

MessageId=0x4500
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_EMCS1_LOG_CREATED_IMPORT_CONNECTOR
Language=English
The EMC Adapter has successfully created the DLP Import Connector.
.
MessageId=0x4501
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_EMCS1_LOG_CONFIGURED_IMPORT_CONNECTOR
Language=English
The EMC Adapter has successfully configured the DLP Import Connector.
.
MessageId=0x4502
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_EMCS1_LOG_PRE_ARCHIVE_MSG
Language=English
The EMC Adapter is 'PreArchive' processing the message ID=%1.
.
MessageId=0x4503
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_EMCS1_LOG_PRE_ARCHIVE_SUCCESS
Language=English
The EMC Adapter has successfully 'PreArchive' processed the message ID=%1.
.
MessageId=0x4504
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_LOG_PRE_ARCHIVE_FAILED
Language=English
The EMC Adapter 'PreArchive' processing for message ID=%1 failed with error %2.
.
MessageId=0x4505
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_EMCS1_LOG_POST_ARCHIVE_MSG
Language=English
The EMC Adapter is 'PostArchive' processing the message ID=%1.
.
MessageId=0x4506
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_EMCS1_LOG_POST_ARCHIVE_SUCCESS
Language=English
The EMC Adapter has successfully 'PostArchive' processed the message ID=%1.
.
MessageId=0x4507
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_LOG_POST_ARCHIVE_FAILED
Language=English
The EMC Adapter 'PostArchive' processing for message ID=%1 failed with error %2.
.
MessageId=0x4508
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_EMCS1_LOG_PROCESS_FAILED_MSG
Language=English
The EMC Adapter is 'FailedMessage' processing the message ID=%1.
.
MessageId=0x4509
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_EMCS1_LOG_PROCESS_FAILED_SUCCESS
Language=English
The EMC Adapter has successfully 'FailedMessage' processed the message ID=%1.
.
MessageId=0x450a
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_LOG_PROCESS_FAILED_FAILED
Language=English
The EMC Adapter 'FailedMessage' processing for message ID=%1 failed with error %2.
.
MessageId=0x450b
Severity=Error
Facility=Wigan
SymbolicName=WGN_W_EMCS1_LOG_ORPHANED_COMPLETION_OBJECT
Language=English
The EMC Adapter found an orphaned deferred-completion object for message ID=%1 and deleted it.
.
MessageId=0x450c
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_LOG_NO_COMPLETION_OBJECT
Language=English
The EMC Adapter could not find a deferred-completion object for message ID=%1.
.
MessageId=0x450d
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_EMCS1_LOG_LOADED
Language=English
The EMC Adapter has been loaded successfully.
.
MessageId=0x450e
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_EMCS1_LOG_UNLOADED
Language=English
The EMC Adapter has been unloaded.
.
MessageId=0x450f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_LOG_DMS_CONNECT_FAILED
Language=English
The EMC Adapter could not connect to the DMS Server %1.
.
MessageId=0x4510
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_LOG_DMS_MSG_RETRIEVAL_FAILED
Language=English
The EMC Adapter failed to retrieve message ID=%1 from the DMS server.
.
MessageId=0x4511
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_LOG_DMS_ARCHIVE_FAILED
Language=English
The EMC Adapter cancelled the import transaction because EMC reported an archive failure. ID=%1
.
MessageId=0x4512
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_LOG_NO_DMS_SERVER
Language=English
The EMC Adapter has no DMS server defined in the registry.  Retrieval of messages will not be possible.
.
MessageId=0x4513
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_LOG_MSG_TYPE_FAILURE
Language=English
The EMC Adapter could not determine the message type for ID=%1.  The message will not be processed.
.
MessageId=0x4514
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_EMCS1_LOG_RFC_MSG_NOT_SUPPORTED
Language=English
The EMC Adapter does not support processing of Internet Messages (RFC822). ID=%1. 
.
MessageId=0x4515
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_EMCS1_LOG_NOTES_MSG_NOT_SUPPORTED
Language=English
The EMC Adapter does not support processing of Domino messages (Lotus Notes). ID=%1. 
.
MessageId=0x4516
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_LOG_UNKNOWN_MSG_NOT_SUPPORTED
Language=English
The EMC Adapter cannot process the message because its type is unknown. ID=%1. 
.
MessageId=0x4517
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_CLIENT_DLL_NOT_REGISTERED
Language=English
The EMC Adapter cannot process the message because the EMC Client Assembly DLL is either missing, or not registered properly, or is the wrong version. 
.
MessageId=0x4518
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_LOG_NOTES_DATABASE_FAILURE
Language=English
The EMC Adapter could not open a notes database file for temporary storage. Notes error %1!d! was returned. ID=%2
.
MessageId=0x4519
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_LOG_NOTES_MAIL_FAILURE
Language=English
The EMC Adapter could not create a Notes email for temporary storage. Notes error %1!d! was returned. ID=%2
.
MessageId=0x451A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_EMCS1_LOG_DISABLE_PROCESSING_MSG
Language=English
The EMC Adapter is 'PreArchive' processing with message processing DISABLED. The message will not be passed to the Policy Engine. ID=%1.
.
MessageId=0x451B
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_EMCS1_LOG_CONFIG_DISABLE_PROCESSING
Language=English
The EMC Adapter is configured with message processing DISABLED. Messages will NOT be passed to the Policy Engine. 
.
MessageId=0x451C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_EMCS1_LOG_NO_ARCHIVE_FOLDER
Language=English
The EMC Adapter will not capture this message because it has not been stored in any archive folders. '%1', ID=%2
.
MessageId=0x451D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_E_EMCS1_LOG_ARCHIVED_IN_FOLDER
Language=English
The EMC Adapter will capture this message because it has been successfully archived. '%1', ID=%2
.

;// EMC SourceOne Adapter Error codes
MessageId=0x4540
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_COULD_NOT_CONFIGURE_CONNECTOR
Language=English
The EMC Adapter Import Connector configuration failed.
.
MessageId=0x4541
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_EAAPI_NOT_AVAILABLE
Language=English
The EMC Adapter failed to create the Import Connector.
.
MessageId=0x4542
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_NO_COMPLETION_OBJECT
Language=English
The EMC Adapter could not find the deferred-completion object.
.
MessageId=0x4543
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_DMS_MSG_RETRIEVAL_FAILED
Language=English
The EMC Adapter failed to retrieve the message.
.
MessageId=0x4544
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_DMS_ARCHIVE_FAILED
Language=English
The EMC Adapter cancelled the import transaction.
.
MessageId=0x4545
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_UNSUPPORTED_TYPE
Language=English
The EMC Adapter does not support this type of message.
.
MessageId=0x4546
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_EMCS1_NOTE_HANDLE_FAILED
Language=English
The EMC Adapter could not obtain a note handle for this email.
.

; /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
; // 0x4600 - PRC Algorithm
; // 0x4600 - 467f PRC Algorithm status codes

MessageId=0x4600
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_PRCFILE_OPEN_FAILED
Language=English
The Content Registration file cannot be opened.
.
MessageId=0x4601
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_PRCFILE_READ_FAILED
Language=English
Failed to read data from the Content Registration file.
.
MessageId=0x4602
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_PRCFILE_WRITE_FAILED
Language=English
Failed to write data to the Content Registration file.
.
MessageId=0x4603
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_PRCFILE_BADINDEXTYPE
Language=English
Unexpected index type found in the Content Registration file.
.
MessageId=0x4604
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_PRCFILE_BADFILETYPE
Language=English
The Content Registration file is of an unexpected file type.
.
MessageId=0x4605
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_PRCFILE_BADVERSION
Language=English
Content Registration file version mismatch.
.
MessageId=0x4606
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_PRCFILE_BADUID
Language=English
The Content Registration file contains an unexpected index UID.
.
MessageId=0x4607
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_PRCFILE_BADSIGNATURE
Language=English
The Content Registration file signature could not be read.
.
MessageId=0x4608
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_PRCFILE_PARAM_NOTFOUND
Language=English
The desired XML node cannot be found.
.
MessageId=0x4609
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_LOG_NOTSET
Language=English
Unable to log message as the log interface has not been set.
.
MessageId=0x460A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_STREAM_TOOLARGE
Language=English
The content stream is too large to process.
.
MessageId=0x460B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_STREAM_TOOSMALL
Language=English
The content stream is too small to process.
.
MessageId=0x460C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_CHECKSUM_BAD
Language=English
The checksum was not correctly formed.
.
MessageId=0x460D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_HASH_BAD
Language=English
The hash was not correctly formed.
.
MessageId=0x460E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_CONTENT_EXCEPTION
Language=English
An unknown exception was raised by ContentAccess
.
MessageId=0x460F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_PRCFILE_NOTEXIST
Language=English
The Content Registration file does not exist.
.
MessageId=0x4610
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_NO_FILES_TO_PROCESS
Language=English
No files were found to process.
.
MessageId=0x4611
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_PRCFILE_FINGERPRINT_COUNTBAD
Language=English
An unexpected number of fingerprints were found in the Content Registration file.
.
MessageId=0x4612
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_FINGERPRINT_BAD
Language=English
The fingerprint was not correctly formed.
.
MessageId=0x4613
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_METHOD_NOTREADY
Language=English
The Content Registration Algorithm DLL is not in a state whereby this method call can be serviced.
.
MessageId=0x4614
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_QUEUE_NOTSERVICING
Language=English
The queue failed to service the pop request.
.
MessageId=0x4615
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_NO_FILES_ABORT
Language=English
Aborted as no files were found.
.
MessageId=0x4616
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_TERMINATING
Language=English
Call aborted due to termination request.
.
MessageId=0x4617
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_UID_CREATIONFAILED
Language=English
Failed to create index UID.
.
MessageId=0x4618
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_PATHFILE_READ_FAILED
Language=English
Failed to find content source path.
.
MessageId=0x4619
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_MAPFILE_READ_FAILED
Language=English
Failed to find appropriate delta number.
.
MessageId=0x461A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_TREE_OUTOFMEMORY
Language=English
Search tree ran out of allocated memory.
.
MessageId=0x461B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_TIMEOUT_ABORT
Language=English
Aborted due to wait timed out.
.
MessageId=0x461C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_UNKOWN_INDEXTYPE
Language=English
Unknown index type specified.
.
MessageId=0x461D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_NOCONTENT
Language=English
File has insufficient content.
.
MessageId=0x461E
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCAL_NOTHINGTOINDEX
Language=English
No new or updated files were found. Index not updated.
.
MessageId=0x461F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_PRCFILE_NOENTRIES
Language=English
No entries were found in the Content Registration file.
.
MessageId=0x4620
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_STREAM_READ_FAILED
Language=English
Failed to read data expected in the stream.
.
MessageId=0x4621
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCAL_STOPTIMEOUT
Language=English
Stop Index request completed with timeout.
.
MessageId=0x4622
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_UNEXPECTED_CHUNKSIZE
Language=English
Accessed file has an incompatible chunk size.
.
MessageId=0x4623
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_UNEXPECTED_MINSTREAMSIZE
Language=English
Accessed file has an incompatible minimum stream size.
.
MessageId=0x4624
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_BTREE_CREATE_FAILURE
Language=English
An unexpected btree creation failure occurred.
.
MessageId=0x4625
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_XML_BAD
Language=English
Cannot commit XML to disk as it was not correctly formed.
.
MessageId=0x4626
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_NEGATIVE_SETCOPY_FAILED
Language=English
Failed to copy the negative index folder to destination.
.
MessageId=0x4627
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_PRCFILE_END
Language=English
End of Content Registration file reached.
.

; // 0x4680 - 46ff PRC Algorithm messages
MessageId=0x4680
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_INTIALISATION_GOOD
Language=English
Initialization completed successfully.
.
MessageId=0x4681
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_INTIALISATION_BAD
Language=English
Initialization failed with '%1'.
.
MessageId=0x4682
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_BUILDER_INTIALISING
Language=English
The index builder is initializing.
.
MessageId=0x4683
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_COMPILER_INTIALISING
Language=English
The index compiler is initializing.
.
MessageId=0x4684
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_EVALUATOR_INTIALISING
Language=English
The index evaluator is initializing for agent '%1'.
.
MessageId=0x4685
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_COMPILER_COMPILING
Language=English
Compiling index '%1' to '%2' using source '%3' and previous index '%4'.
.
MessageId=0x4686
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_COMPILATION_SUCCESS
Language=English
Index '%1' compiled successfully.
.
MessageId=0x4687
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_COMPILATION_FAILED
Language=English
Failed to compile index '%1' with '%2'.
.
MessageId=0x4688
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCAL_FOLDER_DELETEFAILED
Language=English
Failed to remove folder '%1'.
.
MessageId=0x4689
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_FOLDER_CREATEFAILED
Language=English
Failed to create folder '%1'.
.
MessageId=0x468A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_FILE_COPYFAILED
Language=English
Failed to copy files from '%1' to '%2' with error '%3'
.
MessageId=0x468B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_MAP_UPDATEFAILED
Language=English
Failed to update the path file map in '%1' with error '%2'
.
MessageId=0x468C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_COMPILER_MERGEFAILED
Language=English
Compiler failed to merge files in '%1' with error '%2'
.
MessageId=0x468D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_COMPILER_FINALMERGEFAILED
Language=English
Compiler failed to carry out the final file merge with error '%1'
.
MessageId=0x468E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_COMPILER_LOADERCREATEFAILED
Language=English
Compiler failed to create the loader file in '%1' with error '%2'
.
MessageId=0x468F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_BUILDER_FINGERPRINTING
Language=English
Fingerprinting file '%1'.
.
MessageId=0x4690
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_BUILDER_FINGERPRINT_GOOD
Language=English
Successfully fingerprinted file '%1'.
.
MessageId=0x4691
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCAL_BUILDER_FINGERPRINT_BAD
Language=English
Failed to fingerprint file '%1' with error '%2'
.
MessageId=0x4692
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_BUILDER_BUILDINDEX
Language=English
Building index in '%1'.
.
MessageId=0x4693
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_BUILDER_INDEX_GOOD
Language=English
Successfully created index in '%1' with UID '%2'.
.
MessageId=0x4694
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_BUILDER_INDEX_BAD
Language=English
Failed to create index in '%1' with error '%2'
.
MessageId=0x4695
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_BUILDER_BUILDSTOPPING
Language=English
Stopping index build.
.
MessageId=0x4696
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_BUILDER_BUILDSTOPPED
Language=English
Index building stopped.
.
MessageId=0x4697
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_BUILDER_FILESORTFAILED
Language=English
Fingerprint file sort failed with error '%1'
.
MessageId=0x4698
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_BUILDER_PREPNEXT
Language=English
Failed to prepare for index build with error '%1'
.
MessageId=0x4699
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_BUILDER_FILEMERGE
Language=English
Failed to merge fingerprint files with error '%1'
.
MessageId=0x469A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_BUILDER_FILESPLIT
Language=English
Failed to split the prepared files with error '%1'
.
MessageId=0x469B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_BUILDER_FILECLEANUP
Language=English
Failed to cleanup temp files error '%1'
.
MessageId=0x469C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_EVALUATOR_INDEXLOADING
Language=English
Loading index from '%1' for agent '%2'.
.
MessageId=0x469D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_EVALUATOR_INDEXLOAD_GOOD
Language=English
Successfully loaded index for agent '%1'.
.
MessageId=0x469E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_EVALUATOR_INDEXLOAD_BAD
Language=English
Failed to loaded index from '%1' for agent '%2' with error '%3'
.
MessageId=0x469F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_EVALUATOR_TESTING
Language=English
Testing '%1' against agent '%2'.
.
MessageId=0x46A0
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_EVALUATOR_TEST_GOOD
Language=English
Successfully tested '%1' against agent '%2'.
.
MessageId=0x46A1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_EVALUATOR_TEST_BAD
Language=English
Failed to test '%1' with agent '%2'. Error '%3'
.
MessageId=0x46A2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_EXCEPTION_MEMALLOC
Language=English
%1 Caught memory allocation exception.
.
MessageId=0x46A3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_EXCEPTION_STL
Language=English
%1 Caught STL exception: %2.
.
MessageId=0x46A4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_EXCEPTION_UNKNOWN
Language=English
%1 Caught an unknown exception.
.
MessageId=0x46A5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_BUILDER_VALIDATION
Language=English
Failed to validate index with error '%1'
.
MessageId=0x46A6
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCAL_BUILDER_INDEX_WARNING
Language=English
Index building in '%1' completed with warning '%2'.
.
MessageId=0x46A7
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_BUILDER_FILE_NO_FINGERPRINT
Language=English
File '%1' could not be fingerprinted. Reason '%2'.
.
MessageId=0x46A8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCAL_CANNOT_COMPILE_NEGATIVE
Language=English
Cannot compile a negative index.
.
MessageId=0x46A9
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCAL_EMPTY_SET
Language=English
No indexable fingerprints were found.
.
MessageId=0x46AA
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCAL_INCOMPATIABLE_WINDOW_SIZE
Language=English
An incompatiable window size of %1!lu! was found in '%2'. Excluding.
.
MessageId=0x46AB
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCAL_APPLYING_NEGATIVE_FILE
Language=English
Loaded %1!lu! stop hashes from '%2'.
.
; /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
; // 0x4700 - PRC Engine
; // 0x4700 - 477f PRC Engine status codes

MessageId=0x4700
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_NO_PRC_INDEX_EVALUATOR
Language=English
The Content Registration Index Evaluator has not been created.
.
MessageId=0x4701
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_NO_CACHED_INDEX
Language=English
The Content Registration Cached Index does not exist.
.
MessageId=0x4702
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_PATHFILE_NOT_FOUND
Language=English
The Content Registration Path file was not found.
.
MessageId=0x4703
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_RENAME_DIR_FAILED
Language=English
Failed to rename the Content Registration Index directory.
.
MessageId=0x4704
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_PARSE_INDEXINFO_FILE
Language=English
Error parsing the Content Registration Index Information file.
.
MessageId=0x4705
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_NO_COMPILER
Language=English
No Content Registration Compiler found.
.
MessageId=0x4706
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_NULL_PRCINDEXDEST
Language=English
WgnPRCIndexDest is NULL.
.
MessageId=0x4707
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_BUILD_SRC_DIR
Language=English
Error creating Content Registration Build Source directory path.
.
MessageId=0x4708
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_BUILD_DEST_DIR
Language=English
Error creating Content Registration Build Destination directory path.
.
MessageId=0x4709
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_ABSOLUTE_PATH
Language=English
Error path is not absolute.
.
MessageId=0x470A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_FILESYTEM_NOT_INITIALISED
Language=English
The CA DLP Infrastructure File System has not been initialized.
.
MessageId=0x470B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_INVALID_FILEPATH
Language=English
Invalid Content Registration file path.
.
MessageId=0x470C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_CREATE_ICOMBOSTREAM
Language=English
An error occurred creating an instance of a Combo Stream.
.
MessageId=0x470D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_NULL_PRCINDEXPROVIDER
Language=English
The Content Registration Index Provider is NULL.
.
MessageId=0x470E
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCEN_AGENT_TEST_FAILURE
Language=English
One or more Content Registration Agent tests failed.
.
MessageId=0x470F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_AGENT_LOOKUP
Language=English
Content Registration Agent look up failed.
.
MessageId=0x4710
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_AGENT_CONFIG
Language=English
Content Registration Agent configuration failed.
.
MessageId=0x4711
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_AGENT_INVALID_XML
Language=English
Error parsing the Content Registration Agent XML.
.
MessageId=0x4712
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_INDEX_PROVIDER_START
Language=English
Error starting the Content Registration File Index Provider.
.
MessageId=0x4713
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_EXPORT_TO_FILE
Language=English
Error exporting Content Registration file.
.
MessageId=0x4714
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_STD_EXCEPTION
Language=English
The Content Registration Engine caught a standard exception.
.
MessageId=0x4715
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCEN_PRCPATHFILE_FAILED
Language=English
Read from Content Registration Path file failed.
.
MessageId=0x4716
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_AGENT_PROVIDER_START
Language=English
Error starting the Content Registration Agent Provider.
.
MessageId=0x4717
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_PURGE_MONITOR_START
Language=English
Error starting the Content Registration Purge Monitor.
.
MessageId=0x4718
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_SKIP_ACCEPT_INDEX
Language=English
The compiled index has been skipped as there is another in the queue.
.
; /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
; // 0x4780 - 47ff PRC Engine messages
MessageId=0x4780
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_START_LOG
Language=English
The Content Registration Engine has started.
.
MessageId=0x4781
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_STOP_LOG
Language=English
The Content Registration Engine has stopped.
.
MessageId=0x4782
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_START_FAILED_LOG
Language=English
The Content Registration Engine failed to start - %1
.
MessageId=0x4783
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_GET_AGENT_LOG
Language=English
Failed to get Content Registration Agent for file '%1' - %2
.
MessageId=0x4784
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_CREATE_EVENT_TESTER_LOG
Language=English
Failed to create Content Registration Event Tester instance - %1
.
MessageId=0x4785
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_EVENT_TESTER_LOG
Language=English
The Content Registration Event Test failed - %1
.
MessageId=0x4786
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCEN_AGENT_TEST_LOG
Language=English
Error testing Content Registration Agent '%1' - %2
.
MessageId=0x4787
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_LOAD_FILE_LOG
Language=English
Failed to load file for Content Registration Agent '%1' - %2
.
MessageId=0x4788
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_PARSE_XML_LOG
Language=English
Failed to parse XML for Content Registration Agent '%1' - %2
.
MessageId=0x4789
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_AGENT_CONFIG_LOG
Language=English
Failed to configure Content Registration Agent '%1' - %2
.
MessageId=0x478A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_INDEX_LOADED
Language=English
Loaded Content Registration Index '%1' version %2.
.
MessageId=0x478B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_INDEX_LOAD_LOG
Language=English
Failed to load Content Registration Index '%1' - %2
.
MessageId=0x478C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_PRCPATHFILE_LOG
Language=English
Failed to read Content Registration Path File '%1' - %2
.
MessageId=0x478D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_AGENT_SETINDEX_LOG
Language=English
SetIndex failed for Content Registration Agent '%1' - %2
.
MessageId=0x478E
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCEN_DELETE_DIR_LOG
Language=English
Failed to delete the old Content Registration Index directory '%1'.
.
MessageId=0x478F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_INDEX_PROVIDER_START_LOG
Language=English
Failed to start the Content Registration File Index Provider - %1
.
MessageId=0x4790
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_REPLICATION_LOG
Language=English
The replication request for Content Registration file '%1' failed - %2
.
MessageId=0x4791
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_EXPORT_FILE_LOG
Language=English
Failed to export Content Registration file '%1' to '%2' - %3
.
MessageId=0x4792
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_BUILD_AND_PROVIDE_LOG
Language=English
Failed to build and provide Content Registration Index '%1' - %2
.
MessageId=0x4793
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCEN_DELETE_SRC_DIR_LOG
Language=English
Failed to delete the temporary source directory '%1'.
.
MessageId=0x4794
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_CREATE_COMPILATION_DIR_LOG
Language=English
Failed to create Content Registration Index compilation directory '%1' - %2.
.
MessageId=0x4795
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_STD_EXCEPTION_LOG
Language=English
The Content Registration Engine caught a standard exception.
.
MessageId=0x4796
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_MEMORY_EXCEPTION_LOG
Language=English
The Content Registration Engine caught a memory allocation exception.
.
MessageId=0x4797
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_UNKNOWN_EXCEPTION_LOG
Language=English
The Content Registration Engine caught an unknown exception.
.
MessageId=0x4798
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_CONFIG_MONITOR_LOG
Language=English
The Content Registration Engine configuration monitoring thread failed - %1.
.
MessageId=0x4799
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_CONFIG_READ_LOG
Language=English
Failed to read the Content Registration Engine '%1' configuration value - %2.
.
MessageId=0x479A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_CONFIG_WRITE_LOG
Language=English
Failed to write the Content Registration Engine '%1' configuration value - %2.
.
MessageId=0x479B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_CONFIG_WRITE_LOG
Language=English
Wrote the Content Registration Engine '%1' configuration value.
.
MessageId=0x479C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_AGENT_PROVIDER_START_LOG
Language=English
Failed to start the Content Registration Agent Provider - %1
.
MessageId=0x479D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_AGENT_PROVIDER_STOP_LOG
Language=English
The Content Registration Agent Provider stopped unexpectedly - %1
.
MessageId=0x479E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_INDEX_PROVIDER_STOP_LOG
Language=English
The Content Registration File Index Provider stopped unexpectedly - %1
.
MessageId=0x479F
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_INDEX_PROVIDER_START_LOG
Language=English
The Content Registration File Index Provider has started.
.
MessageId=0x47A0
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_AGENT_PROVIDER_START_LOG
Language=English
The Content Registration Agent Provider has started.
.
MessageId=0x47A1
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_INDEX_PROVIDER_STOP_LOG
Language=English
The Content Registration File Index Provider has stopped.
.
MessageId=0x47A2
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_AGENT_PROVIDER_STOP_LOG
Language=English
The Content Registration Agent Provider has stopped.
.
MessageId=0x47A3
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_MODIFIED_AGENT_LOG
Language=English
The registered Content Registration Agent file '%1' has changed.
.
MessageId=0x47A4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_AGENT_PROVIDER_CHECK_LOG
Language=English
The update check failed for Content Registration Agent file '%1' - %2
.
MessageId=0x47A5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_INDEX_FILE_CHECK_LOG
Language=English
The file availability check failed for Content Registration Index '%1' - %2
.
MessageId=0x47A6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_PURGE_MONITOR_STOP_LOG
Language=English
The Content Registration Purge Monitor stopped unexpectedly - %1
.
MessageId=0x47A7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_PURGE_MONITOR_START_LOG
Language=English
Failed to start the Content Registration Purge Monitor - %1
.
MessageId=0x47A8
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_PURGE_MONITOR_START_LOG
Language=English
The Content Registration Purge Monitor has started.
.
MessageId=0x47A9
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_PURGE_MONITOR_STOP_LOG
Language=English
The Content Registration Purge Monitor has stopped.
.
MessageId=0x47AA
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCEN_PURGE_AGENT_DIR_LOG
Language=English
Failed to purge the Content Registration Agent directory '%1'.
.
MessageId=0x47AB
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_PURGE_AGENT_LOG
Language=English
The Content Registration Agent '%1' version %2 has been purged from the local cache.
.
MessageId=0x47AC
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_PURGE_CHECK_START_LOG
Language=English
Check for old Content Registration indexes has started.
.
MessageId=0x47AD
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_PURGE_CHECK_STOP_LOG
Language=English
Check for old Content Registration indexes has completed.
.
MessageId=0x47AE
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCEN_PURGE_CHECK_FAILED_LOG
Language=English
The Content Registration purge index check failed - '%1'.
.
MessageId=0x47AF
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_SYNC_FILES_FOUND_LOG
Language=English
Processing Index '%1' synchronously as the required files are stored locally.
.
MessageId=0x47B0
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCEN_SYNC_FILES_NOT_FOUND_LOG
Language=English
Can not process Index '%1' synchronously as the required files are not stored locally.
.
MessageId=0x47B1
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_WAIT_FOR_AGENT_LOG
Language=English
Waiting for Content Registration Agent '%1' to be compiled...
.
MessageId=0x47B2
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRCEN_WAIT_AGENT_SUCCESS_LOG
Language=English
Wait completed and Content Registration Agent '%1' is ready.
.
MessageId=0x47B3
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCEN_WAIT_AGENT_FAILED_LOG
Language=English
Wait completed but Content Registration Agent '%1' is not ready.
.
MessageId=0x47B4
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCEN_WAIT_TIMED_OUT_LOG
Language=English
Wait for Content Registration Agent '%1' has timed out.
.
MessageId=0x47B5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_WAIT_AGENT_FAILED_LOG
Language=English
Failed to wait for Content Registration Agent '%1' - %2
.
MessageId=0x47B6
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_PRCEN_DELETE_DEST_DIR_LOG
Language=English
Failed to delete the temporary destination directory '%1'.
.
MessageId=0x47B7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRCEN_OPEN_FILE_LOG
Language=English
Failed to open file '%1' for Content Registration Agent '%2' - %3
.
; /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
; // 0x4800 - PRC Indexer

; // 0x4800 - 487f PRC Indexer status codes

MessageId=0x4800
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_INVALID_JOB_STATE
Language=English
The Content Registration Index Manager could not perform this operation on the job while it is in this state.
.
MessageId=0x4801
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_JOB_STOP_REQUESTED
Language=English
The Content Registration Index Generator cancelled this operation because a stop has been requested for the job.
.
MessageId=0x4802
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_INVALID_INDEX_CONFIG
Language=English
Invalid Content Registration Index configuration in job file.
.
MessageId=0x4803
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRC_FINGERPRINTING_STARTED
Language=English
Started fingerprinting for index '%1'.
.
MessageId=0x4804
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_INDEX_NAME_TOO_LONG
Language=English
Index name exceeds 59 character limit.
.

; // 0x4880 - 48ff PRC Indexer messages

MessageId=0x4880
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_JOB_ALREADY_RUNNING
Language=English
The Content Registration Index Manager could not perform this operation on job '%1' because it is already running.
.
MessageId=0x4881
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_JOB_NOT_RUNNING
Language=English
The Content Registration Index Manager could not perform this operation on job '%1' because it is not running.
.
MessageId=0x4882
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_JOB_INDEXING_OR_PURGING
Language=English
The Content Registration Index Manager could not perform this operation on job '%1' because it is building or purging an index.
.
MessageId=0x4883
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_CREATE_PROCESS_FAIL
Language=English
The Content Registration Index Manager could not create the FSAStub process for job '%1'.  Error %2
.
MessageId=0x4884
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_JOB_NOT_FOUND_OR_CREATED
Language=English
The Content Registration Index Manager could not find or create job '%1'.
.
MessageId=0x4885
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_JOB_PROGRESS_NOT_FOUND
Language=English
The Content Registration Index Manager could not obtain the progress information for job '%1'.
.
MessageId=0x4886
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRC_NO_INDEXES
Language=English
The Content Registration Index Manager could not find any index jobs.
.
MessageId=0x4887
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRC_NO_INDEX_FILES
Language=English
The Content Registration Index Manager could not find any index files for job '%1'.
.
MessageId=0x4888
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_INDEX_UUID_NOT_FOUND
Language=English
The Content Registration Index Manager could not find the index UID for job '%1'.
.
MessageId=0x4889
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_INDEX_INSTANCE_UUID_NOT_FOUND
Language=English
The Content Registration Index Manager could not find the Instance UID for job '%1'.
.
MessageId=0x488a
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRC_INDEX_FOUND
Language=English
The Content Registration Index Manager found job '%1' with index UID '%2' and version UID '%3'.
.
MessageId=0x488b
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_JOB_NOT_FOUND
Language=English
The Content Registration Index Manager could not find job '%1'.
.
MessageId=0x488c
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRC_JOB_STARTED
Language=English
The Content Registration Index Manager has successfully started job '%1'.
.
MessageId=0x488d
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRC_JOB_STOP_REQUESTED
Language=English
The Content Registration Index Manager has requested that job '%1' be stopped.
.
MessageId=0x488e
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_CANT_OPEN_FILE
Language=English
The Content Registration Index Manager was unable to open the file '%1'. Error: %2
.
MessageId=0x488f
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_CANT_READ_FILE
Language=English
The Content Registration Index Manager was unable to read from the file '%1'. Error: %2
.
MessageId=0x4890
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_CANT_WRITE_FILE
Language=English
The Content Registration Index Manager was unable to write to the file '%1'. Error: %2
.
MessageId=0x4891
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_COCREATE_FAIL
Language=English
The Content Registration Index Manager was unable to create the %1. Error: %2
.
MessageId=0x4892
Severity=Error
Facility=Wigan
 SymbolicName=WGN_E_PRC_JOB_STOP_FAILED
Language=English
Job '%1' failed to stop. Error: %2
.
;// generator messages

MessageId=0x48C0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_INVALID_FILE
Language=English
The Content Registration Index Generator was unable to obtain a valid filename from the scan item. Error: %1
.
MessageId=0x48C1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_TEXT_STRIP_FAIL
Language=English
The Content Registration Index Generator failed to strip text from file '%1', Error: %2.
.
MessageId=0x48C1
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRC_BUILD_INDEX_COMPETE
Language=English
The Content Registration Index Generator has successfully completed the index build for job '%1'
.
MessageId=0x48C2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_PRC_BIN_RECURSION_FAIL
Language=English
The Content Registration Index Generator could not get the binary contents of file '%1', Error: %2.
.
MessageId=0x48C3
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_PRC_NO_TEXT_CONTENT
Language=English
File '%1' has no text content and cannot be indexed.
.
;
;// Encryption Utility status codes 0x4900-0x49FF
;
MessageId=0x4900
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ENCRYPT_UNKNOWN_SCHEMA         
Language=English
The schema version of the file is unknown.
.

;
;// CCS General status codes 0x4A00-0x4A7F
;
MessageId=0x4A00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLASSIFICATION_DICTIONARY_UNSUPPORTED         
Language=English
Retrieval of the Classification Dictionary is not supported on this PE.
.
MessageId=0x4A01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CLASSIFICATION_DICTIONARY_REQUIRES_PE         
Language=English
Retrieval of the Classification Dictionary requires a local Policy Engine.
.

;
;// CCS Web Service log codes 0x4A80-0x4AFF
;
MessageId=0x4A80
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CCS_LOG_STARTED
Language=English
The Content Classification Service has started.
.
MessageId=0x4A81
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CCS_LOG_STOPPED
Language=English
The Content Classification Service has stopped.
.
MessageId=0x4A82
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_LOG_FAILED_TO_REMOVE_FILE        
Language=English
Failed to remove file '%1' due to error '%2'.
.
MessageId=0x4A83
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_LOG_FAILED_TO_UPDATE_PERFMON        
Language=English
Failed to update performance monitor due to exception '%1'.
.
MessageId=0x4A84
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_LOG_FAILED_TO_DELETE_TEMP_FILE        
Language=English
Failed to delete temp file '%1' due to exception '%2'.
.
MessageId=0x4A85
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_LOG_FAILED_TO_CREATE_TEMP_FILE        
Language=English
Failed to create temp file '%1' due to exception '%2'.
.
MessageId=0x4A86
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_LOG_INVALID_LOCALE_REQUESTED
Language=English
The requested locale '%1' is not a valid locale.
.
MessageId=0x4A87
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CCS_LOG_REQUESTED_LOCALE_NOT_FOUND        
Language=English
The requested locale '%1' was not found.
.
MessageId=0x4A88
Severity=Warning
Facility=Wigan
SymbolicName=WGN_E_CCS_FAILED_INITIALIZE_MANAGED_EXCEPTION_TRACKER        
Language=English
Failed to initialize exception tracker due to error '%1'.
.
;
;// Content Indexing Services (CIS) Content Connector status codes (0x4B00 to 0x4B7F)
;
MessageId=0x4B00
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_CISCP_INDEXING_INGRESS_RATE_TOO_HIGH
Language=English
The indexing ingress rate is too high.
.
MessageId=0x4B01
Severity=Informational
Facility=Wigan
SymbolicName=WGN_W_CISCP_FAILED_PROVIDER_ATTEMPTING_RECOVERY
Language=English
The Content Connector system has failed and is attempting to recover.
.
MessageId=0x4B02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CISCP_PROVIDER_ATTEMPTED_RECOVERY_FAILED
Language=English
The Content Connector system failed. Recovery was attempted but failed.
.
MessageId=0x4B03
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CISCP_PROVIDER_FAILED
Language=English
The Content Connector system failed. Recovery was not possible.
.
MessageId=0x4B04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CISCP_GENERIC_ERROR
Language=English
Content Connector generic error. Details may be provided in a custom message.
.
MessageId=0x4B05
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CISCP_INGEST_FAILED
Language=English
Content Connector ingestion failed. Details may be provided in a custom message.
.
MessageId=0x4B06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CISCP_INGEST_FORMAT_UNKNOWN
Language=English
Content Connector ingestion failed because the document was of an unknown format. Details may be provided in a custom message.
.
MessageId=0x4B07
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CISCP_INGEST_CONTENT_INACCESSIBLE
Language=English
Content Connector ingestion failed because the document content was not be accessible. Details may be provided in a custom message.
.
MessageId=0x4B08
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CISCP_INTERNAL_ERROR
Language=English
Content Connector internal error.
.
MessageId=0x4B09
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CISCP_INITIALISATION_FAILED
Language=English
Failed to initialize the Content Connector.
.
;
;// IDOL Content Provider log codes (UNDER REVIEW - MAY BE REMOVED) (0x4B80 to 0x4BFF)
;
;//MessageId=0x4B80
;//Severity=Error
;//Facility=Wigan
;//SymbolicName=WGN_E_LOG_CISCP_IDOL_EXAMPLE
;//Language=English
;//This is an example. Remove when the first log code has been defined (replacing this one).
;//.

;
;// CCS Pre-scan status codes (0x4C00 to 0x4C7F))
;
MessageId=0x4C00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CCS_SERVICE_URL
Language=English
No Classification Service URL specified in the job file
.
MessageId=0x4C01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CCS_ITEM_EXCLUDED
Language=English
Item excluded from classification.
.
MessageId=0x4C02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CCS_CLASSIFICATION_ERROR
Language=English
Classification Service returned an error.
.
MessageId=0x4C03
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FSA_CCS_CLASSIFICATION_WARNING
Language=English
Classification Service returned a warning.
.
MessageId=0x4C04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CCS_WCF_EXCEPTION
Language=English
Classification Service failed with an exception.
.
MessageId=0x4C05
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CCS_NO_CLASSIFIER
Language=English
No available classifier instance.
.
MessageId=0x4C06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CCS_ENDPOINTNAME
Language=English
Failed to read 'CCSEndpointName' from WgnFSA.exe.config.
.
MessageId=0x4C07
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CCS_CLASSIFYURLFORMAT
Language=English
Failed to read 'CCSClassifyURLFormat' from WgnFSA.exe.config.
.
MessageId=0x4C08
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CCS_SERVER_NAME
Language=English
No Classification Service Server specified in the job file
.

;
;// CCS Pre-scan log codes (0x4C80 to 0x4CFF))
;
MessageId=0x4C80
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CCS_INVALID_FILE_LOG
Language=English
The Classification Scanner was unable to obtain a valid filename from the scan item. Error: %1
.
MessageId=0x4C81
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_CCS_CLASSIFYING_LOG
Language=English
Classifying "%1".
.
MessageId=0x4C82
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_CSS_CLASSIFIED_LOG
Language=English
Completed classifying "%1".
.
MessageId=0x4C83
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CCS_CLASSIFYING_FAILED_LOG
Language=English
Error occurred classifying "%1", error was "%2".
.
MessageId=0x4C84
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CCS_CLASSIFY_SERVICE_ERROR_LOG
Language=English
Classification Service error for "%1" - "%2".
.
MessageId=0x4C85
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_FSA_CCS_CLASSIFY_SERVICE_WARNING_LOG
Language=English
Classification service warning for "%1" - "%2".
.
MessageId=0x4C86
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CCS_WCF_EXCEPTION_LOG
Language=English
Unexpected exception from the Classification Service: "%1".
.
MessageId=0x4C87
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CCS_POOL_ERROR_LOG
Language=English
Failed to allocate a classifier from the pool. Error: %1
.
MessageId=0x4C88
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CCS_CONTENT_IDENTIFIER_NOT_FOUND
Language=English
The content identifier was not found in the cache.
.
MessageId=0x4C89
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_CCS_QUERYING_CLASSIFICATIONS_LOG
Language=English
Querying classifications for "%1".
.
MessageId=0x4C8A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_CSS_QUERY_COMPLETE_LOG
Language=English
Query classifications complete for "%1".
.
MessageId=0x4C8B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_FSA_CCS_QUERY_CLASSIFICATIONS_FAILED_LOG
Language=English
Error occurred querying classifications for "%1", error was "%2".
.
MessageId=0x4C8C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_CSS_CONFIGURATION_LOG
Language=English
Using Classification Service at "%1".
.
MessageId=0x4C8D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_FSA_CSS_VERSION_LOG
Language=English
Classification Service Version %1.
.
;
;// CCS Web Service API status codes 0x4D00-0x4DFF
;// *WARNING* - these codes are special in that they are used to return the status of a web service call
;//				to the calling client over SOAP.
;//				They are not to be used as HRESULT return codes from methods in native C++ or CLI\C++ methods, 
;//				this is because they contain insertion strings. 

MessageId=0x4D00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_NO_CONTENT_IDENTIFIERS_SUPPLIED
Language=English
The supplied content identifier list is empty.
.
MessageId=0x4D01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_NO_CONTENT_DATA_SUPPLIED         
Language=English
The supplied classify arguments specify that the content data should be passed to the CCS, but no data was supplied.
.
MessageId=0x4D02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_DATA_SUPPLIED_FOR_CONTENT_TYPE_REFERENCE         
Language=English
The supplied classify arguments specify that the content data is to be obtained by the supplied reference, but content data was supplied.
.
MessageId=0x4D03
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_IDENTIFIER_BLANK         
Language=English
The supplied classify arguments contain an invalid content identifier with a blank identifier.
.
MessageId=0x4D04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_ANALYZE_NONE_MULTIPLE_CONTENT_IDENTIFIERS         
Language=English
AnalyzeDataAction.None has been specified but multiple content identifiers have been supplied in the classify arguments.
.
MessageId=0x4D05
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_ANALYZE_NONE_RETURN_CLASSIFICATIONS_FALSE
Language=English
AnalyzeDataAction.None has been specified but return classifications has been set to false in the supplied classify arguments.
.
MessageId=0x4D06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_ANALYZE_NONE_NOT_CLASSIFICATION         
Language=English
AnalyzeDataAction.None has been specified but the supplied classify args specify content should be accessed/cached.
.
MessageId=0x4D07
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_DUPLICATE_CONTENT_IDENTIFIERS         
Language=English
The supplied classify args contain duplicate content identifiers.
.
MessageId=0x4D08
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CONTENT_IDENTIFIER_CONTAINS_LAST_MODIFIED_AND_RETRIEVE         
Language=English
The content identifier '%1' specifies a last modified date but also specifies that the last modified date has to be retrieved.
.
MessageId=0x4D09
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CACHE_RETURNED_NULL_LAST_MODIFIED_DATE         
Language=English
The classification cache returned a NULL last modified date for content identifier '%1'.
.
MessageId=0x4D0A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_FAILED_TO_RETRIEVE_CONTENT         
Language=English
Failed to retrieve content identifier '%1' due to error '%2'.
.
MessageId=0x4D0B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_INVALID_CONTENT_IDENTIFIER_TYPE         
Language=English
The content identifier '%1' specifies a type of '%2'.
.
MessageId=0x4D0C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CONTENT_OUT_OF_DATE         
Language=English
The content identifier '%1' with a last modified date of '%2' is older than the specified last modified date of '%3'.
.
MessageId=0x4D0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CLASSIFICATION_OUT_OF_DATE         
Language=English
The content identifier '%1' with a classification date of '%2' is older than the specified maximum classification age of '%3'.
.
MessageId=0x4D0E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_MULTIPLE_CONTENT_ACCESS_URLS        
Language=English
The content identifier '%1' is set to access content, but another content identifier '%2' has already been defined to access content. Only one content identifier can be set to access content.
.
MessageId=0x4D0F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CLASSIFY_FAILED        
Language=English
Failed to classify content '%1' because classifier '%2' is invalid or misconfigured.
.
MessageId=0x4D10
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_NO_CONTENT_ACCESS_SPECIFIED        
Language=English
A content identifier specifying content access was not supplied.
.
MessageId=0x4D11
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CLASSIFY_ERROR_DISK_FULL        
Language=English
Local cache is unavailable '%1'.
.
MessageId=0x4D12
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_LOCAL_FILE_CACHE_ERROR        
Language=English
The local file cache encountered the following error(s) '%1'.
.
MessageId=0x4D13
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_LOCAL_FILE_CACHE_DOES_NOT_EXIST        
Language=English
The local file cache location '%1' is inaccessible due to error '%2'.
.
MessageId=0x4D14
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_LOCAL_FILE_CACHE_INACCESSIBLE        
Language=English
The local file cache location '%1' is inaccessible to process identity '%2' due to error '%3'.
.
MessageId=0x4D15
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_LOCAL_FILE_CACHE_REGISTRY_KEY_BLANK        
Language=English
The local file cache location has not been set in the registry.
.
MessageId=0x4D16
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CLASSIFY_FAILED_LOCAL_CACHE_INACCESSIBLE        
Language=English
The content cannot be classified because the local file cache is inaccessible.
.
MessageId=0x4D17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_DICTIONARY_FAILED        
Language=English
Failed to retrieve the classification dictionary due to the following error '%1'.
.
MessageId=0x4D18
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CLASSIFY_REQUEST_TIMEOUT        
Language=English
The classification request failed to complete in the specified timeout of '%1' ms.
.
MessageId=0x4D19
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CONTENT_ARGS_ERROR        
Language=English
The supplied classify args specify content should be accessed but CanAccessContent is set to false.
.
MessageId=0x4D1A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CLASSIFY_ERROR        
Language=English
Failed to classify content '%1' due to error '%2'.
.
MessageId=0x4D1B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CLASSIFY_NOT_AUTHORIZED        
Language=English
The identity of the client is not authorized to call the classify operation.
.
MessageId=0x4D1C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_DICTIONARY_CLASSIFICATION_NOT_AUTHORIZED        
Language=English
The identity of the client is not authorized to call the dictionary classification operation.
.
MessageId=0x4D1D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_DUPLICATE_CLASSIFICATION_IDS_IN_FILTER        
Language=English
The classifications filter list contains duplicate classification ids.
.
MessageId=0x4D1E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_FAILED_TO_RETRIEVE_CONTENT_LAST_MODIFIED_DATE
Language=English
Failed to retrieve last modified date of content identifier '%1' due to error '%2'.
.
MessageId=0x4D1F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CLASSIFY_FAULT
Language=English
The exception '%1' occurred when processing the classify request.
.
MessageId=0x4D20
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_DICTIONARY_CLASSIFICATION_FAULT
Language=English
The exception '%1' occurred when processing the dictionary classification request.
.
MessageId=0x4D21
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CONTENT_IDENTIFIER_NOT_FOUND
Language=English
No valid classifications for content identifier '%1' were found in the cache.
.
MessageId=0x4D22
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CONTENT_ACCESS_USING_HASH
Language=English
The content identifier hash '%1' cannot be used to access content.
.
MessageId=0x4D23
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_HASH_NO_CONTENT_IDENTIFIER
Language=English
A hash content identifer which requires content to be accessed has been supplied without a content identifier which specifies the file location.
.
MessageId=0x4D24
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_ANALYZE_NONE_IDENTIFIER_ONLY
Language=English
Content identifier must set DoNotCacheIdentifier to false to query classifications from the cache when AnalyzeDataAction.None is specified.
.
MessageId=0x4D25
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CANNOT_CACHE_IDENTIFIER_WITHOUT_CLASSIFICATIONS
Language=English
It is not possible to cache a specific content identifier without also caching the classifications.
.
MessageId=0x4D26
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_FAILED_TO_CREATE_HTTP_REQUEST
Language=English
Failed to create HTTP request for content identifier '%1'.
.
MessageId=0x4D27
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_UNKNOWN_AUTHENTICATION_PROVIDER
Language=English
Unknown authentication scheme '%1' supplied.
.
MessageId=0x4D28
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_LAST_MODIFIED_TIME_NOT_UTC
Language=English
The last modified time supplied for content identifier '%1' is not in UTC.
.
MessageId=0x4D29
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_TEST_LASTTMODIFIED_SET_NO_LAST_MODIFIED
Language=English
The TestLastModified attribute has been set but no LastModified date has been set for content identifier '%1'.
.
MessageId=0x4D2A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_DATA_RETRIEVE_LAST_MODIFIED_TRUE
Language=English
When content has been supplied by data it is not possible to retrieve the last modified date. Use the LastModified attribute instead.
.
MessageId=0x4D2B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_DATA_CONTENT_CREDENTIALS_SPECIFIED
Language=English
When content has been supplied by data content credentials are not required.
.
MessageId=0x4D2C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_API_CACHE_OFFLINE_CACHE_CLASSIFICATIONS
Language=English
The classify args specify content classifications should be cached but the cache is offline.
.
MessageId=0x4D2D
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CCS_API_CACHE_OFFLINE_CACHE_CLASSIFICATIONS_CONTENT_CLASSIFIED
Language=English
The content has been classified but the content classifications cannot be cached because the cache is offline.
.
; //////////////////////////////////////////////////////////////////////
; // CCS Cache Exception Codes
;
MessageId=0x4E00
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_SETTINGS_NOT_FOUND
Language=English
The CCS Cache settings could not be found.
.
MessageId=0x4E01
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_SETTINGS_INVALID
Language=English
The CCS Cache settings are invalid. Using the default settings.
.
MessageId=0x4E02
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_SETTINGS_EXCEPTION
Language=English
The exception '%1' occurred while reading the CCS Cache settings. Using the default settings.
.
MessageId=0x4E03
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_HASH_UNAVAILABLE_GENERIC
Language=English
No hash was available for the CCS Cache.
.
MessageId=0x4E04
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_HASH_UNAVAILABLE
Language=English
The CCS failed to provide a hash for '%1'.
.
MessageId=0x4E05
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_HASH_UNAVAILABLE_EXCEPTION
Language=English
The CCS threw an exception when a hash was requested for '%1'.
.
MessageId=0x4E06
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_CLASSIFICATION_UNAVAILABLE_GENERIC
Language=English
No classifications were available for the CCS Cache.
.
MessageId=0x4E07
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_CLASSIFICATION_UNAVAILABLE
Language=English
The CCS failed to provide the classifications for '%1'.
.
MessageId=0x4E08
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_CLASSIFICATION_UNAVAILABLE_EXCEPTION
Language=English
The CCS threw an exception when the classifications were requested for '%1'.
.
MessageId=0x4E09
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_INVALID_ATTRIBUTE_EXCEPTION
Language=English
The CCS Cache attribute %1 is invalid in dn=%2. Exception was '%3'
.
MessageId=0x4E0A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_INVALID_ATTRIBUTE
Language=English
The CCS Cache attribute %1 is invalid in dn=%2.
.
MessageId=0x4E0B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_MISSING_ATTRIBUTE
Language=English
The CCS Cache attribute %1 is missing in dn=%2.
.
MessageId=0x4E0C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_CREATE_ENTRY_FAILED
Language=English
The CCS Cache failed to create the entry '%1'. Result was '%2'.
.
MessageId=0x4E0D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_CREATE_ENTRY_FAILED_EXCEPTION
Language=English
The CCS Cache failed to create the entry '%1'. Exception was '%2'.
.
MessageId=0x4E0E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_UPDATE_ENTRY_FAILED
Language=English
The CCS Cache failed to update the entry '%1'. Result was '%2'.
.
MessageId=0x4E0F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_UPDATE_ENTRY_FAILED_EXCEPTION
Language=English
The CCS Cache failed to update the entry '%1'. Exception was '%2'.
.
MessageId=0x4E10
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_ENTRY_MISSING
Language=English
The CCS Cache unexpectedly failed to find the entry '%1'.
.
; // Note that this concise error string is designed to be consolodated into a another message.
MessageId=0x4E11
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_INVALID_FORMAT
Language=English
Invalid Format.
.
; // Note that this concise error string is designed to be consolodated into a another message.
MessageId=0x4E12
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_TOO_MANY_LDAP_RESULTS
Language=English
Too many results were returned from the LDAP search '%1'
.
MessageId=0x4E13
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_TOO_MANY_VALUES_IN_ATTRIBUTE
Language=English
Too many values in attribute '%1'.
.
MessageId=0x4E14
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_INVALID_PARAMETER
Language=English
The CCS Cache was passed an invalid parameter.
.
MessageId=0x4E15
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_FAILED_TO_STORE_HASH
Language=English
The CCS Cache failed to store a content digest.
.
MessageId=0x4E16
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_EXCEPTION_FINDING_CONTENTID
Language=English
The CCS Cache caught an exception while finding Content ID %1 (%2).
.
MessageId=0x4E17
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_EXCEPTION_FINDING_CLASSIFICATION
Language=English
The CCS Cache caught an exception while finding classification %1 (%2).
.
MessageId=0x4E18
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_FAILED_TO_STORE_CLASSIFICATION
Language=English
The CCS Cache failed to store a content classification.
.
MessageId=0x4E19
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_CERT_VALIDATION_FAILURE
Language=English
The CCS Cache failed to validate the certificate '%1'.
.
MessageId=0x4E1A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_CERT_VALIDATION_EXCEPTION
Language=English
The CCS Cache caught an exception while attempting to validate certificate '%1'. Message was '%2'.
.


; //////////////////////////////////////////////////////////////////////
; // CCS Cache Log Codes
;
MessageId=0x4F00
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CCS_CACHE_LOG_FAILED_TO_REMOVE_PENDING
Language=English
The CCS Cache could not remove Pending attribute on DN='%1': '%2'.
.
MessageId=0x4F01
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CCS_CACHE_LOG_FAILED_PARSE_LAST_ACCESS
Language=English
The CCS Cache could not parse the last access time attribute on DN='%1': '%2'.
.
MessageId=0x4F02
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CCS_CACHE_LOG_ENTRY_CONTAINED_NO_CLASSIFIERS
Language=English
The CCS Cache entry DN='%1' contained no classifiers.
.
MessageId=0x4F03
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CCS_CACHE_LOG_SETTINGS_INVALID_ENTRY
Language=English
The CCS Cache setting %1 was invalid. Using default (%2).
.
MessageId=0x4F04
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CCS_CACHE_LOG_CONNECTION_POOL_EXHAUSED
Language=English
The CCS Cache's LDAP Connection Pool is exhaused. This may affect performance. Consider revising the maxConnections setting.
.
MessageId=0x4F05
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CCS_CACHE_LOG_OFFLINE
Language=English
The CCS Cache has gone offline. Will attempt to reconnect in %1 seconds.
.
MessageId=0x4F06
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CCS_CACHE_LOG_FAILED_TO_CONNECT_LDAP
Language=English
The CCS Cache has failed to connect to the Directory: %1. %2
.
MessageId=0x4F07
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CCS_CACHE_LOG_FAILED_TO_CONNECT_GENERIC
Language=English
The CCS Cache has failed to connect to the Directory. Message was '%1'.
.
MessageId=0x4F08
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CCS_CACHE_LOG_FAILED_TO_ROLLBACK
Language=English
The CCS Cache failed to roll back the creation of DN='%1': %2
.
MessageId=0x4F09
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CCS_CACHE_LOG_ROLLBACK
Language=English
The CCS Cache rolled back the creation of DN='%1'.
.
MessageId=0x4F0A
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CCS_CACHE_LOG_FOUND_CONTENT_ID
Language=English
The CCS Cache found entry with content ID '%1'.
.
MessageId=0x4F0B
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CCS_CACHE_LOG_STORED_CONTENT_ID
Language=English
The CCS Cache stored entry with content ID '%1'.
.
MessageId=0x4F0C
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CCS_CACHE_LOG_FOUND_HASH
Language=English
The CCS Cache found entry with hash '%1'.
.
MessageId=0x4F0D
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CCS_CACHE_LOG_STORED_HASH
Language=English
The CCS Cache stored entry with hash '%1'.
.
MessageId=0x4F0E
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CCS_CACHE_LOG_LDAP_CONNECTED
Language=English
The CCS Cache successfully connected to '%1'
.
MessageId=0x4F0F
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CCS_CACHE_THREW_EXCEPTION
Language=English
The CCS Cache threw an exception: %1
.
MessageId=0x4F10
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CCS_CACHE_OFFLINE_MODE
Language=English
The CCS Cache is in offline (disabled) mode.
.

MessageId=0x4F11
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CCS_CACHE_MAINTENANCE_STARTING
Language=English
The CCS Cache Maintenance Service is starting.
.
MessageId=0x4F12
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CCS_CACHE_MAINTENANCE_STARTED
Language=English
The CCS Cache Maintenance Service has started.
.
MessageId=0x4F13
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_MAINTENANCE_STARTUP_FAILED
Language=English
The CCS Cache Maintenance Service failed to start up: %1
.
MessageId=0x4F14
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CCS_CACHE_MAINTENANCE_STOPPING
Language=English
The CCS Cache Maintenance Service is stopping.
.
MessageId=0x4F15
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CCS_CACHE_MAINTENANCE_STOPPED
Language=English
The CCS Cache Maintenance Service has stopped.
.
MessageId=0x4F16
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_MAINTENANCE_STOP_FAILED
Language=English
An error occurred while the CCS Cache Maintenance Service was stopping: %1
.
MessageId=0x4F17
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CCS_CACHE_MAINTENANCE_STARTING_PURGE
Language=English
The CCS Cache Maintenance Service has initiated the purge process.
.
MessageId=0x4F18
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_CCS_CACHE_MAINTENANCE_PURGE_COMPLETE
Language=English
The CCS Cache Maintenance Service has purged %1 objects from the cache.
.
MessageId=0x4F19
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_CCS_CACHE_MAINTENANCE_PURGE_FAILED
Language=English
The CCS Cache Maintenance Service failed to complete a purge: %1
.
MessageId=0x4F1A
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CCS_CACHE_UNEXPECTED_VERSION
Language=English
The CCS Cache version (%1) is unexpected. Expected %2.
.
MessageId=0x4F1B
Severity=Warning
Facility=Wigan
SymbolicName=WGN_W_CCS_CACHE_PURGE_SIZE_LIMIT
Language=English
Setting 'max-op-size = %1' in the CCS Cache DSA limits default.dxc file may improve purge performance.
.


; //////////////////////////////////////////////////////////////////////
; // WgnSNMP Errors. Many of these errors are mapped from WinSNMP errors
;

; // Mapped SNMP codes (0x5000 - 0x5015). These codes are obtained by adding the
; // result of SnmpGetLastError() to WGN_E_SNMP_FAILURE (except code 99).

; // #define SNMPAPI_FAILURE            0    /* Generic error code */
MessageId=0x5000
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_FAILURE
Language=English
Generic SNMP failure.
.

; // #define SNMPAPI_SUCCESS            1    /* Generic success code */
MessageId=0x5001
Severity=Success
Facility=Wigan
SymbolicName=WGN_E_SNMP_SUCCESS
Language=English
Generic SNMP success.
.

; // #define SNMPAPI_ALLOC_ERROR        2    /* Error allocating memory */
MessageId=0x5002
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_ALLOC_ERROR
Language=English
SNMP Error allocating memory.
.

; // #define SNMPAPI_CONTEXT_INVALID    3    /* Invalid context parameter */
MessageId=0x5003
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_CONTEXT_INVALID
Language=English
SNMP: Invalid context parameter.
.

; // #define SNMPAPI_CONTEXT_UNKNOWN    4    /* Unknown context parameter */
MessageId=0x5004
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_CONTEXT_UNKNOWN
Language=English
SNMP: Unknown context parameter.
.

; // #define SNMPAPI_ENTITY_INVALID     5    /* Invalid entity parameter */
MessageId=0x5005
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_ENTITY_INVALID
Language=English
SNMP: Invalid entity parameter.
.

; // #define SNMPAPI_ENTITY_UNKNOWN     6    /* Unknown entity parameter */
MessageId=0x5006
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_ENTITY_UNKNOWN
Language=English
SNMP: Unknown entity parameter.
.

; // #define SNMPAPI_INDEX_INVALID      7    /* Invalid VBL index parameter */
MessageId=0x5007
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_INDEX_INVALID
Language=English
SNMP: Invalid VBL index parameter.
.

; // #define SNMPAPI_NOOP               8    /* No operation performed */
MessageId=0x5008
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_NOOP
Language=English
SNMP: No operation performed.
.

; // #define SNMPAPI_OID_INVALID        9    /* Invalid OID parameter */
MessageId=0x5009
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_OID_INVALID
Language=English
SNMP: Invalid OID parameter.
.

; // #define SNMPAPI_OPERATION_INVALID  10   /* Invalid/unsupported operation */
MessageId=0x500A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_OPERATION_INVALID
Language=English
SNMP: Invalid/unsupported operation.
.

; // #define SNMPAPI_OUTPUT_TRUNCATED   11   /* Insufficient output buf len */
MessageId=0x500B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_OUTPUT_TRUNCATED
Language=English
SNMP: Insufficient output buf len.
.

; // #define SNMPAPI_PDU_INVALID        12   /* Invalid PDU parameter */
MessageId=0x500C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_PDU_INVALID
Language=English
SNMP: Invalid PDU parameter.
.

; // #define SNMPAPI_SESSION_INVALID    13   /* Invalid session parameter */
MessageId=0x500D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_SESSION_INVALID
Language=English
SNMP: Invalid session parameter.
.

; // #define SNMPAPI_SYNTAX_INVALID     14   /* Invalid syntax in smiVALUE */
MessageId=0x500E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_SYNTAX_INVALID
Language=English
SNMP: Invalid syntax in smiVALUE.
.

; // #define SNMPAPI_VBL_INVALID        15   /* Invalid VBL parameter */
MessageId=0x500F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_VBL_INVALID
Language=English
SNMP: Invalid VBL parameter.
.

; // #define SNMPAPI_MODE_INVALID       16   /* Invalid mode parameter */
MessageId=0x5010
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_MODE_INVALID
Language=English
SNMP: Invalid mode parameter.
.

; // #define SNMPAPI_SIZE_INVALID       17   /* Invalid size/length parameter */
MessageId=0x5011
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_SIZE_INVALID
Language=English
SNMP: Invalid size/length parameter.
.

; // #define SNMPAPI_NOT_INITIALIZED    18   /* SnmpStartup failed/not called */
MessageId=0x5012
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_NOT_INITIALIZED
Language=English
SNMP: SnmpStartup failed/not called.
.

; // #define SNMPAPI_MESSAGE_INVALID    19   /* Invalid SNMP message format */
MessageId=0x5013
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_MESSAGE_INVALID
Language=English
SNMP: Invalid SNMP message format.
.

; // #define SNMPAPI_HWND_INVALID       20   /* Invalid Window handle */
MessageId=0x5014
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_HWND_INVALID
Language=English
SNMP: Invalid Window handle.
.

; // #define SNMPAPI_OTHER_ERROR        99   /* For internal/undefined errors */
MessageId=0x5015
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_OTHER_ERROR
Language=English
SNMP: Internal/undefined error.
.

; //
; // Other WgnSNMP Result Codes

MessageId=0x5016
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_INVALID_REQUEST_OID
Language=English
The OID in an SNMP request was invalid.
.

; // Mapped Other and Transport Layer SNMP codes (0x5017 - 0x5020). These codes are obtained by adding the
; // result of (SnmpGetLastError() - SNMPAPI_TL_NOT_INITIALIZED) to WGN_E_SNMP_TL_NOT_INITIALIZED (except code 199).

; // #define SNMPAPI_TL_NOT_INITIALIZED 100  /* TL not initialized */
MessageId=0x5017
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_TL_NOT_INITIALIZED
Language=English
SNMP: TL not initialized.
.

; // #define SNMPAPI_TL_NOT_SUPPORTED   101  /* TL does not support protocol */
MessageId=0x5018
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_TL_NOT_SUPPORTED
Language=English
SNMP: TL does not support protocol.
.

; // #define SNMPAPI_TL_NOT_AVAILABLE   102  /* Network subsystem has failed */
MessageId=0x5019
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_TL_NOT_AVAILABLE
Language=English
SNMP: Network subsystem has failed.
.

; // #define SNMPAPI_TL_RESOURCE_ERROR  103  /* TL resource error */
MessageId=0x501A
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_TL_RESOURCE_ERROR
Language=English
SNMP: TL resource error.
.

; // #define SNMPAPI_TL_UNDELIVERABLE   104  /* Destination unreachable */
MessageId=0x501B
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_TL_UNDELIVERABLE
Language=English
SNMP: Destination unreachable.
.

; // #define SNMPAPI_TL_SRC_INVALID     105  /* Source endpoint invalid */
MessageId=0x501C
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_TL_SRC_INVALID
Language=English
SNMP: Source endpoint invalid.
.

; // #define SNMPAPI_TL_INVALID_PARAM   106  /* Input parameter invalid */
MessageId=0x501D
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_TL_INVALID_PARAM 
Language=English
SNMP: Input parameter invalid.
.

; // #define SNMPAPI_TL_IN_USE          107  /* Source endpoint in use */
MessageId=0x501E
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_TL_IN_USE
Language=English
SNMP: Source endpoint in use.
.

; // #define SNMPAPI_TL_TIMEOUT         108  /* No response before timeout */
MessageId=0x501F
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_TL_TIMEOUT
Language=English
SNMP: No response before timeout.
.

; // #define SNMPAPI_TL_PDU_TOO_BIG     109  /* PDU too big for send/receive */
MessageId=0x5020
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_TL_PDU_TOO_BIG
Language=English
SNMP: PDU too big for send/receive.
.

; // #define SNMPAPI_TL_OTHER           199  /* Undefined TL error */
MessageId=0x5021
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_TL_OTHER
Language=English
SNMP: Undefined TL error.
.


MessageId=0x5022
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_TIMEOUT
Language=English
Timed out waiting for SNMP response.
.
MessageId=0x5023
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_REQUEST_ABANDONED
Language=English
The SNMP request was abandoned.
.
MessageId=0x5024
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_SNMP_REQUEST_IN_PROGRESS
Language=English
An SNMP request is already in progress.
.


; //////////////////////////////////////////////////////////////////////
; // WgnADP Errors. 
;
MessageId=0x5100
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ADP_STARTED
Language=English
Automatic Document Protection process started on %1.
.
MessageId=0x5101
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ADP_FINISHED
Language=English
Automatic Document Protection process finished on %1.
.
MessageId=0x5102
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_ADP_LOGGED_ON
Language=English
Session created on '%1' for user '%2'.
.
MessageId=0x5103
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_ADP_NO_CMS_SPECIFIED
Language=English
Session could not be created as no CMS was specified.
.
; //////////////////////////////////////////////////////////////////////
; // File Server Resource Manager (FSRM) File Classification 
; // Infastructure (FCI) log codes. 
;
MessageId=0x5200
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_LOG_FCI_STARTED
Language=English
The Classification Plugin has been loaded by the FSRM.
.
MessageId=0x5201
Severity=Informational
Facility=Wigan
SymbolicName=WGN_I_LOG_FCI_FINISHED
Language=English
The Classification Plugin has been unloaded by the FSRM.
.
MessageId=0x52A0
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_FCI_ERROR
Language=English
The plugin failed with error: '%1'.
.
MessageId=0x52A1
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_FCI_LOAD_FAILED
Language=English
The FSRM failed to load the plugin with error: '%1'.
.
MessageId=0x52A2
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_FCI_CLASSIFY_FAILED
Language=English
The plugin failed to classify a file with error '%1'.
.
MessageId=0x52A3
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_FCI_GET_PROPERTY_FAILED
Language=English
The plugin failed to provide a classification value with error '%1'.
.
MessageId=0x52A4
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_FCI_GET_RULES_FAILED
Language=English
The plugin with failed to process rules and definitions from the FSRM with error '%1'.
.
MessageId=0x52A5
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_FCI_UNREGISTER_PERFMONS
Language=English
Error unregistering performance counters : '%1'.
.
MessageId=0x52A6
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_FCI_REGISTER_PERFMONS
Language=English
Error registering performance counters : '%1'.
.
MessageId=0x52A7
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_FCI_INIT_PERFMONS
Language=English
Error Initializing performance counters : '%1'.
.
MessageId=0x52A8
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_LOG_FCI_FSRM_FILE_ERROR
Language=English
The File Server Resource Manager cannot open '%1'. The file may be in use or access may have been denied. FSRM Error : '%2'.
.
;// Mapped FACILITY_ITF interface-specific MAPI codes.
;//  See MAPICode.h for further information.
;//
;// WARNING: FACILITY_ITF status codes with a severity of ERROR usually have the reserved second severity bit
;//  set to zero. Because of this they must be defined with Severity=Warning.
;
MessageId=0x102
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_NO_SUPPORT
Language=English
MAPI status code MAPI_E_NO_SUPPORT.
.
MessageId=0x103
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_BAD_CHARWIDTH
Language=English
MAPI status code MAPI_E_BAD_CHARWIDTH.
.
MessageId=0x105
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_STRING_TOO_LONG
Language=English
MAPI status code MAPI_E_STRING_TOO_LONG.
.
MessageId=0x106
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_UNKNOWN_FLAGS
Language=English
MAPI status code MAPI_E_UNKNOWN_FLAGS.
.
MessageId=0x107
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_INVALID_ENTRYID
Language=English
MAPI status code MAPI_E_INVALID_ENTRYID.
.
MessageId=0x108
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_INVALID_OBJECT
Language=English
MAPI status code MAPI_E_INVALID_OBJECT.
.
MessageId=0x109
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_OBJECT_CHANGED
Language=English
MAPI status code MAPI_E_OBJECT_CHANGED.
.
MessageId=0x10A
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_OBJECT_DELETED
Language=English
MAPI status code MAPI_E_OBJECT_DELETED.
.
MessageId=0x10B
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_BUSY
Language=English
MAPI status code MAPI_E_BUSY.
.
MessageId=0x10D
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_NOT_ENOUGH_DISK
Language=English
MAPI status code MAPI_E_NOT_ENOUGH_DISK.
.
MessageId=0x10E
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_NOT_ENOUGH_RESOURCES
Language=English
MAPI status code MAPI_E_NOT_ENOUGH_RESOURCES.
.
MessageId=0x010F
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_NOT_FOUND
Language=English
The requested MAPI property or object can not be found.
.
MessageId=0x110
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_VERSION
Language=English
MAPI status code MAPI_E_VERSION.
.
MessageId=0x111
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_LOGON_FAILED
Language=English
MAPI status code MAPI_E_LOGON_FAILED.
.
MessageId=0x112
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_SESSION_LIMIT
Language=English
MAPI status code MAPI_E_SESSION_LIMIT.
.
MessageId=0x113
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_USER_CANCEL
Language=English
MAPI status code MAPI_E_USER_CANCEL.
.
MessageId=0x114
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_UNABLE_TO_ABORT
Language=English
MAPI status code MAPI_E_UNABLE_TO_ABORT.
.
MessageId=0x115
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_NETWORK_ERROR
Language=English
MAPI status code MAPI_E_NETWORK_ERROR.
.
MessageId=0x116
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_DISK_ERROR
Language=English
MAPI status code MAPI_E_DISK_ERROR.
.
MessageId=0x117
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_TOO_COMPLEX
Language=English
MAPI status code MAPI_E_TOO_COMPLEX.
.
MessageId=0x118
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_BAD_COLUMN
Language=English
MAPI status code MAPI_E_BAD_COLUMN.
.
MessageId=0x119
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_EXTENDED_ERROR
Language=English
MAPI status code MAPI_E_EXTENDED_ERROR.
.
MessageId=0x11A
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_COMPUTED
Language=English
MAPI status code MAPI_E_COMPUTED.
.
MessageId=0x11B
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_CORRUPT_DATA
Language=English
MAPI status code MAPI_E_CORRUPT_DATA.
.
MessageId=0x11C
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_UNCONFIGURED
Language=English
MAPI status code MAPI_E_UNCONFIGURED.
.
MessageId=0x11D
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_FAILONEPROVIDER
Language=English
MAPI status code MAPI_E_FAILONEPROVIDER.
.
MessageId=0x11E
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_UNKNOWN_CPID
Language=English
MAPI status code MAPI_E_UNKNOWN_CPID.
.
MessageId=0x11F
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_UNKNOWN_LCID
Language=English
MAPI status code MAPI_E_UNKNOWN_LCID.
.
MessageId=0x120
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_PASSWORD_CHANGE_REQUIRED
Language=English
MAPI status code MAPI_E_PASSWORD_CHANGE_REQUIRED.
.
MessageId=0x121
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_PASSWORD_EXPIRED
Language=English
MAPI status code MAPI_E_PASSWORD_EXPIRED.
.
MessageId=0x122
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_INVALID_WORKSTATION_ACCOUNT
Language=English
MAPI status code MAPI_E_INVALID_WORKSTATION_ACCOUNT.
.
MessageId=0x123
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_INVALID_ACCESS_TIME
Language=English
MAPI status code MAPI_E_INVALID_ACCESS_TIME.
.
MessageId=0x124
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_ACCOUNT_DISABLED
Language=English
MAPI status code MAPI_E_ACCOUNT_DISABLED.
.
MessageId=0x125
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_RECONNECTED
Language=English
MAPI status code MAPI_E_RECONNECTED.
.
MessageId=0x126
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_OFFLINE
Language=English
MAPI status code MAPI_E_OFFLINE.
.
MessageId=0x200
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_END_OF_SESSION
Language=English
MAPI status code MAPI_E_END_OF_SESSION.
.
MessageId=0x201
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_UNKNOWN_ENTRYID
Language=English
MAPI status code MAPI_E_UNKNOWN_ENTRYID.
.
MessageId=0x202
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_MISSING_REQUIRED_COLUMN
Language=English
MAPI status code MAPI_E_MISSING_REQUIRED_COLUMN.
.
MessageId=0x203
Severity=Success
Facility=Mapi
SymbolicName=WGN_MAPI_W_NO_SERVICE
Language=English
MAPI status code MAPI_W_NO_SERVICE.
.
MessageId=0x301
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_BAD_VALUE
Language=English
MAPI status code MAPI_E_BAD_VALUE.
.
MessageId=0x302
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_INVALID_TYPE
Language=English
MAPI status code MAPI_E_INVALID_TYPE.
.
MessageId=0x303
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_TYPE_NO_SUPPORT
Language=English
MAPI status code MAPI_E_TYPE_NO_SUPPORT.
.
MessageId=0x304
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_UNEXPECTED_TYPE
Language=English
MAPI status code MAPI_E_UNEXPECTED_TYPE.
.
MessageId=0x305
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_TOO_BIG
Language=English
MAPI status code MAPI_E_TOO_BIG.
.
MessageId=0x306
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_DECLINE_COPY
Language=English
MAPI status code MAPI_E_DECLINE_COPY.
.
MessageId=0x307
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_UNEXPECTED_ID
Language=English
MAPI status code MAPI_E_UNEXPECTED_ID.
.
MessageId=0x380
Severity=Success
Facility=Mapi
SymbolicName=WGN_MAPI_W_ERRORS_RETURNED
Language=English
MAPI status code MAPI_W_ERRORS_RETURNED.
.
MessageId=0x400
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_UNABLE_TO_COMPLETE
Language=English
MAPI status code MAPI_E_UNABLE_TO_COMPLETE.
.
MessageId=0x401
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_TIMEOUT
Language=English
MAPI status code MAPI_E_TIMEOUT.
.
MessageId=0x402
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_TABLE_EMPTY
Language=English
MAPI status code MAPI_E_TABLE_EMPTY.
.
MessageId=0x403
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_TABLE_TOO_BIG
Language=English
MAPI status code MAPI_E_TABLE_TOO_BIG.
.
MessageId=0x405
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_INVALID_BOOKMARK
Language=English
MAPI status code MAPI_E_INVALID_BOOKMARK.
.
MessageId=0x481
Severity=Success
Facility=Mapi
SymbolicName=WGN_MAPI_W_POSITION_CHANGED
Language=English
MAPI status code MAPI_W_POSITION_CHANGED.
.
MessageId=0x482
Severity=Success
Facility=Mapi
SymbolicName=WGN_MAPI_W_APPROX_COUNT
Language=English
MAPI status code MAPI_W_APPROX_COUNT.
.
MessageId=0x500
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_WAIT
Language=English
MAPI status code MAPI_E_WAIT.
.
MessageId=0x501
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_CANCEL
Language=English
MAPI status code MAPI_E_CANCEL.
.
MessageId=0x502
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_NOT_ME
Language=English
MAPI status code MAPI_E_NOT_ME.
.
MessageId=0x580
Severity=Success
Facility=Mapi
SymbolicName=WGN_MAPI_W_CANCEL_MESSAGE
Language=English
MAPI status code MAPI_W_CANCEL_MESSAGE.
.
MessageId=0x600
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_CORRUPT_STORE
Language=English
MAPI status code MAPI_E_CORRUPT_STORE.
.
MessageId=0x601
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_NOT_IN_QUEUE
Language=English
MAPI status code MAPI_E_NOT_IN_QUEUE.
.
MessageId=0x602
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_NO_SUPPRESS
Language=English
MAPI status code MAPI_E_NO_SUPPRESS.
.
MessageId=0x604
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_COLLISION
Language=English
MAPI status code MAPI_E_COLLISION.
.
MessageId=0x605
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_NOT_INITIALIZED
Language=English
MAPI status code MAPI_E_NOT_INITIALIZED.
.
MessageId=0x606
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_NON_STANDARD
Language=English
MAPI status code MAPI_E_NON_STANDARD.
.
MessageId=0x607
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_NO_RECIPIENTS
Language=English
MAPI status code MAPI_E_NO_RECIPIENTS.
.
MessageId=0x608
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_SUBMITTED
Language=English
MAPI status code MAPI_E_SUBMITTED.
.
MessageId=0x609
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_HAS_FOLDERS
Language=English
MAPI status code MAPI_E_HAS_FOLDERS.
.
MessageId=0x60A
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_HAS_MESSAGES
Language=English
MAPI status code MAPI_E_HAS_MESSAGES.
.
MessageId=0x60B
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_FOLDER_CYCLE
Language=English
MAPI status code MAPI_E_FOLDER_CYCLE.
.
MessageId=0x680
Severity=Success
Facility=Mapi
SymbolicName=WGN_MAPI_W_PARTIAL_COMPLETION
Language=English
MAPI status code MAPI_W_PARTIAL_COMPLETION.
.
MessageId=0x700
Severity=Warning
Facility=Mapi
SymbolicName=WGN_MAPI_E_AMBIGUOUS_RECIP
Language=English
MAPI status code MAPI_E_AMBIGUOUS_RECIP.
.
;
; // AppMon codes 0x5300-0x53FF.
;
MessageId=0x5300
Severity=Error
Facility=Wigan
SymbolicName=WGN_E_APPMON_INIT_FAILED
Language=English
Application Monitor initialization failed. Policy will not be applied to application '%1'.
.

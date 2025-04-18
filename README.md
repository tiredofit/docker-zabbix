Zabbix Server, Proxy and Frontend  based on Alpine tied to Postgresql backend.


### Zabbix General Options
| Parameter                        | Description                                                                                                   | Default                     |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------- | --------------------------- |
| ZABBIX_CERT_PATH                 | Path to the directory containing Zabbix certificates                                                         | /etc/zabbix/certs/          |
| ZABBIX_MODE                      | Mode in which Zabbix is running (e.g., PROXY, SERVER)                                                         | PROXY                       |
| ZABBIX_USER                      | User under which Zabbix is running                                                                            | zabbix                      |

### Zabbix Proxy Options
| Parameter                        | Description                                                                                                   | Default                     |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------- | --------------------------- |
| ZABBIX_PROXY_ALLOW_ROOT          | Allow running the proxy as root user                                                                          | 1                           |
| ZABBIX_PROXY_BUFFER_LOCAL        | Enable local buffer for data                                                                                  | 0                           |
| ZABBIX_PROXY_BUFFER_OFFLINE      | Enable offline buffer for data                                                                                | 1                           |
| ZABBIX_PROXY_CACHE_HISTORY_INDEX_SIZE | Size of the history index cache                                                                             | 16M                         |
| ZABBIX_PROXY_CACHE_HISTORY_SIZE  | Size of the history cache                                                                                     | 16M                         |
| ZABBIX_PROXY_CACHE_SIZE          | Size of the configuration cache                                                                               | 16M                         |
| ZABBIX_PROXY_CONFIG_FILE         | Path to the Zabbix Proxy configuration file                                                                   | zabbix_proxy.conf           |
| ZABBIX_PROXY_CONFIG_PATH         | Directory path for the Zabbix Proxy configuration                                                             | /etc/zabbix/                |
| ZABBIX_PROXY_DEBUG_LEVEL         | Debug level for logging                                                                                       | 2                           |
| ZABBIX_PROXY_FREQUENCY_CONFIG    | Frequency of configuration synchronization (in seconds)                                                       | 180                         |
| ZABBIX_PROXY_FREQUENCY_DATASENDER | Frequency of data sending to the server (in seconds)                                                         | 1                           |
| ZABBIX_PROXY_FREQUENCY_HEARTBEAT | Frequency of heartbeat checks (in seconds)                                                                   | 60                          |
| ZABBIX_PROXY_FREQUENCY_HOUSEKEEPING | Frequency of housekeeping tasks (in seconds)                                                                | 1                           |
| ZABBIX_PROXY_FREQUENCY_UNAVAILABLE_DELAY | Delay before retrying unavailable hosts (in seconds)                                                     | 60                          |
| ZABBIX_PROXY_FREQUENCY_UNREACHABLE | Frequency of unreachable host checks (in seconds)                                                           | 45                          |
| ZABBIX_PROXY_FREQUENCY_UNREACHABLE_DELAY | Delay before retrying unreachable hosts (in seconds)                                                     | 15                          |
| ZABBIX_PROXY_HOSTNAME            | Hostname of the Zabbix Proxy                                                                                  | zabbix-proxy                |
| ZABBIX_PROXY_LISTEN_PORT         | Port for the Zabbix Proxy to listen on                                                                        | 10051                       |
| ZABBIX_PROXY_LOGFILESIZE         | Maximum size of the log file (in MB)                                                                          | 0                           |
| ZABBIX_PROXY_LOG_TYPE            | Type of logging (e.g., file, console)                                                                         | file                        |
| ZABBIX_PROXY_LOG_FILE            | Name of the log file                                                                                          | zabbix_proxy.log            |
| ZABBIX_PROXY_LOG_PATH            | Path to the log directory                                                                                     | /var/log/zabbix/proxy/      |
| ZABBIX_PROXY_MODE                | Proxy mode (0 for active, 1 for passive)                                                                      | 0                           |
| ZABBIX_PROXY_REMOTECOMMANDS      | Enable remote commands                                                                                        | 1                           |
| ZABBIX_PROXY_REMOTECOMMANDS_LOG  | Enable logging of remote commands                                                                             | 1                           |
| ZABBIX_PROXY_SERVER              | Hostname of the Zabbix Server                                                                                 | zabbix-server               |
| ZABBIX_PROXY_SERVER_PORT         | Port of the Zabbix Server                                                                                     | 10051                       |
| ZABBIX_PROXY_SETUP_TYPE          | Setup type for the proxy                                                                                      | AUTO                        |
| ZABBIX_PROXY_START_DB_SYNCERS    | Number of database syncer processes                                                                           | 4                           |
| ZABBIX_PROXY_START_DISCOVERERS   | Number of discoverer processes                                                                                | 3                           |
| ZABBIX_PROXY_START_PINGERS       | Number of ICMP pinger processes                                                                               | 3                           |
| ZABBIX_PROXY_START_POLLERS       | Number of poller processes                                                                                    | 5                           |
| ZABBIX_PROXY_START_POLLERS_HTTP  | Number of HTTP poller processes                                                                               | 2                           |
| ZABBIX_PROXY_START_POLLERS_IPMI  | Number of IPMI poller processes                                                                               | 0                           |
| ZABBIX_PROXY_START_POLLERS_JAVA  | Number of Java poller processes                                                                               | 0                           |
| ZABBIX_PROXY_START_POLLERS_UNREACHABLE | Number of unreachable poller processes                                                                    | 3                           |
| ZABBIX_PROXY_START_PREPROCESSORS | Number of preprocessing worker processes                                                                      | 3                           |
| ZABBIX_PROXY_START_TRAPPERS      | Number of trapper processes                                                                                   | 5                           |
| ZABBIX_PROXY_TIMEOUT             | Timeout for processing requests (in seconds)                                                                 | 4                           |
| ZABBIX_PROXY_TIMEOUT_TRAPPER     | Timeout for trapper processes (in seconds)                                                                   | 300                         |
| ZABBIX_PROXY_TLS_CONNECT         | TLS connection mode (e.g., unencrypted, PSK, certificate)                                                     | unencrypted                 |
| ZABBIX_PROXY_TLS_ACCEPT          | TLS acceptance mode (e.g., unencrypted, PSK, certificate)                                                     | unencrypted                 |
| ZABBIX_PROXY_TLS_CA_FILE         | Path to the TLS CA file                                                                                       |                             |
| ZABBIX_PROXY_TLS_CRL_FILE        | Path to the TLS CRL file                                                                                      |                             |
| ZABBIX_PROXY_TLS_SERVER_CERT_ISSUER | Issuer of the server certificate                                                                             |                             |
| ZABBIX_PROXY_TLS_SERVER_CRT_SUBJECT | Subject of the server certificate                                                                            |                             |
| ZABBIX_PROXY_TLS_CERT_FILE       | Path to the TLS certificate file                                                                              |                             |
| ZABBIX_PROXY_TLS_KEY_FILE        | Path to the TLS key file                                                                                      |                             |
| ZABBIX_PROXY_TLS_PSK_IDENTITY    | PSK identity for TLS                                                                                          |                             |
| ZABBIX_PROXY_TLS_PSK_FILE        | Path to the PSK file                                                                                          |                             |
| ZABBIX_PROXY_DB_TLS_CONNECT      | TLS connection mode for the database                                                                          |                             |
| ZABBIX_PROXY_DB_TLS_CA_FILE      | Path to the database TLS CA file                                                                              |                             |
| ZABBIX_PROXY_DB_TLS_CERT_FILE    | Path to the database TLS certificate file                                                                     |                             |
| ZABBIX_PROXY_DB_TLS_KEY_FILE     | Path to the database TLS key file                                                                             |                             |
| ZABBIX_PROXY_DB_TLS_CIPHER       | Cipher for database TLS connections                                                                           |                             |
| ZABBIX_PROXY_DB_TLS_CIPHER13     | TLS 1.3 cipher for database connections                                                                       |                             |
| ZABBIX_PROXY_VAULT               | Enable Vault integration                                                                                      |                             |
| ZABBIX_PROXY_VAULT_TOKEN         | Token for Vault integration                                                                                   |                             |
| ZABBIX_PROXY_VAULT_URL           | URL for Vault integration                                                                                     |                             |
| ZABBIX_PROXY_VAULT_PREFIX        | Prefix for Vault paths                                                                                        |                             |
| ZABBIX_PROXY_VAULT_DB_PATH       | Database path for Vault integration                                                                           |                             |
| ZABBIX_PROXY_VAULT_TLS_CERT_FILE | Path to the Vault TLS certificate file                                                                        |                             |
| ZABBIX_PROXY_VAULT_TLS_KEY_FILE  | Path to the Vault TLS key file                                                                                |                             |

### Zabbix Server Options
| Parameter                        | Description                                                                                                   | Default                     |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------- | --------------------------- |
| ZABBIX_SERVER_ALLOW_UNSUPPORTED_DB | Allow using unsupported database versions                                                                     | 1                           |
| ZABBIX_SERVER_ALLOW_ROOT         | Allow running the server as root user                                                                         | 1                           |
| ZABBIX_SERVER_BUFFER_LOCAL       | Enable local buffer for data                                                                                  | 0                           |
| ZABBIX_SERVER_BUFFER_OFFLINE     | Enable offline buffer for data                                                                                | 1                           |
| ZABBIX_SERVER_CACHE_HISTORY_INDEX_SIZE | Size of the history index cache                                                                             | 4M                          |
| ZABBIX_SERVER_CACHE_HISTORY_SIZE | Size of the history cache                                                                                     | 16M                         |
| ZABBIX_SERVER_CACHE_SIZE         | Size of the configuration cache                                                                               | 8M                          |
| ZABBIX_SERVER_CACHE_TREND_FUNCTION_SIZE | Size of the trend function cache                                                                           | 4M                          |
| ZABBIX_SERVER_CACHE_UPDATE_FREQUENCY | Frequency of configuration cache updates (in seconds)                                                      | 60                          |
| ZABBIX_SERVER_CACHE_VALUE_SIZE   | Size of the value cache                                                                                       | 8M                          |
| ZABBIX_SERVER_CONFIG_FILE        | Path to the Zabbix Server configuration file                                                                  | zabbix_server.conf          |
| ZABBIX_SERVER_CONFIG_PATH        | Directory path for the Zabbix Server configuration                                                            | /etc/zabbix/                |
| ZABBIX_SERVER_DB_TYPE            | Database type used by the server                                                                              | POSTGRESQL                  |
| ZABBIX_SERVER_DEBUG_LEVEL        | Debug level for logging                                                                                       | 2                           |
| ZABBIX_SERVER_FREQUENCY_CONFIG   | Frequency of configuration synchronization (in seconds)                                                       | 3600                        |
| ZABBIX_SERVER_FREQUENCY_DATASENDER | Frequency of data sending to the server (in seconds)                                                         | 1                           |
| ZABBIX_SERVER_FREQUENCY_HEARTBEAT | Frequency of heartbeat checks (in seconds)                                                                   | 60                          |
| ZABBIX_SERVER_FREQUENCY_HOUSEKEEPING | Frequency of housekeeping tasks (in seconds)                                                                | 1                           |
| ZABBIX_SERVER_FREQUENCY_PROXY_CONFIG | Frequency of proxy configuration synchronization (in seconds)                                               | 3600                        |
| ZABBIX_SERVER_FREQUENCY_PROXY_DATA | Frequency of proxy data synchronization (in seconds)                                                         | 1                           |
| ZABBIX_SERVER_FREQUENCY_UNAVAILABLE_DELAY | Delay before retrying unavailable hosts (in seconds)                                                     | 60                          |
| ZABBIX_SERVER_FREQUENCY_UNREACHABLE | Frequency of unreachable host checks (in seconds)                                                           | 45                          |
| ZABBIX_SERVER_FREQUENCY_UNREACHABLE_DELAY | Delay before retrying unreachable hosts (in seconds)                                                     | 15                          |
| ZABBIX_SERVER_HOSTNAME           | Hostname of the Zabbix Server                                                                                 | zabbix-server               |
| ZABBIX_SERVER_LISTEN_PORT        | Port for the Zabbix Server to listen on                                                                       | 10051                       |
| ZABBIX_SERVER_LOGFILESIZE        | Maximum size of the log file (in MB)                                                                          | 0                           |
| ZABBIX_SERVER_LOG_TYPE           | Type of logging (e.g., file, console)                                                                         | FILE                        |
| ZABBIX_SERVER_LOG_FILE           | Name of the log file                                                                                          | zabbix_server.log           |
| ZABBIX_SERVER_LOG_PATH           | Path to the log directory                                                                                     | /var/log/zabbix/server/     |
| ZABBIX_SERVER_MAX_HOUSEKEEPING_DELETE | Maximum number of rows deleted during housekeeping                                                          | 5000                        |
| ZABBIX_SERVER_REMOTECOMMANDS     | Enable remote commands                                                                                        | 1                           |
| ZABBIX_SERVER_REMOTECOMMANDS_LOG | Enable logging of remote commands                                                                             | 1                           |
| ZABBIX_SERVER_SETUP_TYPE         | Setup type for the server                                                                                     | AUTO                        |
| ZABBIX_SERVER_START_ALERTERS     | Number of alerter processes                                                                                   | 3                           |
| ZABBIX_SERVER_START_DB_SYNCERS   | Number of database syncer processes                                                                           | 4                           |
| ZABBIX_SERVER_START_DISCOVERERS  | Number of discoverer processes                                                                                | 1                           |
| ZABBIX_SERVER_START_ESCALATORS   | Number of escalator processes                                                                                 | 1                           |
| ZABBIX_SERVER_START_LLD_PROCESSORS | Number of low-level discovery processors                                                                     | 2                           |
| ZABBIX_SERVER_START_PINGERS      | Number of ICMP pinger processes                                                                               | 1                           |
| ZABBIX_SERVER_START_POLLERS      | Number of poller processes                                                                                    | 5                           |
| ZABBIX_SERVER_START_POLLERS_HISTORY | Number of history poller processes                                                                          | 1                           |
| ZABBIX_SERVER_START_POLLERS_HTTP | Number of HTTP poller processes                                                                               | 1                           |
| ZABBIX_SERVER_START_POLLERS_IPMI | Number of IPMI poller processes                                                                               | 0                           |
| ZABBIX_SERVER_START_POLLERS_JAVA | Number of Java poller processes                                                                               | 0                           |
| ZABBIX_SERVER_START_POLLERS_UNREACHABLE | Number of unreachable poller processes                                                                    | 1                           |
| ZABBIX_SERVER_START_PREPROCESSORS | Number of preprocessing worker processes                                                                      | 3                           |
| ZABBIX_SERVER_START_PROXY_POLLERS | Number of proxy poller processes                                                                             | 1                           |
| ZABBIX_SERVER_START_REPORT_WRITERS | Number of report writer processes                                                                           | 1                           |
| ZABBIX_SERVER_START_SNMPTRAPPER  | Number of SNMP trapper processes                                                                              | 0                           |
| ZABBIX_SERVER_START_TIMERS       | Number of timer processes                                                                                     | 1                           |
| ZABBIX_SERVER_START_TRAPPERS     | Number of trapper processes                                                                                   | 5                           |
| ZABBIX_SERVER_TIMEOUT            | Timeout for processing requests (in seconds)                                                                 | 4                           |
| ZABBIX_SERVER_TIMEOUT_TRAPPER    | Timeout for trapper processes (in seconds)                                                                   | 300                         |
| ZABBIX_SERVER_WEBSERVICE_URL     | URL for the Zabbix web service                                                                                | http://zabbix-webservice:10053/report |

### Zabbix Webservice Options
| Parameter                        | Description                                                                                                   | Default                     |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------- | --------------------------- |
| ZABBIX_WEBSERVICE_ALLOWED_IPS    | IPs allowed to access the Zabbix Webservice                                                                   | ::/0                        |
| ZABBIX_WEBSERVICE_DEBUG_LEVEL    | Debug level for logging                                                                                       | 2                           |
| ZABBIX_WEBSERVICE_CONFIG_FILE    | Path to the Zabbix Webservice configuration file                                                              | zabbix_webservice.conf      |
| ZABBIX_WEBSERVICE_CONFIG_PATH    | Directory path for the Zabbix Webservice configuration                                                        | /etc/zabbix/                |
| ZABBIX_WEBSERVICE_LISTEN_PORT    | Port for the Zabbix Webservice to listen on                                                                   | 10053                       |
| ZABBIX_WEBSERVICE_LOGFILESIZE    | Maximum size of the log file (in MB)                                                                          | 0                           |
| ZABBIX_WEBSERVICE_LOG_TYPE       | Type of logging (e.g., file, console)                                                                         | FILE                        |
| ZABBIX_WEBSERVICE_LOG_FILE       | Name of the log file                                                                                          | zabbix_webservice.log       |
| ZABBIX_WEBSERVICE_LOG_PATH       | Path to the log directory                                                                                     | /var/log/zabbix/webservice/ |
| ZABBIX_WEBSERVICE_SETUP_TYPE     | Setup type for the webservice                                                                                 | AUTO                        |
| ZABBIX_WEBSERVICE_TIMEOUT        | Timeout for processing requests (in seconds)                                                                 | 4                           |


# Gearmand

Build:
```bash
docker build -t liyyt/gearmand:latest .
```

```
gearmand --help
Allowed options:

Allowed options:

General options:
  -b [ --backlog ] arg (=32)            Number of backlog connections for 
                                        listen.
  -d [ --daemon ]                       Daemon, detach and run in the 
                                        background.
  --exceptions                          Enable protocol exceptions by default.
  -f [ --file-descriptors ] arg         Number of file descriptors to allow for
                                        the process (total connections will be 
                                        slightly less). Default is max allowed 
                                        for user.
  -h [ --help ]                         Print this help menu.
  -j [ --job-retries ] arg (=0)         Number of attempts to run the job 
                                        before the job server removes it. This 
                                        is helpful to ensure a bad job does not
                                        crash all available workers. Default is
                                        no limit.
  --job-handle-prefix arg               Prefix used to generate a job handle 
                                        string. If not provided, the default 
                                        "H:<host_name>" is used.
  --hashtable-buckets arg (=991)        Number of buckets in the internal job 
                                        hash tables. The default of 991 works 
                                        well for about three million jobs in 
                                        queue. If the number of jobs in the 
                                        queue at any time will exceed three 
                                        million, use proportionally larger 
                                        values (991 * # of jobs / 3M). For 
                                        example, to accommodate 2^32 jobs, use 
                                        1733003. This will consume ~26MB of 
                                        extra memory. Gearmand cannot support 
                                        more than 2^32 jobs in queue at this 
                                        time.
  --keepalive                           Enable keepalive on sockets.
  --keepalive-idle arg (=-1)            If keepalive is enabled, set the value 
                                        for TCP_KEEPIDLE for systems that 
                                        support it. A value of -1 means that 
                                        either the system does not support it 
                                        or an error occurred when trying to 
                                        retrieve the default value.
  --keepalive-interval arg (=-1)        If keepalive is enabled, set the value 
                                        for TCP_KEEPINTVL for systems that 
                                        support it. A value of -1 means that 
                                        either the system does not support it 
                                        or an error occurred when trying to 
                                        retrieve the default value.
  --keepalive-count arg (=-1)           If keepalive is enabled, set the value 
                                        for TCP_KEEPCNT for systems that 
                                        support it. A value of -1 means that 
                                        either the system does not support it 
                                        or an error occurred when trying to 
                                        retrieve the default value.
  -l [ --log-file ] arg (=/usr/local/var/log/gearmand.log)
                                        Log file to write errors and 
                                        information to. If the log-file 
                                        parameter is specified as 'stderr', 
                                        then output will go to stderr. If 
                                        'none', then no logfile will be 
                                        generated.
  -L [ --listen ] arg                   Address the server should listen on. 
                                        Default is INADDR_ANY.
  -P [ --pid-file ] arg (=/usr/local/var/gearmand.pid)
                                        File to write process ID out to.
  -r [ --protocol ] arg                 Load protocol module.
  -R [ --round-robin ]                  Assign work in round-robin order per 
                                        worker connection. The default is to 
                                        assign work in the order of functions 
                                        added by the worker.
  -q [ --queue-type ] arg (=builtin)    Persistent queue type to use.
  --config-file arg (=/usr/local/etc/gearmand.conf)
                                        Can be specified with '@name', too
  --syslog                              Use syslog.
  --coredump                            Whether to create a core dump for 
                                        uncaught signals.
  -t [ --threads ] arg (=4)             Number of I/O threads to use, 0 means 
                                        that gearmand will try to guess the 
                                        maximum number it can use. Default=4.
  -u [ --user ] arg                     Switch to given user after startup.
  --verbose arg (=ERROR)                Set verbose level (FATAL, ALERT, 
                                        CRITICAL, ERROR, WARNING, NOTICE, INFO,
                                        DEBUG).
  -V [ --version ]                      Display the version of gearmand and 
                                        exit.
  -w [ --worker-wakeup ] arg (=0)       Number of workers to wakeup for each 
                                        job received. The default is to wakeup 
                                        all available workers.

HTTP:
  --http-port arg (=8080)               Port to listen on.

Gear:
  -p [ --port ] arg (=4730)             Port the server should listen on.
  --ssl                                 Enable ssl connections.
  --ssl-ca-file arg                     CA file.
  --ssl-certificate arg                 SSL certificate.
  --ssl-key arg                         SSL key for certificate.

builtin:

redis:
  --redis-server arg                    Redis server
  --redis-port arg                      Redis server port/service
  --redis-password arg                  Redis server password/service
```

http://gearman.info/bin/gearman.html

```
gearman --help

Client mode: gearman [options] [<data>]
Worker mode: gearman -w [options] [<command> [<args> ...]]

Common options to both client and worker modes.
	-f <function> - Function name to use for jobs (can give many)
	-h <host>     - Job server host
	-H            - Print this help menu
	-v            - Print diagnostic information to stdout(true)
	-p <port>     - Job server port
	-t <timeout>  - Timeout in milliseconds
	-i <pidfile>  - Create a pidfile for the process
	-S            - Enable SSL connections

Client options:
	-b            - Run jobs in the background(false)
	-I            - Run jobs as high priority
	-L            - Run jobs as low priority
	-n            - Run one job per line(false)
	-N            - Same as -n, but strip off the newline(false)
	-P            - Prefix all output lines with functions names
	-s            - Send job without reading from standard input
	-u <unique>   - Unique key to use for job

Worker options:
	-c <count>    - Number of jobs for worker to run before exiting
	-n            - Send data packet for each line(false)
	-N            - Same as -n, but strip off the newline(false)
	-w            - Run in worker mode(false)
```


http://gearman.info/bin/gearadmin.html

gearadmin --status | sort -n | column -t

```
gearadmin --help

Options:
  --help                         Options related to the program.
  -h [ --host ] arg (=localhost) Connect to the host
  -p [ --port ] arg (=4730)      Port number or service to use for connection
  --server-version               Fetch the version number for the server.
  --server-verbose               Fetch the verbose setting for the server.
  --create-function arg          Create the function from the server.
  --cancel-job arg               Remove a given job from the server's queue
  --drop-function arg            Drop the function from the server.
  --show-unique-jobs             Show unique jobs on server.
  --show-jobs                    Show all jobs on the server.
  --getpid                       Get Process ID for the server.
  --status                       Status for the server.
  --priority-status              Queued jobs status by priority.
  --workers                      Workers for the server.
  -S [ --ssl ]                   Enable SSL connections.
```


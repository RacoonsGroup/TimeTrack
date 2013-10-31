root = "/home/deployer/tasktrack/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.stderr.log"
stdout_path "#{root}/log/unicorn.stdout.log"

listen "#{root}/tmp/sockets/tasktrack.sock"
worker_processes 2
timeout 30
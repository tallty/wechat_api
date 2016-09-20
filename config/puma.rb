# !/usr/bin/env puma

#rails 的运行环境
environment 'production'
threads 2, 64
workers 2

app_name = 'wechat_api'
application_path = "/home/deploy/#{app_name}"
directory application_path

pidfile "#{application_path}/tmp/pids/puma.pid"
state_path "#{application_path}/tmp/sockets/puma.state"
stdout_redirect "#{application_path}/log/puma.stdout.log", "#{application_path}/log/puma.stderr.log"
bind "unix://#{application_path}/tmp/sockets/#{app_name}.sock"
activate_control_app "unix://#{application_path}/tmp/sockets/pumactl.sock"

# 后台运行
daemonize true
on_restart do
  puts 'On restart...'
end
preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
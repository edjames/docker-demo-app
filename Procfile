web:      PORT=3000 rails s -b 192.168.0.99 -P tmp/pids/web.pid
sidekiq:  sidekiq -C config/sidekiq.yml -e development
filebeat: filebeat -c $PWD/config/filebeat.yml

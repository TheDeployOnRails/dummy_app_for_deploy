TheAppStartScripts
==================

Bash scripts for starting dev env of Rails App.

For example it can start `sphinx`, `delayed_job`, `sidekiq`, `unicorn`, etc.

1. Clone it to `#{RAILS.root}/script/`
2. Makes sripts executables `chmod 744 script/app/*.sh`
3. Setup vars in `script/app/_vars.sh`

```
/rails/app> script/app/init.sh

/rails/app> script/app/start.sh
/rails/app> script/app/stop.sh
```

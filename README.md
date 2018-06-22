# sql-operations-studio-docker
An attempt to run Microsoft SQL Operations Studio from a Docker container

#### What these scripts do
- Install SQL Operations Studio in the container
- Get the GUI to display on the host
- Keep the Docker container running once the program has been launched
  - The `run_and_monitor.sh` script should take care of this
- Save settings in the host folder `$HOME/.docker-apps/sqlops/`

#### How to use
- Build the container with `build.sh`
- Run the container with `run.sh`
- You can combine these with `build_and_run.sh`
- To enter a bash shell in the container, use `enter.sh`
- To configure a directory to be mounted in the container,
  set the `mount_dir` parameter in the `config.sh` script

Once I ran into a problem with my saved settings. SQL Operations Studio would
crash regularly when I ran a query or resized some of the panes. To fix this,
- Stop the Docker container
- Remove the saved settings: `rm -rf $HOME/.docker-apps/sqlops`
- Restart the Docker container with the `run.sh` or `enter.sh` script.

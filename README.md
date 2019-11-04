# CSGO-DS
A completely Dockerized Plug-and-Play dedicated server for Counter Strike: Global Offensive

## Usage Guide
This project allows anyone to create and run their own custom game server with minimal effort. It can be used to deploy to 
a remote server (such as an EC2 instance), or just run locally on your machine.

### Prerequisites
- Docker must be installed on your machine. You can install docker on any operating system.
  + [Windows](https://docs.docker.com/docker-for-windows/install/) | [Mac](https://docs.docker.com/docker-for-mac/install/) | [Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- A new Steam account is recommended for running a server, though not required. Docker will use "anonymous" otherwise.

### Setting Configurations
#### Environment
`CLI_USER_NAME`: Your Steam account's username. Defaults to `anonymous`.

`CLI_USER_PASS`: Your Steam account's password. Never hard code this! Defaults to a blank string.

*Note that ...*

#### `autoexec.cfg`
Much like your CS:GO client, the dedicated server also contains an `autoexec.cfg` that's executed when the server starts up. 
+ The two most important cvars that need to be set are simply `sv_cheats 0` and `sv_lan 0`.
+ You can also set a password here with `sv_password`, or a description with `hostname`.
+ Set tickrate here with `sv_maxupdaterate 128` and `sv_minupdaterate 128`.
+ *Do not* use `autoexec.cfg` for gameplay-related cvars - see below.

#### `server.cfg`
Options in `server.cfg` are sourced each time a new map loads. 
+ Use this file for cvars that are specific to server gameplay, irrespective of game mode.
+ Some examples might be `mp_limitteams`, `mp_warmuptime`, or `mp_deathdropgun`.

#### `gamemode_x_server.cfg`
Options in `gamemode_x_server.cfg` are sourced independently for each game mode and load after `server.cfg`.
+ Use this file for cvars specific to a game mode.
+ Some examples might be `mp_roundtime`, `mp_buytime`.

### Running the Server

<p align="center"><img src="https://1000logos.net/wp-content/uploads/2017/12/CSGO-Logo.png" alt="a cute dog" height="300"/></p>

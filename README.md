# Fedora Setup

- [Fedora Setup](#fedora-setup)
  - [Introduction](#introduction)
  - [1.   First things to do post installation](#1---first-things-to-do-post-installation)
    - [Setup`dnf` configuration](#setupdnf-configuration)
  - [2.   Setup the Terminal](#2---setup-the-terminal)
  - [3.   Setup SSH](#3---setup-ssh)
  - [4.   Install Compilers](#4---install-compilers)
  - [5.   Install CLI based applications](#5---install-cli-based-applications)
  - [6.   Install GUI based applications](#6---install-gui-based-applications)
  - [7.   Copy `.bashrc` and `.bash_aliases` in `$HOME`](#7---copy-bashrc-and-bash_aliases-in-home)
  - [8.   Customizations](#8---customizations)
  - [9.   Install FOSS toolchains for HW development](#9---install-foss-toolchains-for-hw-development)

## Introduction
This repo is a guide to how I setup my desktop machine using Fedora as my distro of choice. I use Fedora mostly for hardware and software development. This is the perfect guide if you're migrating to Linux for the first time and don't know where to start.

## 1.   First things to do post installation
### Setup`dnf` configuration
-   [Reference](https://dnf.readthedocs.io/en/latest/conf_ref.html)
-   Open the file: `sudo vi /etc/dnf/dnf.conf`
-   add the following lines:
    ```bash
    # added for speed
    fastestmirror=True
    max_parallel_downloads=5
    defaultyes=True
    keepcache=False
    ```
-   Update the system: `sudo dnf update`
-   Run the script `post_installation.sh`. This will do the following:
    -    enable rpm fusion
    -    enable flathub
    -    install media codecs
    -    install preload
    -    enable 3rd party reporsitories

## 2.   Setup the Terminal
-   Install git: `sudo dnf install -y git`
-   Clone the [dotfiles](https://github.com/usman1515/dotfiles) repo.
    ```bash
    git clone https://github.com/usman1515/dotfiles.git
    ```
-   Copy the git config from the dotfiles repo.
-   Install [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
    ```bash
    source install_nerd_fonts.sh
    ```
-   Install Alacritty
    ```bash
    sudo dnf install -y alacritty
    ```
-   copy the alacritty config folder from the dotfiles repo.
-   clone alacritty themes repo:
    ```bash
    git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
    ```
-   Install oh my posh
    ```bash
    source install_oh_my_posh.sh
    ```
-   Set terminal shortcut key
    -   Settings -> Keyboard -> View and customize shortcuts -> Custom shortcuts:
        -   **Name:** Open terminal
        -   **Command:** `/usr/bin/alacritty/`
        -   **Shortcut:** Super + Enter

## 3.   Setup SSH
-   Run the script `setup_ssh.sh` to generate SSH key.
    ```bash
    source ./setup_ssh.sh
    ```

## 4.   Install Compilers
-   [Languages & databases](https://developer.fedoraproject.org/tech.html)
    ```bash
    # install language compilers
    source install_compilers.sh
    # install docker
    source install_docker.sh
    ```

## 5.   Install CLI based applications
-   To install all the CLI and TUI based applications run the following command.
    ```bash
    source install_cli_packages.sh
    ```

## 6.   Install GUI based applications
-   To install all the GUI and RPM based applications run the following command.
    ```bash
    source install_gui_packages.sh
    ```

## 7.   Copy `.bashrc` and `.bash_aliases` in `$HOME`
    -   copy `.bashrc` and `.bash_aliases` in `$HOME` dir.
    ```bash
    cp -rv .bash* ~
    ```

## 8.   Customizations
-   Goto settings and do the following:
    -   Bluetooth
        -   Turn off
    -   Appearance:
        -   Dark
    -   Multitasking:
        -   Hot corners: off
        -   Fixed number of workspaces: 6
        -   Workspaces on all displays: on
        -   Include apps from current workspace only: on
    -   Power:
        -   Automatic screen brightness: off
        -   Show battery percentage: on
    -   Display
        -   Night light: on
        -   timings: 00:00 - 06:00
    -   Mouse and touchpad:
        -   Touchpad:
            -   Tap to click: on
            -   Scroll method: 2 finger
            -   Scroll direction: natural
    -   Region and Language:
        -   Formats: English (United Kingdom)
    -   Accessibility:
        -   Pointing and clicking:
            -    Locate pointer: on

## 9.   Install FOSS toolchains for HW development
-   **Optional**: These are some of the tools that I use for hardware development.
1.  Install [iverilog](https://github.com/steveicarus/iverilog) for RTL simulation.
2.  Install [yosys](https://github.com/YosysHQ/yosys) for RTL synthesis.
3.  Install [verilator](https://github.com/verilator/verilator) for converting Verilog and SystemVerilog designs into a C++ or SystemC model.
    ```bash
    source install_iverilog.sh
    source install_yosys.sh
    source install_verilator.sh
    ```
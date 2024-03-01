# Fedora Setup

- [Fedora Setup](#fedora-setup)
  - [Introduction](#introduction)
  - [1.   First things to do post installation](#1---first-things-to-do-post-installation)
    - [1.1 Setup `dnf` configuration](#11-setup-dnf-configuration)
    - [1.2 Copy `.bashrc` and `.bash_aliases` in `$HOME`](#12-copy-bashrc-and-bash_aliases-in-home)
  - [2.   Setup the Terminal](#2---setup-the-terminal)
    - [2.1 Install git](#21-install-git)
    - [2.2 Install Alacritty](#22-install-alacritty)
    - [2.3 Install Kitty](#23-install-kitty)
  - [3.   Setup SSH](#3---setup-ssh)
  - [4.   Install Compilers](#4---install-compilers)
  - [5.   Install CLI based tools and applications](#5---install-cli-based-tools-and-applications)
  - [6.   Install GUI based applications](#6---install-gui-based-applications)
  - [7.   Install Gtklp for remote printers](#7---install-gtklp-for-remote-printers)
  - [8.   Install FOSS toolchains for Hardware development](#8---install-foss-toolchains-for-hardware-development)
  - [9.   Customizations](#9---customizations)
  - [10. Optional: Upgrade Fedora](#10-optional-upgrade-fedora)

## Introduction
This repo is a guide to how I setup my desktop machine using Fedora as my distro of choice. I use Fedora mostly for hardware and software development. This is the perfect guide if you're migrating to Linux for the first time and don't know where to start.

## 1.   First things to do post installation
### 1.1 Setup `dnf` configuration
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

### 1.2 Copy `.bashrc` and `.bash_aliases` in `$HOME`
    ```bash
    cp -rv .bash_aliases .bashrc ~
    ```


## 2.   Setup the Terminal
### 2.1 Install git
-   Install git: `sudo dnf install -y git`
-   Clone this [dotfiles](https://github.com/usman1515/dotfiles) repo.
    ```bash
    git clone https://github.com/usman1515/dotfiles.git
    ```
-   Copy the git config from the dotfiles repo into the `$HOME` dir.

### 2.2 Install Alacritty
-   Install [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
    ```bash
    source install_nerd_fonts.sh
    ```
-   Install alacritty
    ```bash
    sudo dnf install -y alacritty
    ```
-   Copy the `alacritty` config folder from the dotfiles repo into `.config` folder.
-   Clone alacritty themes repo:
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

### 2.3 Install Kitty
-   Install kitty
    ```bash
    sudo dnf install -y kitty
    ```
-   Copy the `kitty` config folder from the `dotfiles` repo into `.config` folder.
<!-- -   To setup SSH on kitty  -->

## 3.   Setup SSH
-   Run the script `setup_ssh.sh` to generate SSH key.
    ```bash
    source ./setup_ssh.sh
    ```

## 4.   Install Compilers
-   [Languages & databases](https://developer.fedoraproject.org/tech.html)
    ```bash
    source install_compilers.sh
    ```

## 5.   Install CLI based tools and applications
-   To install all the CLI and TUI based applications run the following command.
    ```bash
    source install_cli_packages.sh
    ```

## 6.   Install GUI based applications
-   To install all the GUI and RPM based applications run the following command.
    ```bash
    source install_gui_packages.sh
    ```

## 7.   Install Gtklp for remote printers
-   TO setup remote printers on your network that use GNU GTKLP GUI run the following script.
    ```bash
    source install_printers.sh
    ```

## 8.   Install FOSS toolchains for Hardware development
**OPTIONAL**: These are some of the tools that I use for hardware development.
-   [GHDL](https://github.com/ghdl/ghdl) for VHDL simulation.
-   [iVerilog](https://github.com/steveicarus/iverilog) for Verilog simulation.
-   [Yosys](https://github.com/YosysHQ/yosys) for Verilog synthesis.
-   [Verilator](https://github.com/verilator/verilator) for converting Verilog and SystemVerilog designs into a C++ or SystemC model.
-   [Chisel](https://github.com/chipsalliance/chisel) for designing and testing RTL using Chisel/Scala.

    ```bash
    source install_ghdl.sh
    source install_iverilog.sh
    source install_yosys.sh
    source install_verilator.sh
    source install_chisel.sh
    ```

## 9.   Customizations
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

## 10. Optional: Upgrade Fedora
-   To upgrade fedora run the following script
    ```bash
    source upgrade_fedora.sh
    ```
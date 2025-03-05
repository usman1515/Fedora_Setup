#!/bin/bash

# https://www.chisel-lang.org/docs/installation

# NOTE: Verilator must be installed to simulate designs

# create dir Tools if it doesnt exist
[ -d ~/Tools ] || mkdir -p ~/Tools
cd ~/Tools

# install scala-cli
curl -fLo scala-cli.rpm https://github.com/Virtuslab/scala-cli/releases/latest/download/scala-cli-x86_64-pc-linux.rpm
sudo rpm -i scala-cli.rpm

# download and run test example
wget https://github.com/chipsalliance/chisel/releases/latest/download/chisel-example.scala
# run example
scala-cli chisel-example.scala

# install JDK
sudo dnf install -y java-17-openjdk-portable-sources
sudo dnf install -y java-17-openjdk

# install SBT
# remove old Bintray repo file
sudo rm -f /etc/yum.repos.d/bintray-rpm.repo || true
curl -L https://www.scala-sbt.org/sbt-rpm.repo > sbt-rpm.repo
sudo mv sbt-rpm.repo /etc/yum.repos.d/
sudo yum install sbt


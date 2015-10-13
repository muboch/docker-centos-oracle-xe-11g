#!/bin/bash

# Install OpenSSH
yum install -y openssh-server &&
mkdir /var/run/sshd &&
echo 'root:admin' | chpasswd &&
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config &&
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd &&
echo "export VISIBLE=now" >> /etc/profile &&

# Prepare to install Oracle
yum install -y initscripts libaio1 libaio net-tools bc &&

# do some stuff
mkdir /run/lock &&
mkdir /var/lock/subsys &&
mv /assets/chkconfig /sbin/chkconfig &&
chmod 755 /sbin/chkconfig &&

# Install Oracle
rpm -ivh /assets/oracle-xe-11.2.0-1.0.x86_64.rpm &&

# Backup listener.ora as template
cp /u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora /u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora.tmpl &&

mv /assets/init.ora /u01/app/oracle/product/11.2.0/xe/config/scripts &&
mv /assets/initXETemp.ora /u01/app/oracle/product/11.2.0/xe/config/scripts &&

printf 5555\\n1521\\noracle\\noracle\\ny\\n | /etc/init.d/oracle-xe configure &&

echo 'export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe' >> /etc/bash.bashrc &&
echo 'export PATH=$ORACLE_HOME/bin:$PATH' >> /etc/bash.bashrc &&
echo 'export ORACLE_SID=XE' >> /etc/bash.bashrc &&

# Install startup script for container
mv /assets/startup.sh /usr/sbin/startup.sh &&
chmod +x /usr/sbin/startup.sh &&

# Remove installation files
rm -r /assets/


exit $?

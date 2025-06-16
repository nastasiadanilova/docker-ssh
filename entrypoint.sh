#!/bin/bash

# Генерация SSH ключей
ssh-keygen -A

# Подготовка логов
touch /var/log/auth.log
chmod 666 /var/log/auth.log

# Очистка сокета fail2ban
rm -f /var/run/fail2ban/fail2ban.sock

# Запуск служб
service rsyslog start
service fail2ban start

# Блокировка SSH
iptables -C INPUT -p tcp --dport 22 -j DROP 2>/dev/null || iptables -I INPUT -p tcp --dport 22 -j DROP

# Запуск knockd
knockd -c /etc/knockd.conf -D &
# Запуск SSH
exec /usr/sbin/sshd -D

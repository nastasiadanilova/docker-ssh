SSH Security Lab: Fail2Ban + Port Knocking + Docker

Этот проект демонстрирует настройку защищённого SSH-сервера с использованием:

- **Port Knocking** для скрытия доступа к порту SSH
- **Fail2Ban** для блокировки атак по паролю
- **Docker** для изоляции сервиса и атаки

Состав проекта:

docker-ssh/
├── docker-compose.yml
├── Dockerfile-server # Образ для secure-ssh
├── Dockerfile-attacker # Образ для attacker
├── entrypoint.sh # Стартовый скрипт secure-ssh
├── sshd_config # Настройки SSH
├── jail.local # Настройки fail2ban
├── knockd.conf # Настройки portknocking
├── attack.sh # Сценарий атаки

1. Установи [Docker Desktop](https://www.docker.com/products/docker-desktop) и запусти его
2. Клонируй репозиторий:

```bash
git clone https://github.com/nastasiadanilova/docker-ssh
cd docker-ssh
docker compose build
docker compose up --abort-on-container-exit

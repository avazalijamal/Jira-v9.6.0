SysV Init Script Düzenleme
1. Jira SysV Başlatma Scriptini Düzenleyin:

Jira servis scriptini (genellikle /etc/init.d/jira konumunda bulunur) tercih ettiğiniz metin düzenleyiciyle açın. Örneğin, nano kullanarak:


----------------------------
sudo nano /etc/init.d/jira
----------------------------



2. Başlangıç Seviyelerini Ekleyin:

Scriptin en üstünde, genellikle yorumlar bölümünde bulunan Default-Start ve Default-Stop satırlarını eklediğinizden veya düzenlediğinizden emin olun. Aşağıdaki satırları ekleyin veya mevcutsa düzenleyin:


------------------------------
#!/bin/sh
### BEGIN INIT INFO
# Provides:          jira
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start jira at boot time
# Description:       Enable service provided by jira.
### END INIT INFO
------------------------------

3. Kaydedin ve Çıkın:

Dosyayı kaydedin ve metin düzenleyiciden çıkın.

4. Servisi Etkinleştirin:

Şimdi servisi tekrar etkinleştirmeyi deneyin:

-----------------------------------
sudo systemctl enable jira.service
-----------------------------------

Alternatif: Systemd Servis Dosyası Oluşturma
Eğer sorun devam ederse, Jira için bir systemd servis dosyası manuel olarak oluşturabilirsiniz:

1. Systemd Servis Dosyası Oluşturun:

Jira servisi için yeni bir dosya oluşturun:

--------------------------------------------
sudo nano /etc/systemd/system/jira.service
--------------------------------------------

2. Servisi Tanımlayın:

Aşağıdaki içeriği dosyaya ekleyin ve yolları ve seçenekleri gerektiği gibi ayarlayın:

------------------------------------------------------
[Unit]
Description=JIRA Service
After=network.target

[Service]
Type=forking
User=jira
Group=jira
ExecStart=/opt/atlassian/jira/bin/start-jira.sh
ExecStop=/opt/atlassian/jira/bin/stop-jira.sh
PIDFile=/opt/atlassian/jira/work/catalina.pid
Restart=on-failure

[Install]
WantedBy=multi-user.target
------------------------------------------------------

3. Systemd'i Yeniden Yükleyin ve Servisi Etkinleştirin:

Systemd yönetici yapılandırmasını yeniden yükleyin ve Jira servisini etkinleştirin:

--------------------------------------
sudo systemctl daemon-reload
sudo systemctl enable jira.service
--------------------------------------

4. Servisi Başlatın:

Son olarak, Jira servisini başlatın:

------------------------------------
sudo systemctl start jira.service
------------------------------------

Bu adımları takip ederek jira servisini başarılı bir şekilde etkinleştirebilir ve başlatabilirsiniz.
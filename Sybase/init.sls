
policycoreutils-python:
  pkg.installed

centos-release-scl-rh:
  pkg.installed

python27:
  pkg.installed:
    - require:
      - pkg: centos-release-scl-rh

freetds:
  pkg.installed

freetds-devel:
  pkg.installed

/etc/freetds.conf:
  file.managed:
    - source: salt://python27/freetds.conf
    - user: root
    - group: root
    - mode: 644

/etc/odbc.ini:
  file.managed:
    - source: salt://python27/odbc.ini
    - user: root
    - group: root
    - mode: 644

/etc/odbcinst.ini:
  file.managed:
    - source: salt://python27/odbcinst.ini
    - user: root
    - group: root
    - mode: 644

#google-cloud-sdk:
#  archive.extracted:
#    - name: /usr/local/share/google/
#    - source: salt://python27/google-cloud-sdk.tar.gz
#    - tar_options: xz
#    - archive_format: tar
#    - if_missing: /usr/local/share/google/google-cloud-sdk
#    - user: root
#    - group: root
#
#gcloud:
#  cmd.wait:
#    - name: "/usr/local/share/google/google-cloud-sdk/install.sh"
#    - watch:
#      - archive: google-cloud-sdk

pip:
  cmd.wait:
    - name: "/usr/bin/scl enable python27 'easy_install pip'"
    - watch:
      - pkg: python27

pip_upgrade:
  cmd.run:
    - name: " /usr/bin/scl enable python27 'pip install --upgrade pip'"

sendgrid:
  cmd.wait:
    - name: "/usr/bin/scl enable python27 'pip install sendgrid==1.3.0'"
    - watch:
      - cmd: pip

certifi:
  cmd.wait:
    - name: "/usr/bin/scl enable python27 'pip install certifi'"
    - watch:
      - cmd: pip

oauth2client:
  cmd.wait:
    - name: "/usr/bin/scl enable python27 'pip install oauth2client==1.5.2'"
    - watch:
      - cmd: pip

httplib2:
  cmd.wait:
    - name: "/usr/bin/scl enable python27 'pip install httplib2'"
    - watch:
      - cmd: pip

urllib3:
  cmd.wait:
    - name: "/usr/bin/scl enable python27 'pip install urllib3'"
    - watch:
      - cmd: pip

google-api-python-client:
  cmd.wait:
    - name: "/usr/bin/scl enable python27 'pip install --upgrade google-api-python-client'"
    - watch:
      - cmd: pip

pytz:
  cmd.wait:
    - name: "/usr/bin/scl enable python27 'pip install pytz'"
    - watch:
      - cmd: pip

veryprettytable:
  cmd.run:
    - name: "/usr/bin/scl enable python27 'pip install veryprettytable'"
pyOpenSSL:
  cmd.run:
    - name: "/usr/bin/scl enable python27 'pip install pyOpenSSL'"
plivo:
  cmd.run:
    - name: "/usr/bin/scl enable python27 'pip install plivo'"
stormpath:
  cmd.run:
    - name: "/usr/bin/scl enable python27 'pip install stormpath'"
okta:
  cmd.run:
    - name: "/usr/bin/scl enable python27 'pip install git+https://github.com/atrp/okta-sdk-python.git'"
ndg-httpsclient:
  cmd.run:
    - name: "/usr/bin/scl enable python27 'pip install ndg-httpsclient'"
progressbar2:
  cmd.run:
    - name: "/usr/bin/scl enable python27 'pip install progressbar2'"
mysql-python:
  cmd.run:
    - name: "/usr/bin/scl enable python27 'pip install mysql-python'"
xlsx2csv:
  cmd.run:
    - name: "/usr/bin/scl enable python27 'pip install xlsx2csv'"
phonenumbers:
  cmd.run:
    - name: "/usr/bin/scl enable python27 'pip install phonenumbers'"
googlecloud:
  cmd.run:
    - name: "/usr/bin/scl enable python27 'pip install google-cloud-bigquery'"

egenix-mx-base:
  cmd.run:
    - name: "/usr/bin/scl enable python27 'pip install egenix-mx-base'"

/home/aaron_bostick/python_sybase-0.40-py2.7-linux-x86_64.egg:
  file.managed:
    - source: salt://python27/python_sybase-0.40-py2.7-linux-x86_64.egg
    - user: aaron_bostick
    - group: aaron_bostick
    - mode: 644

python-sybase:
  cmd.wait:
    - name: "/usr/bin/scl enable python27 'easy_install /home/aaron_bostick/python_sybase-0.40-py2.7-linux-x86_64.egg'"
    - watch:
      - file: /home/aaron_bostick/python_sybase-0.40-py2.7-linux-x86_64.egg

#!/bin/bash
ssh tb@g16-hh.de 'mkdir /var/www/g16/docs'
ssh tb@g16-hh.de 'mkdir /var/www/g16/docs/shared'
ssh tb@g16-hh.de 'mkdir /var/www/g16/docs/shared/config'
ssh tb@g16-hh.de 'mkdir /var/www/g16/docs/releases'
scp ~/Dropbox/Rails/G16/g16_docs/config/database.yml tb@g16-hh.de:/var/www/g16/docs/shared/config/
scp ~/Dropbox/Rails/G16/g16_docs/config/application.yml tb@g16-hh.de:/var/www/g16/docs/shared/config/

#!/bin/bash

bin/rake db:create &&
bin/rake db:migrate &&
bin/rake db:seed &&
bin/rails s -b 0.0.0.0
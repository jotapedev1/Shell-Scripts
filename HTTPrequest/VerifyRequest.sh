#!/bin/bash

response=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)

if [ $response -ne 200 ]
then
mail -s "Server is down!" jotape5195@mail.com<<del
Olá, Houve um problema no servidor, não sei o que aconteceu, mas você precisa resolver!
del
	sudo systemctl restart apache2
fi

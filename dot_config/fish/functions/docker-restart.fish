function docker-restart
	 command docker-compose down -t0 $argv
	 command docker-compose up --build
end
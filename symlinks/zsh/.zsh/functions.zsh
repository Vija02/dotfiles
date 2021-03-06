function killport(){
	sudo fuser -k $1/tcp
}

function dps(){ 
	docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Status}}" | (read -r; printf "%s\n" "$REPLY"; sort -k 2 ) 
}

function up(){ 
	docker-compose up -d
}

function gogo(){
	BRANCH=$(git branch | grep \* | cut -d ' ' -f2)
	git push -u origin $BRANCH
}

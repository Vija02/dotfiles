function killport(){
	sudo fuser -k $1/tcp
}

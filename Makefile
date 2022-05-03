.PHONY: all

###############################################################################
##default app and image names
##
APP_NAME		:= scheduler		## default app name
DB_IMAGE_NAME		:= scheduler_db		## default database image name
BACKEND_IMAGE_NAME	:= scheduler_backend	## default backend image name
FRONTEND_IMAGE_NAME	:= scheduler_frontend	## default frontend image name
DEFAULT_TAG		:= latest		## defualt tag for all images
##
###############################################################################

# helper to get all descriptions for each target in console
help: ##			Show this help.
		@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

start-app: ##		start app with docker-compose
		docker-compose --project-name $(strip $(APP_NAME)) up

remove-app: ##		remove old app from docker
		docker-compose down $(APP_NAME)

remove-database-image: ##	remove database image
ifeq ($(shell docker image inspect $(DB_IMAGE_NAME) > /dev/null 2>&1; echo $$?), 0)	
	docker rmi --force $(strip $(DB_IMAGE_NAME)):$(strip $(DEFAULT_TAG))
	@echo Database Image removed
endif

remove-backend-image: ##	remove backend image
ifeq ($(shell docker image inspect $(BACKEND_IMAGE_NAME) > /dev/null 2>&1; echo $$?), 0)	
	docker rmi --force $(strip $(BACKEND_IMAGE_NAME)):$(strip $(DEFAULT_TAG))
	@echo Backend Image removed
endif

remove-frontend-image: ##	remove frontend image
ifeq ($(shell docker image inspect $(FRONTEND_IMAGE_NAME) > /dev/null 2>&1; echo $$?), 0)	
	docker rmi --force $(strip $(FRONTEND_IMAGE_NAME)):$(strip $(DEFAULT_TAG))
	@echo Frontend Image removed
endif

remove-images: ##		remove old images of database, backend and frontend
remove-images: remove-database-image remove-backend-image remove-frontend-image

build-backend-image: ##	runs the docker build steps for the backend image
		docker build -t $(strip $(BACKEND_IMAGE_NAME)):$(strip $(DEFAULT_TAG)) ./backend

build-frontend-image: ##	runs the docker build steps for the frontend image
		docker build -t $(strip $(FRONTEND_IMAGE_NAME)):$(strip $(DEFAULT_TAG)) ./frontend
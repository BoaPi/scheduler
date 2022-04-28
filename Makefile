.PHONY: help remove-app remove-images setup build-all-images build-backend-image build-frontend-image

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

remove-app: ##		remove old app from docker
		docker-compose down $(APP_NAME)

remove-images: ##		remove old images of database, backend and frontend
		docker rmi --force $(strip $(DB_IMAGE_NAME)):$(strip $(DEFAULT_TAG))
		docker rmi --force $(strip $(BACKEND_IMAGE_NAME)):$(strip $(DEFAULT_TAG))
		docker rmi --force $(strip $(FRONTEND_IMAGE_NAME)):$(strip $(DEFAULT_TAG))

build-backend-image: ##	runs the docker build steps for the backend image
		docker build -t $(strip $(BACKEND_IMAGE_NAME)):$(strip $(DEFAULT_TAG)) ./backend
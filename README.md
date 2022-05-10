# scheduler

> **Disclaimer:** this project is build for education purpose only.
> The goal is to into new technologies and workflows.

- [scheduler](#scheduler)
  - [Prerequisite](#prerequisite)
  - [Requirements of the App](#requirements-of-the-app)
  - [Tech Stack](#tech-stack)
  - [Next Steps](#next-steps)

## Prerequisite

* Docker 20.10.14
* Go 1.18.1
* VS Code
* VS Code Extension [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) to develop inside the frontend image itself
* VS Code Extension [Svelte for VS Code](https://marketplace.visualstudio.com/items?itemName=svelte.svelte-vscode)

## Requirements of the App

The app should provide an easy to use school lesson scheduler. The teachers/tutors should be able to maintain the lessons of several classes.

The app should do all the validity checks, e.g.:

- no double booking of teachers/tutors
- no overbooking of classes
- no overbooking of rooms
- **more to be defined**

The app should provide an interface to:

- adding and editing new teachers/tutors
- adding and editing
  - major and minor subject to each teacher/tutor
  - rooms
  - classes
  - school subjects, e.g. how many lessons of each subject should there be
- **more to be defined**

## Tech Stack

| Part           | Technology |
| -------------- | ---------- |
| Database       | PostgreSQL |
| Backend / API  | Golang     |
| Frontend/ UI   | Svelte     |
| Virtualization | Docker     |
| Build Tool     | Makefile   |

## Next Steps

- [x] add dockerfile for frontend
- [x] add frontend to docker-compose file
- [x] getting node_modules from Docker image back into VSCode
- [ ] create first table in database
- [ ] create first API endpoint to fetch data from database
- [ ] create first site in frontend to use the new API endpoint
- [ ] create concept of database tables
- [ ] create architecture of API
- [ ] create concept of frontend views
